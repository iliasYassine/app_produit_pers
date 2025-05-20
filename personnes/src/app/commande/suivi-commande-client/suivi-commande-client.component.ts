import { Component, NgModule, OnInit } from '@angular/core';
import { CommandeService } from '../commande.service';
import { Commande } from '../commande.model';
import { CommonModule, NgFor, NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-suivi-commande-client',
  standalone: true,
  imports: [NgIf,NgFor,CommonModule,FormsModule],
  templateUrl: './suivi-commande-client.component.html',
  styleUrl: './suivi-commande-client.component.css'
})
export class SuiviCommandeClientComponent implements OnInit {
   searchNumeroSuivi: string = '';
  isFiltered: boolean = false;
allCommandes: Commande[] = [];
  commande:Commande[]=[]
    constructor(private service_commande:CommandeService) {}

  ngOnInit(): void {
     
   
  }

 
rechercherParNumeroSuivi() {
  if (this.searchNumeroSuivi.trim() !== '') {
    this.service_commande.getCommandeByNumeroSuivi(this.searchNumeroSuivi.trim()).subscribe(data => {
      this.commande = [data]; // Place la commande trouvée dans le tableau
    }, error => {
      this.commande = [];
      // Optionnel : afficher un message d'erreur si non trouvé
    });
  }
}


resetRecherche() {
  this.commande = this.allCommandes;
  this.searchNumeroSuivi = '';
  this.isFiltered = false;
}


 

}
