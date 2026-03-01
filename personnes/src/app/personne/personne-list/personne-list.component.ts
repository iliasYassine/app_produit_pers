import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { PersonneService } from '../personne.service';
import { User } from '../personne.model';

@Component({
  selector: 'app-personne-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './personne-list.component.html',
  styleUrl: './personne-list.component.css'
})
export class PersonneListComponent implements OnInit {
  personnes: User[] = [];
  filtered: User[] = [];
  search = '';
  loading = false;

  showAddForm = false;
  newPersonne: Partial<User> = this.emptyForm();

  editId: number | null = null;
  editData: Partial<User> = {};

  deleteId: number | null = null;

  constructor(private svc: PersonneService) {}

  ngOnInit() { this.load(); }

  emptyForm(): Partial<User> {
    return { name: '', prenom: '', tel: '' };
  }

  load() {
    this.loading = true;
    this.svc.getUsers().subscribe({
      next: (data) => { this.personnes = data; this.applyFilter(); this.loading = false; },
      error: () => { this.loading = false; }
    });
  }

  applyFilter() {
    const t = this.search.toLowerCase();
    this.filtered = this.personnes.filter(p =>
      p.name.toLowerCase().includes(t) || p.prenom.toLowerCase().includes(t)
    );
  }

  toggleAddForm() {
    this.showAddForm = !this.showAddForm;
    this.editId = null;
    this.deleteId = null;
    if (this.showAddForm) this.newPersonne = this.emptyForm();
  }

  create() {
    this.svc.createPersonne(this.newPersonne as User).subscribe({
      next: () => { this.showAddForm = false; this.newPersonne = this.emptyForm(); this.load(); }
    });
  }

  startEdit(p: User) {
    this.editId = p.id;
    this.editData = { ...p };
    this.deleteId = null;
    this.showAddForm = false;
  }

  saveEdit() {
    if (!this.editId) return;
    this.svc.updateUser(this.editData as User).subscribe({
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
