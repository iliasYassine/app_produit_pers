import { Component } from '@angular/core';
import { ProduitService } from '../produit.service';
import { Produit } from '../produit.model';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-produit-create',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './produit-create.component.html',
  styleUrl: './produit-create.component.css'
})  
export class ProduitCreateComponent {
  
  nomprod = "";
  prixachat: number | null = null;
  prixvente: number | null = null;
  qte: number | null = null;
  qtemin: number | null = null;  
  codebarre = "";
  fournisseur_id: number | null = null;
 


  
  constructor(private produitService: ProduitService) {}

  createProduit(): void {
  
    const produitData: Produit = {
      id: null, // Laissez l'ID null pour la création
      nomProd: this.nomprod,    
      prixAchat: this.prixachat,
      prixVente: this.prixvente,    
      qte: this.qte,
      qteMin: this.qtemin,
      codeBarre: this.codebarre,
      fournisseur: this.fournisseur_id
    };
    console.log("produitdata:",produitData);





    this.produitService.createProduit(produitData).subscribe({
      next: (response) => {
        console.log('produit créée avec succès', response);
        // Implémentez une redirection ou une notification ici si nécessaire
      },
      error: (error) => {
        console.error("Erreur lors de la création de la produit", error);
      }
    });
  }

}
