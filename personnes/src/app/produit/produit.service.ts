import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Produit } from './produit.model';
@Injectable({
  providedIn: 'root'
})
export class ProduitService {
  private API_URL ='http://127.0.0.1:8000/transcript/';
  private PRODUIT_URL = `${this.API_URL}produits/`;
  private CREATE_ENDPOINT = `${this.API_URL}create_produits/`;

  constructor(private httpClient:HttpClient) { }

  getProduit():Observable<Produit[]>{
    return this.httpClient.get<Produit[]>(this.PRODUIT_URL);
  }
  
  createProduit(personne: Produit): Observable<Produit> {
    return this.httpClient.post<Produit>(`${this.CREATE_ENDPOINT}`, personne); 
  }

 

  getProduitByid(produitId: number): Observable<Produit> {
    return this.httpClient.get<Produit>(`${this.PRODUIT_URL}${produitId}/`);
  }



  updateProduit(produit: Produit): Observable<Produit> {
    return this.httpClient.put<Produit>(`${this.PRODUIT_URL}${produit.id}/`, produit);
  }

  deleteProduit(produitId: number): Observable<any> {
    return this.httpClient.delete(`${this.PRODUIT_URL}${produitId}/`);
  }
}