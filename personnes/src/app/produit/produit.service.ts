import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Produit } from './produit.model';
import { environment } from '../../environment/environment';
@Injectable({
  providedIn: 'root'
})
export class ProduitService {
  private API_URL = `${environment.apiUrl}/transcript/`;
  private PRODUIT_URL = `${this.API_URL}produits/`;
  private CREATE_ENDPOINT = `${this.API_URL}create_produits/`;
  private endpoint_email = `${this.API_URL}send-mail/`;

  constructor(private httpClient:HttpClient) { }

  getProduit():Observable<Produit[]>{
    return this.httpClient.get<Produit[]>(this.PRODUIT_URL);
  }
  
  createProduit(produit: Produit): Observable<Produit> {
    return this.httpClient.post<Produit>(`${this.CREATE_ENDPOINT}`, produit); 
  }

  sendMail(): Observable<any> {
    return this.httpClient.get(this.endpoint_email); // Remplacez par l'URL de votre API pour envoyer l'e-mail
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
