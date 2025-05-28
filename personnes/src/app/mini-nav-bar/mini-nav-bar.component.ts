import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-mini-nav-bar',
  standalone: true,
  imports: [],
  templateUrl: './mini-nav-bar.component.html',
  styleUrl: './mini-nav-bar.component.css'
})
export class MiniNavBarComponent {
constructor(private router: Router) {}

  goTo(path: string) {
    this.router.navigate([path]);
  }
}
