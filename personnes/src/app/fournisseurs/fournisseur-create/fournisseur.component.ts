import { Component } from '@angular/core';
import { Fournisseur } from '../fournisseur.model';
import { ServiceFournisseurService } from '../service-fournisseur.service';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
  selector: 'app-fournisseur',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './fournisseur.component.html',
  styleUrl: './fournisseur.component.css'
})
export class FournisseurComponent {
  fournisseur: Fournisseur = {
    id: null,
    nom: '',
    tel:0,
    adresse:'',
    email:''
    // initialisation des autres propriétés…
  };
  
  constructor(private fournisseurService: ServiceFournisseurService) {}

  createFournisseur(): void {
    this.fournisseurService.createFournisseur(this.fournisseur).subscribe({
      next: (response) => {
        console.log('Personne créée avec succès', response);
        // Implémentez une redirection ou une notification ici si nécessaire
      },
      error: (error) => {
        console.error("Erreur lors de la création de la personne", error);
      }
    });
  }
}
