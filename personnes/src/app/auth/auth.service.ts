import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment';

interface GoogleLoginResponse {
  token: string;
  email: string;
  name?: string;
  picture?: string;
}

const TOKEN_KEY = 'auth_token';
const EMAIL_KEY = 'auth_email';
const NAME_KEY = 'auth_name';
const PICTURE_KEY = 'auth_picture';

@Injectable({ providedIn: 'root' })
export class AuthService {
  constructor(private http: HttpClient, private router: Router) {}

  loginWithGoogle(credential: string): Observable<GoogleLoginResponse> {
    return this.http.post<GoogleLoginResponse>(`${environment.apiUrl}/transcript/auth/google/`, { credential }).pipe(
      tap(res => {
        localStorage.setItem(TOKEN_KEY, res.token);
        localStorage.setItem(EMAIL_KEY, res.email);
        if (res.name) localStorage.setItem(NAME_KEY, res.name);
        if (res.picture) localStorage.setItem(PICTURE_KEY, res.picture);
      })
    );
  }

  logout(): void {
    localStorage.removeItem(TOKEN_KEY);
    localStorage.removeItem(EMAIL_KEY);
    localStorage.removeItem(NAME_KEY);
    localStorage.removeItem(PICTURE_KEY);
    this.router.navigate(['/login']);
  }

  getToken(): string | null {
    return localStorage.getItem(TOKEN_KEY);
  }

  getEmail(): string | null {
    return localStorage.getItem(EMAIL_KEY);
  }

  getName(): string | null {
    return localStorage.getItem(NAME_KEY);
  }

  getPicture(): string | null {
    return localStorage.getItem(PICTURE_KEY);
  }

  isLoggedIn(): boolean {
    return !!this.getToken();
  }
}
