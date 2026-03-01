import { Component, OnInit } from '@angular/core';
import { CommonModule, DecimalPipe } from '@angular/common';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
import { Transaction } from '../caisse/transaction.model';
import { LignesTransaction } from '../caisse/ligne.model';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { CapitalService } from '../capital/capital.service';


@Component({
  selector: 'app-reports',
  standalone: true,
  imports: [CommonModule, DecimalPipe],
  templateUrl: './reports.component.html',
  styleUrl: './reports.component.css'
})
export class ReportsComponent implements OnInit{
  produit_report: Produit[] = [];
  top_vente:Transaction[]=[];
  
  coutTotal: number = 0;
  topVente:number=0;
  nom_prod:string='';
  chiffreAffaireTotal: number = 0;
  benefice:number=0;
  beneficeParMois: any[] = [];
  beneficeParSemaine: any[] = [];

  soldeBancaire: number = 0;
  totalCapital: number = 0;
  get beneficeSociete(): number { return this.soldeBancaire - this.totalCapital; }


constructor(private report_service: ReportServiceService, private capitalService: CapitalService) {
    Chart.register(...registerables,ChartDataLabels)
  }
  ngOnInit(): void {
    this.getcout();
    this.getChiffreAffairesTotal();
    this.getjsondatatopvente();
    this.loadBeneficeParMois();
    this.loadBeneficeParSemaine();
    this.soldeBancaire = parseFloat(localStorage.getItem('soldeBancaire') || '0');
    this.capitalService.getAssocies().subscribe(associes => {
      this.totalCapital = associes.reduce((sum, a) => sum + Number(a.solde), 0);
    });
  }


  
  getChiffreAffairesTotal():void{
    this.report_service.getChiffreAffairesTotal().subscribe((data)=>{
      this.chiffreAffaireTotal=data.chiffre_affaires;
      this.getbenefice();
    })
  }
 
  getbenefice(){
    this.report_service.getbenefice().subscribe((data)=>{
      this.benefice=data.benefice;
      console.log("Benefice:", this.benefice);
    });
  }


  getjsondatatopvente(): void {
    this.report_service.get_top1().subscribe((response) => {
      this.topVente = response.top_vente.produit_id;
      this.nom_prod=response.nomProd; 
      
      
    });
  }

  getcout():void{
    this.report_service.getProduitReport().subscribe( (produits) => {
        this.produit_report = produits;
        this.coutTotal = parseFloat(this.report_service.calculCout(this.produit_report).toFixed(2));
      });
  }

  reinitilise(){
    this.report_service.reinitilsie().subscribe(data=>{
      this.getChiffreAffairesTotal();
    })
    
    
  }

  loadBeneficeParMois() {
  this.report_service.getBeneficeParMois().subscribe(data => {
    this.beneficeParMois = data;
    this.displayBeneficeMoisChart();
  });
}

loadBeneficeParSemaine() {
  this.report_service.getBeneficeParSemaine().subscribe(data => {
    this.beneficeParSemaine = data;
    this.displayBeneficeSemaineChart();
  });
   }

displayBeneficeMoisChart() {
  const labels = this.beneficeParMois.map(item => {
    const date = new Date(item.mois);
    return date.toLocaleString('fr-FR', { month: 'short', year: 'numeric' });
  });
  const benefices = this.beneficeParMois.map(item => parseFloat(item.benefice));

  const canvas = document.getElementById('beneficeMoisChart') as HTMLCanvasElement;
  const ctx = canvas?.getContext('2d');
  if (!ctx) return;

  const gradient = ctx.createLinearGradient(0, 0, 0, 280);
  gradient.addColorStop(0, 'rgba(139, 92, 246, 0.35)');
  gradient.addColorStop(1, 'rgba(139, 92, 246, 0.0)');

  new Chart('beneficeMoisChart', {
    type: 'line',
    data: {
      labels,
      datasets: [{
        label: 'Bénéfice (€)',
        data: benefices,
        backgroundColor: gradient,
        borderColor: 'rgba(139, 92, 246, 1)',
        borderWidth: 2,
        pointBackgroundColor: '#18181b',
        pointBorderColor: 'rgba(139, 92, 246, 1)',
        pointBorderWidth: 2,
        pointRadius: 4,
        pointHoverRadius: 6,
        fill: true,
        tension: 0.4
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { display: false },
        tooltip: {
          backgroundColor: '#18181b',
          titleColor: '#52525b',
          bodyColor: '#ffffff',
          borderColor: 'rgba(255,255,255,0.07)',
          borderWidth: 1,
          padding: 12,
          cornerRadius: 10,
          callbacks: { label: ctx => ` ${ctx.parsed.y.toFixed(2)} €` }
        },
        datalabels: { display: false }
      },
      scales: {
        x: {
          grid: { display: false },
          border: { display: false },
          ticks: { color: '#52525b', font: { size: 11 } }
        },
        y: {
          grid: { color: 'rgba(255,255,255,0.04)', drawTicks: false },
          border: { display: false },
          ticks: { color: '#52525b', font: { size: 11 }, padding: 8, callback: val => val + '€' }
        }
      }
    },
    plugins: [ChartDataLabels]
  });
}

displayBeneficeSemaineChart() {
  const labels = this.beneficeParSemaine.map(item => {
    const start = new Date(item.semaine);
    const end = new Date(start);
    end.setDate(start.getDate() + 6);
    const startStr = start.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit' });
    const endStr = end.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit' });
    return `${startStr}→${endStr}`;
  });
  const data = this.beneficeParSemaine.map(item => parseFloat(item.benefice));

  const maxVal = Math.max(...data);

  new Chart('beneficeSemaineChart', {
    type: 'bar',
    data: {
      labels,
      datasets: [{
        label: 'Bénéfice (€)',
        data,
        backgroundColor: data.map(v =>
          v === maxVal ? 'rgba(52, 211, 153, 0.85)' : 'rgba(139, 92, 246, 0.5)'
        ),
        borderColor: data.map(v =>
          v === maxVal ? 'rgba(16, 185, 129, 1)' : 'rgba(139, 92, 246, 0.8)'
        ),
        borderWidth: 1,
        borderRadius: 8,
        borderSkipped: false
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { display: false },
        tooltip: {
          backgroundColor: '#18181b',
          titleColor: '#52525b',
          bodyColor: '#ffffff',
          borderColor: 'rgba(255,255,255,0.07)',
          borderWidth: 1,
          padding: 12,
          cornerRadius: 10,
          callbacks: { label: ctx => ` ${ctx.parsed.y.toFixed(2)} €` }
        },
        datalabels: {
          anchor: 'end',
          align: 'top',
          formatter: v => v.toFixed(0) + '€',
          font: { weight: 'bold', size: 10 },
          color: '#71717a'
        }
      },
      scales: {
        x: {
          grid: { display: false },
          border: { display: false },
          ticks: { color: '#52525b', font: { size: 10 } }
        },
        y: {
          grid: { color: 'rgba(255,255,255,0.04)', drawTicks: false },
          border: { display: false },
          ticks: { color: '#52525b', font: { size: 11 }, padding: 8, callback: val => val + '€' }
        }
      }
    },
    plugins: [ChartDataLabels]
  });
}
    
 
}
