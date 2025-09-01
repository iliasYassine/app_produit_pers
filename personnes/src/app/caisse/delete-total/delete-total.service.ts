import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Transaction } from '../transaction.model';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class DeleteTotalService {
  private baseUrl = environment.apiUrl;
  private URL=`${this.baseUrl}/transcript/`;
  private ENDPOINT_TOTAL='transaction/';

  constructor(private httpclient:HttpClient) { }

  getTotal(): Observable<Transaction[]> {
    return this.httpclient.get<Transaction[]>(this.URL + this.ENDPOINT_TOTAL);
}
  deleteTotal(id: number): Observable<void> {
    return this.httpclient.delete<void>(`${this.URL}${this.ENDPOINT_TOTAL}${id}/`);
  }
}
