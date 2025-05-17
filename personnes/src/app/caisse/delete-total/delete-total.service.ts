import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Transaction } from '../transaction.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DeleteTotalService {
  private URL='http://127.0.0.1:8000/transcript/';
  private ENDPOINT_TOTAL='transaction/';

  constructor(private httpclient:HttpClient) { }

  getTotal(): Observable<Transaction[]> {
    return this.httpclient.get<Transaction[]>(this.URL + this.ENDPOINT_TOTAL);
}
  deleteTotal(id: number): Observable<void> {
    return this.httpclient.delete<void>(`${this.URL}${this.ENDPOINT_TOTAL}${id}/`);
  }
}
