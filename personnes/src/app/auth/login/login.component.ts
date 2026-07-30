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
  isProd = environment.production;

  constructor(private authService: AuthService, private router: Router) {}

  private static readonly GOOGLE_LOAD_TIMEOUT_MS = 8000;
  private static readonly GOOGLE_POLL_INTERVAL_MS = 100;

  ngAfterViewInit(): void {
    this.waitForGoogle(0);
  }

  private waitForGoogle(elapsedMs: number): void {
    if (typeof google !== 'undefined') {
      this.initGoogleSignIn();
      return;
    }
    if (elapsedMs >= LoginComponent.GOOGLE_LOAD_TIMEOUT_MS) {
      this.errorMsg = "Impossible de charger Google Sign-In. Vérifiez votre connexion internet.";
      return;
    }
    setTimeout(() => this.waitForGoogle(elapsedMs + LoginComponent.GOOGLE_POLL_INTERVAL_MS), LoginComponent.GOOGLE_POLL_INTERVAL_MS);
  }

  private initGoogleSignIn(): void {
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

  devLogin(): void {
    this.loading = true;
    this.errorMsg = '';
    this.authService.loginDev().subscribe({
      next: () => {
        this.loading = false;
        this.router.navigate(['/caisse']);
      },
      error: (err) => {
        this.loading = false;
        this.errorMsg = err?.error?.detail || 'Connexion dev refusée (le serveur doit tourner avec DEBUG=True).';
      }
    });
  }
}
