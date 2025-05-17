import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';

@Injectable({
  providedIn: 'root'
})
export class CaisseService {
  
  private scanProduitUrl = 'http://127.0.0.1:8000/transcript/scan-produit/';
  private finalizeTransactionUrl = 'http://127.0.0.1:8000/transcript/finalize-transaction/';
  private url='http://127.0.0.1:8000/transcript/nom_prod/'

  constructor(private http: HttpClient) {}

  scanProduit(codeBarre: string): Observable<any> {
    return this.http.post(this.scanProduitUrl, { codeBarre: codeBarre });
  }

  finalizeTransaction(transactionId: number): Observable<any> {
    // Assurez-vous que finalizationTransactionUrl est défini et correctement configuré pour pointer vers votre API Django
    return this.http.post(this.finalizeTransactionUrl, { transaction_id: transactionId });
  }


  getnomprod(codeBarre: string): Observable<Partial<Produit>> {
    return this.http.get<Partial<Produit>>(`${this.url}${codeBarre}/`); 
  }


  
}
