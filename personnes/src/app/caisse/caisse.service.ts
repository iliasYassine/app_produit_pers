import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';
// Update the import path if your environment file is located elsewhere, for example:
import { environment } from '../../environment/environment';
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

  scanProduit(codeBarre: string): Observable<any> {
    return this.http.post(this.scanProduitUrl, { codeBarre: codeBarre });
  }

  finalizeTransaction(transactionId: number): Observable<any> {
    return this.http.post(this.finalizeTransactionUrl, { transaction_id: transactionId });
  }


  getnomprod(codeBarre: string): Observable<Partial<Produit>> {
    return this.http.get<Partial<Produit>>(`${this.url}${codeBarre}/`); 
  }


  scanProduitbynomprod(nomprod: string): Observable<any> {
    return this.http.post(this.scanbynomprod, { nomProd: nomprod });
  }
 


  
}
