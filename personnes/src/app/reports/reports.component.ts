import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit/produit.model';
import { ReportServiceService } from './report-service.service';
import { Chart,registerables } from 'chart.js';
import { Transaction } from '../caisse/transaction.model';
import { LignesTransaction } from '../caisse/ligne.model';


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
  chiffreAffaireTotal: number = 0;
  benefice:number=0;

  ngOnInit(): void {
    this.getcout();
    this.getChiffreAffairesTotal();
    this.getjsondatatopvente();
    
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

  
    
  }

 

  


  



