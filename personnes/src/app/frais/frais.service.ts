import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface FraisGeneraux {
  id?: number;
  nom: string;
  description?: string;
  prix: number;
  ticket?: string | null;
  date?: string;
}

@Injectable({ providedIn: 'root' })
export class FraisService {
  private base = `${environment.apiUrl}/transcript`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<FraisGeneraux[]> {
    return this.http.get<FraisGeneraux[]>(`${this.base}/frais-generaux/`);
  }

  create(fd: FormData): Observable<FraisGeneraux> {
    return this.http.post<FraisGeneraux>(`${this.base}/frais-generaux/`, fd);
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.base}/frais-generaux/${id}/`);
  }
}
