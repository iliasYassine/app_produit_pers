import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Associe, Mouvement } from './capital.model';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class CapitalService {
  private base = `${environment.apiUrl}/transcript`;

  constructor(private http: HttpClient) {}

  getAssocies(): Observable<Associe[]> {
    return this.http.get<Associe[]>(`${this.base}/associes/`);
  }

  createAssocie(data: { nom: string }): Observable<Associe> {
    return this.http.post<Associe>(`${this.base}/associes/`, data);
  }

  updateSolde(id: number, solde: number): Observable<Associe> {
    return this.http.patch<Associe>(`${this.base}/associes/${id}/`, { solde });
  }

  deleteAssocie(id: number): Observable<any> {
    return this.http.delete(`${this.base}/associes/${id}/`);
  }

  addMouvement(mvt: Omit<Mouvement, 'id' | 'date_mvt'>): Observable<Mouvement> {
    return this.http.post<Mouvement>(`${this.base}/mouvements-capital/`, mvt);
  }

  deleteMouvement(id: number): Observable<any> {
    return this.http.delete(`${this.base}/mouvements-capital/${id}/`);
  }

  getSoldeBancaire(): Observable<{ solde_bancaire: number }> {
    return this.http.get<{ solde_bancaire: number }>(`${this.base}/parametres/`);
  }

  updateSoldeBancaire(val: number): Observable<{ solde_bancaire: number }> {
    return this.http.patch<{ solde_bancaire: number }>(`${this.base}/parametres/`, { solde_bancaire: val });
  }
}
