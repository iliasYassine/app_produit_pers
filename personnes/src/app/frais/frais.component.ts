import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { FraisService, FraisGeneraux } from './frais.service';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-frais',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './frais.component.html',
})
export class FraisComponent implements OnInit {
  fraisList: FraisGeneraux[] = [];

  newNom = '';
  newDescription = '';
  newPrix: number | null = null;
  newTicketFile: File | null = null;

  deleteConfirmId: number | null = null;
  errorMsg = '';

  apiUrl = environment.apiUrl;

  constructor(private svc: FraisService) {}

  ngOnInit() { this.load(); }

  load() {
    this.svc.getAll().subscribe(data => this.fraisList = data);
  }

  onFileChange(event: Event) {
    const input = event.target as HTMLInputElement;
    this.newTicketFile = input.files?.[0] ?? null;
  }

  add() {
    if (!this.newNom.trim() || !this.newPrix) {
      this.errorMsg = 'Le nom et le prix sont obligatoires.';
      return;
    }
    this.errorMsg = '';
    const fd = new FormData();
    fd.append('nom', this.newNom.trim());
    fd.append('description', this.newDescription.trim());
    fd.append('prix', String(this.newPrix));
    if (this.newTicketFile) {
      fd.append('ticket', this.newTicketFile, this.newTicketFile.name);
    }
    this.svc.create(fd).subscribe(() => {
      this.newNom = '';
      this.newDescription = '';
      this.newPrix = null;
      this.newTicketFile = null;
      const fileInput = document.getElementById('ticketInput') as HTMLInputElement;
      if (fileInput) fileInput.value = '';
      this.load();
    });
  }

  confirmDelete(id: number) { this.deleteConfirmId = id; }
  cancelDelete() { this.deleteConfirmId = null; }

  deleteFrais(id: number) {
    this.svc.delete(id).subscribe(() => {
      this.deleteConfirmId = null;
      this.load();
    });
  }

  get totalFrais(): number {
    return this.fraisList.reduce((sum, f) => sum + Number(f.prix), 0);
  }

  ticketUrl(ticket: string | null | undefined): string {
    if (!ticket) return '';
    if (ticket.startsWith('http')) return ticket;
    return `${this.apiUrl}${ticket}`;
  }
}
