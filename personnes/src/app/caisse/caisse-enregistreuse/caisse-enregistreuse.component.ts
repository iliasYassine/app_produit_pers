import { Component, OnInit } from '@angular/core';
import { CaisseService } from '../caisse.service';
import { CommonModule, NgFor, NgIf, DecimalPipe } from '@angular/common';
import {LignesTransaction} from '../ligne.model'
import { Produit } from '../../produit/produit.model';
import { FormsModule } from '@angular/forms';
import { ProduitDetailsComponent } from '../../produit/produit-details/produit-details.component';
import { ProduitService } from '../../produit/produit.service';
import { environment } from '../../../environments/environment';
import { BarcodeScannerComponent } from '../../barcode-scanner/barcode-scanner.component';
@Component({
  selector: 'app-caisse-enregistreuse',
  standalone: true,
  imports: [NgFor,FormsModule,NgIf,CommonModule,DecimalPipe,BarcodeScannerComponent],
  templateUrl: './caisse-enregistreuse.component.html',
  styleUrl: './caisse-enregistreuse.component.css'
})
export class CaisseEnregistreuseComponent implements OnInit {

  ligneTransaction : LignesTransaction[]=[];

  totalTransaction = 0;
  codebarre: string = "";
  produits!: Partial<Produit>;
  produit2:Produit[] = [];
  errorMessage: string = '';
  filteredProduits: Produit[] = [];
  searchTerm: string = '';
  apiUrl: string = environment.apiUrl;
  showScanner = false;
  private currentTransactionId: number | null = null;
  deleteConfirmLigneId: number | null = null;

  // Article libre
  showLibre = false;
  libreDesc = '';
  librePrix: number | null = null;

  ngOnInit() {
    console.log("codebarre1:",this.codebarre);
    console.log("produit1:",this.produits);
    this.getproduitList(); // Appel pour récupérer la liste des produits
  }


  constructor(private caisseService: CaisseService,private produitservice:ProduitService) {}

 
  

  scanProduit() {
    if (this.codebarre.trim() === '') {
      this.errorMessage = 'Erreur: Le code-barre est vide.';
      return;
    }
  
    console.log("dans la fonction scan produit");
  
    this.caisseService.scanProduit(this.codebarre, this.currentTransactionId).subscribe(
      response => {
        this.currentTransactionId = response.transaction;
        const ligne: LignesTransaction = { ...response };
        const produitLocal = this.produit2.find(p => p.codeBarre === this.codebarre);
        if (produitLocal) ligne.produitDetails = produitLocal;

        const existingIndex = this.ligneTransaction.findIndex(l => l.produit === response.produit);
        if (existingIndex !== -1) {
          this.ligneTransaction[existingIndex] = ligne;
        } else {
          this.ligneTransaction.push(ligne);
        }
        this.totalTransaction = this.ligneTransaction.reduce((sum, l) => sum + parseFloat(String(l.total)), 0);
        this.errorMessage = '';
      },
      error => console.error('Erreur lors du scan du produit:', error)
    );
  }

  
  finalizeTransaction() {
    if (this.currentTransactionId !== null) {
      this.caisseService.finalizeTransaction(this.currentTransactionId).subscribe();
      this.currentTransactionId = null;
    }
    this.ligneTransaction = [];
    this.totalTransaction = 0;
    this.codebarre = "";
    this.errorMessage = '';
  }

  onBlurSearch() {
  setTimeout(() => {
    this.filteredProduits = [];
  }, 150); // laisse le temps au clic d'être pris en compte
}

  
  checkIfEnterKey(event: KeyboardEvent): void {
    // Vérifiez si la touche pressée est "Enter"
    if (event.key === 'Enter') {
      this.scanProduit(); // Appel à scanProduit sans argument
    }
  }

  getnameproduit() {
    console.log("codebarre:",this.codebarre);
    this.caisseService.getnomprod(this.codebarre).subscribe((data:Partial<Produit>)=>{
      this.produits=data;
      console.log("produit",this.produits);
    }
  )}

  getproduitList(){
    this.produitservice.getProduit().subscribe(data => {
      this.produit2 = data;
      console.log("produit list:", data);
    });
  }

    filterProduits(): void {
       if (!this.searchTerm.trim()) {
    this.filteredProduits = [];
    return;
  }
      this.filteredProduits = this.produit2.filter(prod =>
        prod.nomProd.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    }

    onBarcodeScanned(code: string) {
    this.showScanner = false;
    this.codebarre = code;
    this.scanProduit();
  }

  supprimerLigne(ligne: LignesTransaction) {
    if (!ligne.id) return;
    this.caisseService.deleteLigne(ligne.id).subscribe(() => {
      this.ligneTransaction = this.ligneTransaction.filter(l => l.id !== ligne.id);
      this.totalTransaction = this.ligneTransaction.reduce((sum, l) => sum + parseFloat(String(l.total)), 0);
      this.deleteConfirmLigneId = null;
    });
  }

  ajouterLigneLibre() {
    if (!this.librePrix) return;
    this.caisseService.ajouterLigneLibre(this.libreDesc.trim(), this.librePrix, this.currentTransactionId).subscribe(data => {
      this.currentTransactionId = data.transaction;
      const ligne: LignesTransaction = { ...data };
      this.ligneTransaction.push(ligne);
      this.totalTransaction = this.ligneTransaction.reduce((sum, l) => sum + parseFloat(String(l.total)), 0);
      this.libreDesc = '';
      this.librePrix = null;
      this.showLibre = false;
    });
  }

  ajouterProduitParNom(produit: Produit) {
    this.searchTerm = '';
    this.filteredProduits = [];

    this.caisseService.scanProduitbynomprod(produit.nomProd, this.currentTransactionId).subscribe(data => {
      this.currentTransactionId = data.transaction;
      const ligne: LignesTransaction = { ...data, produitDetails: produit };

      const existingIndex = this.ligneTransaction.findIndex(l => l.produit === data.produit);
      if (existingIndex !== -1) {
        this.ligneTransaction[existingIndex] = ligne;
      } else {
        this.ligneTransaction.push(ligne);
      }
      this.totalTransaction = this.ligneTransaction.reduce((sum, l) => sum + parseFloat(String(l.total)), 0);
    });
  }



}