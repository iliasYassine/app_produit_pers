import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ReportsComponent } from './reports.component';
import { Observable } from 'rxjs';
import { Produit } from '../produit/produit.model';
import{ResponseData} from './report.model';
import { LignesTransaction } from '../caisse/ligne.model';
import { ChiffreAffairesResponse } from './chiffreAffairesResponse.model';
import { environment } from '../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class ReportServiceService {
    private baseUrl = environment.apiUrl;
  private API_URL =`${this.baseUrl}/transcript/produits/`;
  private TOP_URL=`${this.baseUrl}/transcript/top-vente/`;
  private LIGNE_TRANSAC=`${this.baseUrl}/transcript/ligneTransaction/`
  private CH_URL=`${this.baseUrl}/transcript/chiffre_affaire_total/`
  private INITIALISE=`${this.baseUrl}/transcript/reset-transactions/`
  private BENEFICE_URL=`${this.baseUrl}/transcript/benefice/`;
  private BENEFICE_MOIS=`${this.baseUrl}/transcript/beneficeMois/`;
  private BENEFICE_SEMAINE=`${this.baseUrl}/transcript/beneficeSemaine/`;
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
getbenefice():Observable<{benefice: number}> {
  return this.httpClient.get<{benefice:number}>(this.BENEFICE_URL); 
}

getBeneficeParMois(): Observable<any[]> {
  return this.httpClient.get<any[]>(this.BENEFICE_MOIS);
}

getBeneficeParSemaine(): Observable<any[]> {
  return this.httpClient.get<any[]>(this.BENEFICE_SEMAINE);
}


}
