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

  ngOnInit() {
    console.log("codebarre1:",this.codebarre);
    console.log("produit1:",this.produits);
    
    
  }


  constructor(private caisseService: CaisseService) {}

  scanProduit() {
    // Ajoutez une condition pour vous assurer que le code-barre n'est pas vide
    if (this.codebarre.trim() === '') {
      console.error('Erreur: Le code-barre est vide.');
      return; // Arrêter l'exécution si le code-barres est vide
    }
  
    this.caisseService.scanProduit(this.codebarre).subscribe(
      response => {
        console.log("response",response);
        this.totalTransaction += parseFloat(response.total);
        console.log("response",response);
        this.ligneTransaction.push(response);
        this.getnameproduit(); 
        console.log("produit2:",this.produits);
        
      },
      error => console.error('Erreur lors du scan du produit:', error)
    );
  }


  finalizeTransaction() {
    // Récupération de l'ID de transaction stocké, ici posé un exemple avec localStorage
    const transactionId = localStorage.getItem('transaction_id');

    // S'assurer que transactionId n'est pas nul
    if (transactionId) {
      this.caisseService.finalizeTransaction(+transactionId).subscribe(
        response => {
          console.log('Transaction finalisée avec succès:', response);

          // Réinitialisation des transactions en cours sur le front-end
          this.ligneTransaction = [];
          this.totalTransaction = 0;

          // Supprimer l'ID de transaction du stockage local une fois la transaction finalisée
          localStorage.removeItem('transaction_id');
        },
        error => console.error('Erreur lors de la finalisation de la transaction:', error)
      );
    } else {
      console.error('Erreur: Aucune transaction en cours.');
      // Ici, vous pouvez gérer l'erreur, comme afficher un message à l'utilisateur
    }
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
