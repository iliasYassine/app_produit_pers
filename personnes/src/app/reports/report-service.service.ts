import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ReportsComponent } from './reports.component';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';

@Injectable({
  providedIn: 'root'
})
export class ReportServiceService {

  private API_URL ='http://127.0.0.1:8000/transcript/produits/';


  constructor(private httpClient:HttpClient) { }

  getProduitReport():Observable<Produit[]>{
    return this.httpClient.get<Produit[]>(this.API_URL);
  }

  calculCout(produits: Produit[]): number {
    return produits.reduce((acc, produit) => acc + produit.prixAchat * produit.qte, 0);
  }
}
