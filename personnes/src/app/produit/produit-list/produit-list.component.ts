import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ProduitService } from '../produit.service';
import { Produit } from '../produit.model';
import { environment } from '../../../environments/environment';
import { ServiceFournisseurService } from '../../fournisseurs/service-fournisseur.service';
import { Fournisseur } from '../../fournisseurs/fournisseur.model';

@Component({
  selector: 'app-produit-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './produit-list.component.html',
  styleUrl: './produit-list.component.css'
})
export class ProduitListComponent implements OnInit {
  produits: Produit[] = [];
  filtered: Produit[] = [];
  fournisseurs: Fournisseur[] = [];
  search = '';
  apiUrl = environment.apiUrl;
  loading = false;

  showAddForm = false;
  newProduit: Partial<Produit> = this.emptyForm();
  newFile: File | null = null;

  editId: number | null = null;
  editData: Partial<Produit> = {};
  editFile: File | null = null;

  deleteId: number | null = null;
  emailSent = false;

  constructor(private svc: ProduitService, private fournisseurSvc: ServiceFournisseurService) {}

  ngOnInit() {
    this.load();
    this.fournisseurSvc.getFournisseur().subscribe(f => this.fournisseurs = f);
  }

  emptyForm(): Partial<Produit> {
    return { nomProd: '', prixAchat: null, prixVente: null, qte: null, qteMin: null, codeBarre: '', fournisseur: null };
  }

  load() {
    this.loading = true;
    this.svc.getProduit().subscribe({
      next: (data) => { this.produits = data; this.applyFilter(); this.loading = false; },
      error: () => { this.loading = false; }
    });
  }

  applyFilter() {
    const t = this.search.toLowerCase();
    this.filtered = this.produits.filter(p => (p.nomProd || '').toLowerCase().includes(t));
  }

  onNewFile(e: Event) {
    const f = (e.target as HTMLInputElement).files;
    this.newFile = f?.length ? f[0] : null;
  }

  onEditFile(e: Event) {
    const f = (e.target as HTMLInputElement).files;
    this.editFile = f?.length ? f[0] : null;
  }

  buildFormData(data: Partial<Produit>, file?: File | null): FormData {
    const fd = new FormData();
    fd.append('nomProd', data.nomProd || '');
    if (data.prixAchat != null) fd.append('prixAchat', String(data.prixAchat));
    if (data.prixVente != null) fd.append('prixVente', String(data.prixVente));
    if (data.qte != null) fd.append('qte', String(data.qte));
    if (data.qteMin != null) fd.append('qteMin', String(data.qteMin));
    fd.append('codeBarre', data.codeBarre || '');
    if (data.fournisseur != null && data.fournisseur !== 0)
      fd.append('fournisseur', String(data.fournisseur));
    if (file) fd.append('photo', file);
    return fd;
  }

  toggleAddForm() {
    this.showAddForm = !this.showAddForm;
    this.editId = null;
    this.deleteId = null;
    if (this.showAddForm) this.newProduit = this.emptyForm();
  }

  create() {
    const fd = this.buildFormData(this.newProduit, this.newFile);
    this.svc.createProduitWithFile(fd).subscribe({
      next: () => { this.showAddForm = false; this.newProduit = this.emptyForm(); this.newFile = null; this.load(); }
    });
  }

  startEdit(p: Produit) {
    this.editId = p.id;
    this.editData = { ...p };
    this.editFile = null;
    this.deleteId = null;
    this.showAddForm = false;
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  saveEdit() {
    if (!this.editId) return;
    const fd = this.buildFormData(this.editData, this.editFile);
    this.svc.patchProduitWithFile(this.editId, fd).subscribe({
      next: () => { this.editId = null; this.load(); }
    });
  }

  cancelEdit() { this.editId = null; }

  askDelete(id: number) { this.deleteId = id; this.editId = null; }
  cancelDelete() { this.deleteId = null; }

  doDelete(id: number) {
    this.svc.deleteProduit(id).subscribe({
      next: () => { this.deleteId = null; this.load(); }
    });
  }

  sendEmail() {
    this.svc.sendMail().subscribe({
      next: () => { this.emailSent = true; setTimeout(() => this.emailSent = false, 3000); }
    });
  }
}
