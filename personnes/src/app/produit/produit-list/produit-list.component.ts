import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ProduitService } from '../produit.service';
import { Produit, AchatLigne } from '../produit.model';
import { environment } from '../../../environments/environment';
import { ServiceFournisseurService } from '../../fournisseurs/service-fournisseur.service';
import { Fournisseur } from '../../fournisseurs/fournisseur.model';
import { BarcodeScannerComponent } from '../../barcode-scanner/barcode-scanner.component';

@Component({
  selector: 'app-produit-list',
  standalone: true,
  imports: [CommonModule, FormsModule, BarcodeScannerComponent],
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

  editId: number | null = null;
  editData: Partial<Produit> = {};
  editFile: File | null = null;

  deleteId: number | null = null;
  emailSent = false;
  emailError = '';

  showScanner = false;

  showAchatForm = false;
  achatLignes: AchatLigne[] = [];
  achatLoading = false;
  achatSuccess = '';
  achatError = '';

  constructor(private svc: ProduitService, private fournisseurSvc: ServiceFournisseurService) {}

  ngOnInit() {
    this.load();
    this.fournisseurSvc.getFournisseur().subscribe(f => this.fournisseurs = f);
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

  onEditFile(e: Event) {
    const f = (e.target as HTMLInputElement).files;
    this.editFile = f?.length ? f[0] : null;
  }

  buildFormData(data: Partial<Produit>, file?: File | null): FormData {
    const fd = new FormData();
    fd.append('nomProd', data.nomProd || '');
    if (data.prixAchat != null) fd.append('prixAchat', String(data.prixAchat));
    if (data.prixVente != null) fd.append('prixVente', String(data.prixVente));
    if (data.prixVenteGros != null) fd.append('prixVenteGros', String(data.prixVenteGros));
    if (data.qte != null) fd.append('qte', String(data.qte));
    if (data.qteMin != null) fd.append('qteMin', String(data.qteMin));
    fd.append('codeBarre', data.codeBarre || '');
    if (data.fournisseur != null && data.fournisseur !== 0)
      fd.append('fournisseur', String(data.fournisseur));
    if (file) fd.append('photo', file);
    return fd;
  }

  startEdit(p: Produit) {
    this.editId = p.id;
    this.editData = { ...p };
    this.editFile = null;
    this.deleteId = null;
    this.showAchatForm = false;
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
    this.emailError = '';
    this.emailSent = false;
    this.svc.sendMail().subscribe({
      next: (res: any) => {
        const msg: string = typeof res === 'string' ? res : JSON.stringify(res);
        if (msg.includes('Aucun produit')) {
          this.emailError = 'Aucun produit en rupture de stock.';
          setTimeout(() => this.emailError = '', 4000);
        } else {
          this.emailSent = true;
          setTimeout(() => this.emailSent = false, 4000);
        }
      },
      error: (err: any) => {
        const detail = err?.error?.erreur || err?.message || 'Erreur inconnue';
        this.emailError = `Échec envoi email : ${detail}`;
        setTimeout(() => this.emailError = '', 6000);
      }
    });
  }

  openScanner() {
    this.showScanner = true;
  }

  onBarcodeScanned(code: string) {
    this.showScanner = false;
    this.editData.codeBarre = code;
  }

  toggleAchatForm() {
    this.showAchatForm = !this.showAchatForm;
    this.achatSuccess = '';
    this.achatError = '';
    if (this.showAchatForm) {
      this.editId = null;
      this.achatLignes = [this.emptyAchatLigneExistant()];
    }
  }

  emptyAchatLigneExistant(): AchatLigne {
    return { type: 'existant', produit_id: null, quantite: null, prix_achat_unitaire: null };
  }

  emptyAchatLigneNouveau(): AchatLigne {
    return { type: 'nouveau', nomProd: '', prixAchat: null, prixVente: null, prixVenteGros: null, quantite: null, qteMin: null, codeBarre: '', fournisseur: null };
  }

  addAchatLigne(type: 'existant' | 'nouveau') {
    this.achatLignes.push(type === 'existant' ? this.emptyAchatLigneExistant() : this.emptyAchatLigneNouveau());
  }

  removeAchatLigne(i: number) {
    this.achatLignes.splice(i, 1);
  }

  onAchatProduitChange(ligne: AchatLigne) {
    const p = this.produits.find(pr => pr.id === ligne.produit_id);
    if (p) ligne.prix_achat_unitaire = p.prixAchat;
  }

  ligneCout(ligne: AchatLigne): number {
    const qte = ligne.quantite || 0;
    const prix = ligne.type === 'existant' ? (ligne.prix_achat_unitaire || 0) : (ligne.prixAchat || 0);
    return qte * prix;
  }

  achatTotal(): number {
    return this.achatLignes.reduce((sum, l) => sum + this.ligneCout(l), 0);
  }

  achatValide(): boolean {
    if (this.achatLignes.length === 0) return false;
    return this.achatLignes.every(l => {
      if (!l.quantite || l.quantite <= 0) return false;
      return l.type === 'existant' ? !!l.produit_id : !!(l.nomProd && l.nomProd.trim());
    });
  }

  exportGrossiste() {
    this.svc.exportGrossistePdf().subscribe(blob => {
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'tarif_grossiste.pdf';
      a.click();
      window.URL.revokeObjectURL(url);
    });
  }

  submitAchat() {
    if (!this.achatValide()) {
      this.achatError = 'Vérifie que chaque ligne a une quantité et un produit renseignés.';
      return;
    }
    this.achatLoading = true;
    this.achatError = '';
    this.svc.achatMarchandise(this.achatLignes).subscribe({
      next: (res) => {
        this.achatLoading = false;
        this.achatSuccess = `Achat enregistré : ${res.total_deduit}€ déduits du compte courant.`;
        this.showAchatForm = false;
        this.achatLignes = [];
        this.load();
        setTimeout(() => this.achatSuccess = '', 5000);
      },
      error: (err) => {
        this.achatLoading = false;
        this.achatError = err?.error?.error || 'Erreur lors de l\'enregistrement de l\'achat.';
      }
    });
  }
}
