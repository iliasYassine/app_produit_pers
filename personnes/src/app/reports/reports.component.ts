import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
import { Transaction } from '../caisse/transaction.model';


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
  constructor(private report_service: ReportServiceService) {}
  coutTotal: number = 0;
  topVente:number=0;
  nom_prod:string='';


  getjsondatatopvente(): void {
    this.report_service.get_top1().subscribe((response) => {
      this.topVente = response.top_vente.produit_id;
      this.nom_prod=response.nomProd; 
      
      
    });
  }
///this.report_service.getProduitReport() : on fait appel a une methode de service 
///.subscribe : permet de sabonner a un observable que veut dire saboner ? 
///la variable represente les datas 
////

  getcout():void{
    this.report_service.getProduitReport().subscribe( (produits) => {
        this.produit_report = produits;
        this.coutTotal = this.report_service.calculCout(this.produit_report);
      });
  }



  ngOnInit(): void {
        this.getcout();
          
        this.getjsondatatopvente();
      }
    
  }

 

  


  



