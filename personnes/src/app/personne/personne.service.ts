import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from './personne.model';
import { environment } from '../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class PersonneService {

  private API_URL = `${environment.apiUrl}/transcript/`;
  private USERS_URL = `${this.API_URL}users/`;
  private CREATE_ENDPOINT = `${this.API_URL}create/`;
  constructor(private httpClient: HttpClient) {}

  createPersonne(personne: User): Observable<User> {
    return this.httpClient.post<User>(`${this.CREATE_ENDPOINT}`, personne); 
  }

  getUsers(): Observable<User[]> {
    return this.httpClient.get<User[]>(this.USERS_URL);
  }

  getUserByid(userId: number): Observable<User> {
    return this.httpClient.get<User>(`${this.USERS_URL}${userId}/`);
  }



  updateUser(user: User): Observable<User> {
    return this.httpClient.put<User>(`${this.USERS_URL}${user.id}/`, user);
  }

  deleteUser(userId: number): Observable<any> {
    return this.httpClient.delete(`${this.USERS_URL}${userId}/`);
  }
  


}
