import { Component } from '@angular/core';
import { CaisseService } from '../caisse.service';
import { NgFor } from '@angular/common';
import {LignesTransaction} from '../ligne.model'
@Component({
  selector: 'app-caisse-enregistreuse',
  standalone: true,
  imports: [NgFor],
  templateUrl: './caisse-enregistreuse.component.html',
  styleUrl: './caisse-enregistreuse.component.css'
})
export class CaisseEnregistreuseComponent {
  ligneTransaction : LignesTransaction[]=[];
  
  totalTransaction = 0;

  constructor(private caisseService: CaisseService) {}

  scanProduit(codeBarre: string) {
    this.caisseService.scanProduit(codeBarre).subscribe(
      response => {
        console.log("response",response);
        this.totalTransaction += parseFloat(response.total);
        console.log("response",response);
        this.ligneTransaction.push(response);
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

  
  checkIfEnterKey(event: KeyboardEvent, codeBarre: string): void {
    if (event.key === 'Enter') {
      this.scanProduit(codeBarre);
    }
  }
}
