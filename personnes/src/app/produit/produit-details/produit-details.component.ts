import { Component, inject, OnInit } from '@angular/core';
import { Produit } from '../produit.model';
import { ProduitService } from '../produit.service';
import { CommonModule, NgFor } from '@angular/common';
import { FormsModule, NgModel } from '@angular/forms';

@Component({
  selector: 'app-produit-details',
  standalone: true,
  imports: [NgFor,FormsModule,CommonModule],
  templateUrl: './produit-details.component.html',
  styleUrl: './produit-details.component.css'
})
export class ProduitDetailsComponent implements OnInit{
  produit: Produit[]=[];
  filteredProduits: Produit[] = []; 
  searchTerm: string = ''; 
  //private route = inject(ActivatedRoute);
  private produitService = inject(ProduitService);

  
 
  ngOnInit(): void {
    this.loadProduit();
   
  }
  filterProduits(): void {
    this.filteredProduits = this.produit.filter(prod =>
      prod.nomProd.toLowerCase().includes(this.searchTerm.toLowerCase())
    );
  }

  loadProduit():void{
    this.produitService.getProduit().subscribe({
      next:(data)=>{
        this.produit=data;
      },
    })
  }
  updateProduit(produit: Produit): void {
    
    this.produitService.updateProduit(produit).subscribe({
      next: () => {
        console.log(`Les détails de ${produit.nomProd} ont été mis à jour`);
      },
      error: (error) => {
        console.error('Erreur lors de la mise à jour des détails de la personne', error);
      }
    });
  }

  deleteProduit(produitId: number | null): void {
    if (produitId == null) { // '==' vérifie à la fois null et undefined
      console.error("Tentative de suppression d'un produit sans ID valide.");
      return;
    }
    // Pas besoin de vérifier si personneId est null ici car nous avons modifié la signature de la méthode pour n'accepter que des numbers
    this.produitService.deleteProduit(produitId).subscribe({
      next: (result) => {
        console.log(`Produit avec id=${produitId} supprimé`, result);
        this.loadProduit();  // Rafraîchit la liste après la suppression
      },
      error: (error) => {
        console.error(`Erreur lors de la suppression du produit`, error);
      }
    });
  }

}
