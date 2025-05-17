import { Component, OnInit } from '@angular/core';
import { CaisseService } from '../caisse.service';
import { CommonModule, NgFor, NgIf } from '@angular/common';
import {LignesTransaction} from '../ligne.model'
import { Produit } from '../../produit/produit.model';
import { FormsModule } from '@angular/forms';
import { ProduitDetailsComponent } from '../../produit/produit-details/produit-details.component';
@Component({
  selector: 'app-caisse-enregistreuse',
  standalone: true,
  imports: [NgFor,FormsModule,NgIf,CommonModule],
  templateUrl: './caisse-enregistreuse.component.html',
  styleUrl: './caisse-enregistreuse.component.css'
})
export class CaisseEnregistreuseComponent implements OnInit {
  
  ligneTransaction : LignesTransaction[]=[];
  
  totalTransaction = 0;
  codebarre: string = "";
  produits!: Partial<Produit>;
  errorMessage: string = '';

  ngOnInit() {
    console.log("codebarre1:",this.codebarre);
    console.log("produit1:",this.produits);
  
  }


  constructor(private caisseService: CaisseService) {}

 
  

  scanProduit() {
    if (this.codebarre.trim() === '') {
      this.errorMessage = 'Erreur: Le code-barre est vide.';
      return;
    }
  
    console.log("dans la fonction scan produit");
  
    this.caisseService.scanProduit(this.codebarre).subscribe(
      response => {
        console.log("response", response);
        this.totalTransaction += parseFloat(response.total);
  
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


}
