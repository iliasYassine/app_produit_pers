import { Component, OnInit } from '@angular/core';
import { CaisseService } from '../caisse.service';
import { CommonModule, NgFor, NgIf } from '@angular/common';
import {LignesTransaction} from '../ligne.model'
import { Produit } from '../../produit/produit.model';
import { FormsModule } from '@angular/forms';
import { ProduitDetailsComponent } from '../../produit/produit-details/produit-details.component';
import { ProduitService } from '../../produit/produit.service';
@Component({
  selector: 'app-caisse-enregistreuse',
  standalone: true,
  imports: [NgFor,FormsModule,NgIf,CommonModule,NgIf],
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
  
    this.caisseService.scanProduit(this.codebarre).subscribe(
      response => {
        console.log("reponse du scanproduit:", response);
        this.totalTransaction += parseFloat(response.total);
        console.log("totalTransaction:", this.totalTransaction);
        // Ajouter une ligne de transaction avec un produit associé
        const ligne: LignesTransaction = { ...response, produit: null }; // Ajouter une propriété produit
        this.ligneTransaction.push(ligne);
  
        // Récupérer les détails du produit et les associer à la ligne
        this.caisseService.getnomprod(this.codebarre).subscribe((data: Partial<Produit>) => {
          ligne.produitDetails = data; // Associer le produit à la ligne
          console.log("Produit associé à la ligne :", ligne);
        });
  
        this.errorMessage = ''; // Réinitialiser le message d'erreur
      },
      error => console.error('Erreur lors du scan du produit:', error)
    );
  }

  
  finalizeTransaction() {
    this.ligneTransaction = []; // Réinitialiser le tableau des lignes de transaction
    this.totalTransaction = 0;   // Réinitialiser le montant total
    this.codebarre = "";         // Réinitialiser le champ du code-barre
    this.errorMessage = '';  
   
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
      this.filteredProduits = this.produit2.filter(prod =>
        prod.nomProd.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    }

    ajouterProduitParNom(produit:Produit){
      const ligne: LignesTransaction = {
    id: 0,
    quantite: 1,
    prix_unitaire: produit.prixVente ??0,
    total: produit.prixVente??0,
    produit: produit.id ?? 0, // Utilise 0 si produit.id est null ou undefined
    transaction: 0, // ou l'id réel si tu l'as
    produitDetails: produit
  };
  console.log("ligne de transaction:", ligne);
    // Ferme la liste des résultats
  this.searchTerm = '';
  this.filteredProduits = [];

  this.caisseService.scanProduitbynomprod(produit.nomProd).subscribe(data=>{
     this.totalTransaction += parseFloat(data.total);
      console.log("totalTransaction:", this.totalTransaction);
        // Ajouter une ligne de transaction avec un produit associé
      const ligne: LignesTransaction = { ...data, produit: null }; // Ajouter une propriété produit
      this.ligneTransaction.push(ligne);

  })

 // Ferme la liste des résultats
  this.searchTerm = '';
  this.filteredProduits = [];
  

}


}
