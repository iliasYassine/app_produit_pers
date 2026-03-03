import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { VehiculeService, Vehicule, FraisVehicule } from './vehicule.service';

@Component({
  selector: 'app-vehicule-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './vehicule-list.component.html',
})
export class VehiculeListComponent implements OnInit {
  vehicules: Vehicule[] = [];
  selected: Vehicule | null = null;

  showAddVehicule = false;
  newNom = '';
  newPrixAchat = 0;

  newFraisDesc = '';
  newFraisPrix: number | null = null;

  deleteConfirmId: number | null = null;
  deleteFraisConfirmId: number | null = null;

  editVehiculeId: number | null = null;
  editNom = '';
  editPrixAchat = 0;

  editFraisId: number | null = null;
  editFraisDesc = '';
  editFraisPrix: number | null = null;

  constructor(private svc: VehiculeService) {}

  ngOnInit() { this.load(); }

  load() {
    this.svc.getAll().subscribe(data => {
      this.vehicules = data;
      if (this.selected) {
        this.selected = data.find(v => v.id === this.selected!.id) || null;
      }
    });
  }

  addVehicule() {
    if (!this.newNom.trim()) return;
    this.svc.create({ nom: this.newNom.trim(), prix_achat: this.newPrixAchat }).subscribe(() => {
      this.newNom = ''; this.newPrixAchat = 0; this.showAddVehicule = false;
      this.load();
    });
  }

  startEditVehicule(v: Vehicule) {
    this.editVehiculeId = v.id!;
    this.editNom = v.nom;
    this.editPrixAchat = Number(v.prix_achat);
    this.deleteConfirmId = null;
  }

  saveEditVehicule() {
    if (!this.editVehiculeId || !this.editNom.trim()) return;
    this.svc.update(this.editVehiculeId, { nom: this.editNom.trim(), prix_achat: this.editPrixAchat }).subscribe(() => {
      this.editVehiculeId = null;
      this.load();
    });
  }

  cancelEditVehicule() { this.editVehiculeId = null; }

  select(v: Vehicule) { this.selected = v; }
  back() { this.selected = null; }

  addFrais() {
    if (!this.newFraisDesc.trim() || !this.newFraisPrix || !this.selected?.id) return;
    this.svc.addFrais({ vehicule: this.selected.id, description: this.newFraisDesc.trim(), prix: this.newFraisPrix }).subscribe(() => {
      this.newFraisDesc = ''; this.newFraisPrix = null;
      this.load();
    });
  }

  startEditFrais(f: FraisVehicule) {
    this.editFraisId = f.id!;
    this.editFraisDesc = f.description;
    this.editFraisPrix = Number(f.prix);
    this.deleteFraisConfirmId = null;
  }

  saveEditFrais() {
    if (!this.editFraisId || !this.editFraisDesc.trim() || !this.editFraisPrix) return;
    this.svc.updateFrais(this.editFraisId, { description: this.editFraisDesc.trim(), prix: this.editFraisPrix }).subscribe(() => {
      this.editFraisId = null;
      this.load();
    });
  }

  cancelEditFrais() { this.editFraisId = null; }

  confirmDeleteVehicule(id: number) { this.deleteConfirmId = id; this.editVehiculeId = null; }
  cancelDelete() { this.deleteConfirmId = null; }
  deleteVehicule(id: number) {
    this.svc.delete(id).subscribe(() => {
      this.deleteConfirmId = null;
      if (this.selected?.id === id) this.selected = null;
      this.load();
    });
  }

  confirmDeleteFrais(id: number) { this.deleteFraisConfirmId = id; this.editFraisId = null; }
  cancelDeleteFrais() { this.deleteFraisConfirmId = null; }
  deleteFrais(id: number) {
    this.svc.deleteFrais(id).subscribe(() => {
      this.deleteFraisConfirmId = null;
      this.load();
    });
  }

  get coutTotal(): number {
    if (!this.selected) return 0;
    return Number(this.selected.prix_achat) + Number(this.selected.total_frais);
  }
}
