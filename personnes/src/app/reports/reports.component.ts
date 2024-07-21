import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
Chart.register(...registerables);

@Component({
  selector: 'app-reports',
  standalone: true,
  imports: [],
  templateUrl: './reports.component.html',
  styleUrl: './reports.component.css'
})
export class ReportsComponent implements OnInit{
  produit_report: Produit[] = [];
  constructor(private report_service: ReportServiceService) {}
  coutTotal: number = 0;
  

  
  public config: any = {
    type: 'pie',
    data: {
      labels: ['Produit A', 'Produit B', 'Produit C'], // example labels
      datasets: [{
        label: 'Coût Total',
        data: [1336, 1598, 2145], // replace with dynamic data
        backgroundColor: ['red', 'blue', 'green'], // example colors
      }],
    },
    options: {
      responsive: true,
      // other options here
    }
  };
  chart:any;

  
 

  ngOnInit(): void {
    this.report_service.getProduitReport().subscribe({
      next: (produits) => {
        this.produit_report = produits;
        this.coutTotal = this.report_service.calculCout(this.produit_report);
        
       this.chart=new Chart('pieCanvas',this.config);
  
      },
      error: (err) => {
        console.error(err);
      }
    });
  }




  
  }
  


  



