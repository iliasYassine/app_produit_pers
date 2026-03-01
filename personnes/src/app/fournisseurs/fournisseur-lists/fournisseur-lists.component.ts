import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Fournisseur } from '../fournisseur.model';
import { ServiceFournisseurService } from '../service-fournisseur.service';

@Component({
  selector: 'app-fournisseur-lists',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './fournisseur-lists.component.html',
  styleUrl: './fournisseur-lists.component.css'
})
export class FournisseurListsComponent implements OnInit {
  fournisseurs: Fournisseur[] = [];
  loading = false;

  showAddForm = false;
  newFournisseur: Partial<Fournisseur> = this.emptyForm();

  editId: number | null = null;
  editData: Partial<Fournisseur> = {};

  deleteId: number | null = null;

  constructor(private svc: ServiceFournisseurService) {}

  ngOnInit() { this.load(); }

  emptyForm(): Partial<Fournisseur> {
    return { nom: '', tel: 0, adresse: '', email: '' };
  }

  load() {
    this.loading = true;
    this.svc.getFournisseur().subscribe({
      next: (data) => { this.fournisseurs = data; this.loading = false; },
      error: () => { this.loading = false; }
    });
  }

  toggleAddForm() {
    this.showAddForm = !this.showAddForm;
    this.editId = null;
    this.deleteId = null;
    if (this.showAddForm) this.newFournisseur = this.emptyForm();
  }

  create() {
    this.svc.createFournisseur(this.newFournisseur as Fournisseur).subscribe({
      next: () => { this.showAddForm = false; this.newFournisseur = this.emptyForm(); this.load(); }
    });
  }

  startEdit(f: Fournisseur) {
    this.editId = f.id;
    this.editData = { ...f };
    this.deleteId = null;
    this.showAddForm = false;
  }

  saveEdit() {
    if (!this.editId) return;
    this.svc.updateFournisseur(this.editData as Fournisseur).subscribe({
      next: () => { this.editId = null; this.load(); }
    });
  }

  cancelEdit() { this.editId = null; }

  askDelete(id: number) { this.deleteId = id; this.editId = null; }
  cancelDelete() { this.deleteId = null; }

  doDelete(id: number) {
    this.svc.deleteUser(id).subscribe({
      next: () => { this.deleteId = null; this.load(); }
    });
  }
}
