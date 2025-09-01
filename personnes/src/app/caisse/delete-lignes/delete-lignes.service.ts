import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LignesTransaction } from '../ligne.model';
import { Produit } from '../../produit/produit.model';
import { environment } from '../../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class DeleteLignesService {
private baseUrl = environment.apiUrl;
private URL=`${this.baseUrl}/transcript/`;
private ENDPOINT_LIGNES="ligneTransaction/"
constructor(private http:HttpClient) { }

deleteLignes(id:number):Observable<LignesTransaction>{
  return this.http.delete<LignesTransaction>(`${this.URL}${this.ENDPOINT_LIGNES}${id}/`);  
}

getLignes(): Observable<LignesTransaction[]> {
  return this.http.get<LignesTransaction[]>(`${this.URL}${this.ENDPOINT_LIGNES}`);
}

 getnomprod(codeBarre: string): Observable<Partial<Produit>> {
    return this.http.get<Partial<Produit>>(`${this.URL}${codeBarre}/`); 
  }

}
