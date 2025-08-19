import { Injectable } from '@angular/core';
import { Fournisseur } from './fournisseur.model';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environment/environment';
@Injectable({
  providedIn: 'root'
})
export class ServiceFournisseurService {

  private API_URL = `${environment.apiUrl}/transcript/`;
  private FOURNISSEUR_URL = `${this.API_URL}fournisseur/`;
  private CREATE_ENDPOINT = `${this.API_URL}create_fournisseur/`;
  constructor(private httpClient: HttpClient) {}

  createFournisseur(fournisseur: Fournisseur): Observable<Fournisseur> {
    return this.httpClient.post<Fournisseur>(`${this.CREATE_ENDPOINT}`, fournisseur); 
  }

  getFournisseur(): Observable<Fournisseur[]> {
    return this.httpClient.get<Fournisseur[]>(this.FOURNISSEUR_URL);
  }

  getFournisseurByid(fournisseurId: number): Observable<Fournisseur> {
    return this.httpClient.get<Fournisseur>(`${this.FOURNISSEUR_URL}${fournisseurId}/`);
  }



  updateFournisseur(fournisseur: Fournisseur): Observable<Fournisseur> {
    return this.httpClient.put<Fournisseur>(`${this.FOURNISSEUR_URL}${fournisseur.id}/`, fournisseur);
  }

  deleteUser(fournisseurId: number): Observable<any> {
    return this.httpClient.delete(`${this.FOURNISSEUR_URL}${fournisseurId}/`);
  }
}
