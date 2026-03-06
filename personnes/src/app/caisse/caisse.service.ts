import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';
// Update the import path if your environment file is located elsewhere, for example:
import { environment } from '../../environments/environment';
// Or create the file at '../../environments/environment.ts' if it does not exist.

@Injectable({
  providedIn: 'root'
})
export class CaisseService {
  private baseUrl = environment.apiUrl;
   private scanProduitUrl = `${this.baseUrl}/transcript/scan-produit/`;
  private finalizeTransactionUrl = `${this.baseUrl}/transcript/finalize-transaction/`;
  private url = `${this.baseUrl}/transcript/nom_prod/`;
  private scanbynomprod = `${this.baseUrl}/transcript/scanbynomprod/`;
  
  constructor(private http: HttpClient) {}

  scanProduit(codeBarre: string, transactionId: number | null = null): Observable<any> {
    const body: any = { codeBarre };
    if (transactionId !== null) body.transaction_id = transactionId;
    return this.http.post(this.scanProduitUrl, body);
  }

  finalizeTransaction(transactionId: number): Observable<any> {
    return this.http.post(this.finalizeTransactionUrl, { transaction_id: transactionId });
  }


  getnomprod(codeBarre: string): Observable<Partial<Produit>> {
    return this.http.get<Partial<Produit>>(`${this.url}${codeBarre}/`); 
  }


  scanProduitbynomprod(nomprod: string, transactionId: number | null = null): Observable<any> {
    const body: any = { nomProd: nomprod };
    if (transactionId !== null) body.transaction_id = transactionId;
    return this.http.post(this.scanbynomprod, body);
  }

  deleteLigne(ligneId: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/transcript/ligneTransaction/${ligneId}/`);
  }

  ajouterLigneLibre(description: string, prix: number, transactionId: number | null): Observable<any> {
    const body: any = { description_libre: description, prix_unitaire: prix };
    if (transactionId !== null) body.transaction_id = transactionId;
    return this.http.post(`${this.baseUrl}/transcript/ligne-libre/`, body);
  }
}
