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
  produit: Produit = {
    id:null,
    nomProd :'',
    prixAchat :0,  
    prixVente :0,
    qte  :0,
    qteMin:0,
    codeBarre:'',
    fournisseur_id:0,
    // initialisation des autres propriétés…
  };
  
  constructor(private produitService: ProduitService) {}

  createProduit(): void {
    this.produitService.createProduit(this.produit).subscribe({
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
