import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Commande } from './commande.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CommandeService {
  private baseUrl = environment.apiUrl;
  private URL=`${this.baseUrl}/http://localhost:8000/transcript/commande/`;
  constructor(private http :HttpClient) { }

  getCommandes():Observable<Commande[]>{
    return this.http.get<Commande[]>(this.URL);
    
  }

  updateCommande(id:number,commande:Commande):Observable<Commande>{
    return this.http.put<Commande>(this.URL+id+"/",commande);
  }

  deleteCommande(id:number):Observable<Commande>{
    return this.http.delete<Commande>(this.URL+id+"/");
  }
  getCommandeById(id:number):Observable<Commande>{
    return this.http.get<Commande>(this.URL+id+"/");
  }

  getCommandeByNumeroSuivi(numero_suivi: string): Observable<Commande> {
  return this.http.get<Commande>(this.URL + 'suivi/' + numero_suivi + '/');
}
}
