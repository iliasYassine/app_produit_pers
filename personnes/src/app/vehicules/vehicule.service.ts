import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface FraisVehicule {
  id?: number;
  vehicule?: number;
  description: string;
  prix: number;
  date?: string;
}

export interface Vehicule {
  id?: number;
  nom: string;
  prix_achat: number;
  date_creation?: string;
  frais: FraisVehicule[];
  total_frais: number;
}

@Injectable({ providedIn: 'root' })
export class VehiculeService {
  private base = `${environment.apiUrl}/transcript`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Vehicule[]> {
    return this.http.get<Vehicule[]>(`${this.base}/vehicules/`);
  }

  create(data: Partial<Vehicule>): Observable<Vehicule> {
    return this.http.post<Vehicule>(`${this.base}/vehicules/`, data);
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.base}/vehicules/${id}/`);
  }

  addFrais(frais: FraisVehicule): Observable<FraisVehicule> {
    return this.http.post<FraisVehicule>(`${this.base}/frais-vehicule/`, frais);
  }

  deleteFrais(id: number): Observable<any> {
    return this.http.delete(`${this.base}/frais-vehicule/${id}/`);
  }
}
