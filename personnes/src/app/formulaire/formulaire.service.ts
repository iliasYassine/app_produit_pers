import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { Client } from './client.model';
import { Commande } from '../commande/commande.model';
import { environment } from '../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class FormulaireService {
  private baseUrl = environment.apiUrl;
  private url = `${this.baseUrl}/transcript/`;
  private endpoint_commande="commande/";
  private endpoint_client="client/";
  constructor(private httpclient:HttpClient) { }

  createCommande(cmd:Commande):Observable<Commande> {
    return this.httpclient.post<Commande>(this.url+this.endpoint_commande, cmd);
  }

  createclient(client:Client):Observable<Client> {
    return this.httpclient.post<Client>(this.url+this.endpoint_client, client);
}

createStripeSession(montant: number) {
  return this.httpclient.post<{url: string}>(
    `${this.baseUrl}/transcript/create-stripe-session/`,
    { montant }
  );
}
}
