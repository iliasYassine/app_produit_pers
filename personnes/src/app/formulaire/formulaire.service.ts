import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Commande } from './commande.model';
import { Client } from './client.model';

@Injectable({
  providedIn: 'root'
})
export class FormulaireService {

  private url = 'http://localhost:8000/transcript/';
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
    'http://localhost:8000/transcript/create-stripe-session/',
    { montant }
  );
}
}
