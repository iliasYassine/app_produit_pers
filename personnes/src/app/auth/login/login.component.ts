import { Component, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';
import { environment } from '../../../environments/environment';

declare const google: any;

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './login.component.html',
})
export class LoginComponent implements AfterViewInit {
  errorMsg = '';
  loading = false;

  constructor(private authService: AuthService, private router: Router) {}

  ngAfterViewInit(): void {
    if (typeof google === 'undefined') {
      this.errorMsg = "Impossible de charger Google Sign-In. Vérifiez votre connexion internet.";
      return;
    }
    google.accounts.id.initialize({
      client_id: environment.googleClientId,
      callback: (response: any) => this.handleCredential(response.credential),
    });
    google.accounts.id.renderButton(
      document.getElementById('google-btn'),
      { theme: 'outline', size: 'large', width: 320 }
    );
  }

  handleCredential(credential: string): void {
    this.loading = true;
    this.errorMsg = '';
    this.authService.loginWithGoogle(credential).subscribe({
      next: () => {
        this.loading = false;
        this.router.navigate(['/caisse']);
      },
      error: (err) => {
        this.loading = false;
        this.errorMsg = err?.error?.detail || 'Connexion refusée.';
      }
    });
  }
}
