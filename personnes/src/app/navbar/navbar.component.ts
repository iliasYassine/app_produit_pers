import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {
  menuOpen = false;

  constructor(private authService: AuthService) {}

  toggle() { this.menuOpen = !this.menuOpen; }
  close() { this.menuOpen = false; }

  get userEmail(): string | null {
    return this.authService.getEmail();
  }

  logout() {
    this.close();
    this.authService.logout();
  }
}
