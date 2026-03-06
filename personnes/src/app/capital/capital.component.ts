import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CapitalService } from './capital.service';
import { Associe } from './capital.model';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-capital',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './capital.component.html',
})
export class CapitalComponent implements OnInit {
  associes: Associe[] = [];
  loading = false;
  apiUrl = environment.apiUrl;

  // Solde bancaire réel
  soldeBancaire: number = 0;
  editSoldeBancaire = false;
  soldeBancaireEdit: number = 0;

  // Ajout associé
  showAddAssocie = false;
  newNom = '';

  // Modifier solde
  editSoldeId: number | null = null;
  editSoldeVal: number = 0;

  // Ajout mouvement
  showMvtId: number | null = null;
  newMvt: { montant: number | null; type_mvt: 'injection' | 'retrait'; description: string } = {
    montant: null, type_mvt: 'injection', description: ''
  };
  selectedFile: File | null = null;

  // Supprimer associé
  deleteId: number | null = null;

  constructor(private svc: CapitalService) {}

  ngOnInit() {
    this.svc.getSoldeBancaire().subscribe(data => {
      this.soldeBancaire = Number(data.solde_bancaire);
    });
    this.load();
  }

  startEditSoldeBancaire() {
    this.soldeBancaireEdit = this.soldeBancaire;
    this.editSoldeBancaire = true;
  }

  saveSoldeBancaire() {
    this.svc.updateSoldeBancaire(this.soldeBancaireEdit).subscribe(data => {
      this.soldeBancaire = Number(data.solde_bancaire);
      this.editSoldeBancaire = false;
    });
  }

  load() {
    this.loading = true;
    this.svc.getAssocies().subscribe({
      next: (data) => { this.associes = data; this.loading = false; },
      error: () => { this.loading = false; }
    });
  }

  totalInvesti(): number {
    return this.associes.reduce((sum, a) => sum + Number(a.solde), 0);
  }

  createAssocie() {
    if (!this.newNom.trim()) return;
    this.svc.createAssocie({ nom: this.newNom }).subscribe({
      next: () => { this.newNom = ''; this.showAddAssocie = false; this.load(); }
    });
  }

  startEditSolde(a: Associe) {
    this.editSoldeId = a.id!;
    this.editSoldeVal = Number(a.solde);
  }

  saveSolde() {
    if (!this.editSoldeId) return;
    this.svc.updateSolde(this.editSoldeId, this.editSoldeVal).subscribe({
      next: () => { this.editSoldeId = null; this.load(); }
    });
  }

  openMvt(id: number) {
    this.showMvtId = id;
    this.newMvt = { montant: null, type_mvt: 'injection', description: '' };
    this.selectedFile = null;
  }

  onFileSelected(event: Event) {
    const input = event.target as HTMLInputElement;
    this.selectedFile = input.files?.[0] ?? null;
  }

  addMouvement() {
    if (!this.showMvtId || !this.newMvt.montant) return;
    this.svc.addMouvement({
      associe: this.showMvtId,
      montant: this.newMvt.montant,
      type_mvt: this.newMvt.type_mvt,
      description: this.newMvt.description
    }, this.selectedFile ?? undefined).subscribe({
      next: () => { this.showMvtId = null; this.selectedFile = null; this.load(); }
    });
  }

  deleteMouvement(mvtId: number) {
    this.svc.deleteMouvement(mvtId).subscribe({ next: () => this.load() });
  }

  askDelete(id: number) { this.deleteId = id; }
  cancelDelete() { this.deleteId = null; }
  confirmDelete() {
    if (!this.deleteId) return;
    this.svc.deleteAssocie(this.deleteId).subscribe({ next: () => { this.deleteId = null; this.load(); } });
  }
}
