import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ReportsComponent } from './reports.component';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';
import{ResponseData} from './report.model';
import { LignesTransaction } from '../caisse/ligne.model';
import { ChiffreAffairesResponse } from './chiffreAffairesResponse.model';

@Injectable({
  providedIn: 'root'
})
export class ReportServiceService {

  private API_URL ='http://127.0.0.1:8000/transcript/produits/';
  private TOP_URL='http://127.0.0.1:8000/transcript/top-vente/';
  private LIGNE_TRANSAC='http://127.0.0.1:8000/transcript/ligneTransaction/'
  private CH_URL='http://127.0.0.1:8000/transcript/chiffre_affaire_total/'
  private INITIALISE=' http://127.0.0.1:8000/transcript/reset-transactions/'
  constructor(private httpClient:HttpClient) { }

  getProduitReport():Observable<Produit[]>{
    return this.httpClient.get<Produit[]>(this.API_URL);
  }

  getLigneTransaction():Observable<LignesTransaction[]>{
    return this.httpClient.get<LignesTransaction[]>(this.LIGNE_TRANSAC);
  }

  calculCout(produits: Produit[]): number {
    return produits.reduce((acc, produit) => {
      const prixAchat = produit.prixAchat || 0; // Assure que prixAchat n'est pas null
      const qte = produit.qte || 0; // Assure que qte n'est pas null
      return acc + prixAchat * qte;
    }, 0);
  }

 

  get_top1():Observable<ResponseData>{
    return this.httpClient.get<ResponseData>(this.TOP_URL);
  }

  getChiffreAffairesTotal(): Observable<ChiffreAffairesResponse> {
    return this.httpClient.get<ChiffreAffairesResponse>(this.CH_URL);
  }

  reinitilsie():Observable<any>{
    return this.httpClient.post<any>(this.INITIALISE,{});

}


}
