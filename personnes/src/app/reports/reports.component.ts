import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
import { Transaction } from '../caisse/transaction.model';
import { LignesTransaction } from '../caisse/ligne.model';
import ChartDataLabels from 'chartjs-plugin-datalabels';




@Component({
  selector: 'app-reports',
  standalone: true,
  imports: [],
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


constructor(private report_service: ReportServiceService,) {
    Chart.register(...registerables,ChartDataLabels)
  }
  ngOnInit(): void {
    this.getcout();
    this.getChiffreAffairesTotal();
    this.getjsondatatopvente();
     this.loadBeneficeParMois();
  this.loadBeneficeParSemaine();
    
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
    return date.toLocaleString('fr-FR', { month: 'long', year: 'numeric' });
  });
  const benefices = this.beneficeParMois.map(item => item.benefice);

  new Chart('beneficeMoisChart', {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Bénéfice (€)',
          data: benefices,
          backgroundColor: 'rgba(54, 162, 235, 0.5)'
        }
      ]
    },
    options: {
      plugins: {
        datalabels: {
          anchor: 'center', // <-- centré sur la barre
          align: 'center',  // <-- centré verticalement
          formatter: function(value) {
            return value + '€';
          },
          font: {
            weight: 'bold'
          }
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
    end.setDate(start.getDate() + 6); // Ajoute 6 jours pour la fin de semaine
    const startStr = start.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit' });
    const endStr = end.toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit' });
    return `${startStr} au ${endStr}`;
  });
  const data = this.beneficeParSemaine.map(item => item.benefice);

  new Chart('beneficeSemaineChart', {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Bénéfice (€)',
        data: data,
        backgroundColor: 'rgba(255, 99, 132, 0.5)'
      }]
    },
    options: {
      plugins: {
        datalabels: {
          anchor: 'center',
          align: 'center',
          formatter: function(value) {
            return value + '€';
          },
          font: {
            weight: 'bold'
          }
        }
      }
    },
    plugins: [ChartDataLabels]
  });
}
    
 
}
