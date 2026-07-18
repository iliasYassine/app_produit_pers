import { Component, OnInit, OnDestroy, PLATFORM_ID, Inject } from '@angular/core';
import { CommonModule, DecimalPipe, isPlatformBrowser } from '@angular/common';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
import { Transaction } from '../caisse/transaction.model';

import ChartDataLabels from 'chartjs-plugin-datalabels';
import { CapitalService } from '../capital/capital.service';


@Component({
  selector: 'app-reports',
  standalone: true,
  imports: [CommonModule, DecimalPipe],
  templateUrl: './reports.component.html',
  styleUrl: './reports.component.css'
})
export class ReportsComponent implements OnInit, OnDestroy {
  produit_report: Produit[] = [];
  top_vente:Transaction[]=[];
  
  coutTotal: number = 0;
  profitFutur: number = 0;
  caFutur: number = 0;
  topVente:number=0;
  nom_prod:string='';
  top3Ventes: { produit_id: number, nomProd: string, qte_totale: number }[] = [];
  chiffreAffaireTotal: number = 0;
  benefice:number=0;
  beneficeParMois: any[] = [];
  beneficeParSemaine: any[] = [];
  caParJourLabel: string = '';
  modeMoisActif: boolean = false;

  soldeBancaire: number = 0;
  totalCapital: number = 0;
  get beneficeSociete(): number { return this.soldeBancaire - this.totalCapital; }

  private moisChart: Chart | null = null;
  private semaineChart: Chart | null = null;
  private jourChart: Chart | null = null;

constructor(
    private report_service: ReportServiceService,
    private capitalService: CapitalService,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {
    if (isPlatformBrowser(this.platformId)) {
      Chart.register(...registerables, ChartDataLabels);
    }
  }
  ngOnInit(): void {
    this.getcout();
    this.getChiffreAffairesTotal();
    this.getjsondatatopvente();
    this.getTop3Ventes();
    this.loadBeneficeParMois();
    this.loadBeneficeParSemaine();
    this.loadCAParJourSemaineCourante();
    this.capitalService.getSoldeBancaire().subscribe(data => {
      this.soldeBancaire = Number(data.solde_bancaire);
    });
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

  getTop3Ventes(): void {
    this.report_service.getTop3Ventes().subscribe((data) => {
      this.top3Ventes = data;
    });
  }

  private formatDateISO(d: Date): string {
    const y = d.getFullYear();
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${y}-${m}-${day}`;
  }

  private getLundiDeLaSemaine(date: Date): Date {
    const d = new Date(date);
    const jour = d.getDay(); // 0 = dimanche, 1 = lundi...
    const diff = jour === 0 ? -6 : 1 - jour;
    d.setDate(d.getDate() + diff);
    d.setHours(0, 0, 0, 0);
    return d;
  }

  loadCAParJourSemaineCourante(): void {
    this.modeMoisActif = false;
    const lundi = this.getLundiDeLaSemaine(new Date());
    const dimanche = new Date(lundi);
    dimanche.setDate(lundi.getDate() + 6);
    this.caParJourLabel = `Semaine du ${lundi.toLocaleDateString('fr-FR')} au ${dimanche.toLocaleDateString('fr-FR')}`;
    this.chargerEtAfficherCAParJour(lundi, dimanche);
  }

  loadCAParJourMois(dateDansLeMois: Date): void {
    this.modeMoisActif = true;
    const premierJour = new Date(dateDansLeMois.getFullYear(), dateDansLeMois.getMonth(), 1);
    const dernierJour = new Date(dateDansLeMois.getFullYear(), dateDansLeMois.getMonth() + 1, 0);
    this.caParJourLabel = `Mois de ${premierJour.toLocaleDateString('fr-FR', { month: 'long', year: 'numeric' })}`;
    this.chargerEtAfficherCAParJour(premierJour, dernierJour);
  }

  private chargerEtAfficherCAParJour(debut: Date, fin: Date): void {
    this.report_service.getChiffreAffaireParJour(this.formatDateISO(debut), this.formatDateISO(fin)).subscribe((data) => {
      const parJour = new Map<string, number>();
      data.forEach(item => parJour.set(item.jour, parseFloat(item.chiffre_affaires)));

      const jours: Date[] = [];
      const valeurs: number[] = [];
      const cursor = new Date(debut);
      while (cursor <= fin) {
        jours.push(new Date(cursor));
        valeurs.push(parJour.get(this.formatDateISO(cursor)) || 0);
        cursor.setDate(cursor.getDate() + 1);
      }
      this.displayCAParJourChart(jours, valeurs);
    });
  }

  displayCAParJourChart(jours: Date[], valeurs: number[]) {
    if (!isPlatformBrowser(this.platformId)) return;
    const labels = jours.map(d => d.toLocaleDateString('fr-FR', { weekday: 'short', day: '2-digit', month: '2-digit' }));

    const canvas = document.getElementById('caParJourChart') as HTMLCanvasElement;
    const ctx = canvas?.getContext('2d');
    if (!ctx) return;

    this.jourChart?.destroy();
    this.jourChart = new Chart('caParJourChart', {
      type: 'bar',
      data: {
        labels,
        datasets: [{
          label: "Chiffre d'affaires (€)",
          data: valeurs,
          backgroundColor: 'rgba(56, 189, 248, 0.5)',
          borderColor: 'rgba(14, 165, 233, 1)',
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
            formatter: (v: number) => v > 0 ? v.toFixed(0) + '€' : '',
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

  getcout():void{
    this.report_service.getProduitReport().subscribe( (produits) => {
        this.produit_report = produits;
        this.coutTotal = parseFloat(this.report_service.calculCout(this.produit_report).toFixed(2));
        this.profitFutur = parseFloat(this.report_service.calculProfitFutur(this.produit_report).toFixed(2));
        this.caFutur = parseFloat(this.report_service.calculCAFutur(this.produit_report).toFixed(2));
      });
  }

  ngOnDestroy() {
    this.moisChart?.destroy();
    this.semaineChart?.destroy();
    this.jourChart?.destroy();
  }

  reinitilise(){
    this.report_service.reinitilsie().subscribe(()=>{
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
  if (!isPlatformBrowser(this.platformId)) return;
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

  this.moisChart?.destroy();
  this.moisChart = new Chart('beneficeMoisChart', {
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
  if (!isPlatformBrowser(this.platformId)) return;
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

  this.semaineChart?.destroy();
  this.semaineChart = new Chart('beneficeSemaineChart', {
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
      onClick: (evt, elements) => {
        if (elements.length > 0) {
          const index = elements[0].index;
          const semaine = this.beneficeParSemaine[index]?.semaine;
          if (semaine) {
            this.loadCAParJourMois(new Date(semaine));
          }
        }
      },
      onHover: (evt, elements) => {
        const target = evt.native?.target as HTMLElement;
        if (target) target.style.cursor = elements.length > 0 ? 'pointer' : 'default';
      },
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
