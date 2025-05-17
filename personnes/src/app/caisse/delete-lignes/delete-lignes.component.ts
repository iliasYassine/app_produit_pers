import { Component, OnInit } from '@angular/core';
import { LignesTransaction } from '../ligne.model';
import { DeleteLignesService } from './delete-lignes.service';
import { get } from 'http';
import { NgFor, NgIf } from '@angular/common';

@Component({
  selector: 'app-delete-lignes',
  standalone: true,
  imports: [NgIf,NgFor],
  templateUrl: './delete-lignes.component.html',
  styleUrl: './delete-lignes.component.css'
})
export class DeleteLignesComponent implements OnInit {
  ligneTransaction: LignesTransaction[] = [];
  constructor(private service_deleteLignes:DeleteLignesService) { }


  ngOnInit(): void {
    this.getLignes();
  }

  // Ajoutez ici la logique pour supprimer les lignes de transaction
  deleteLigne(id: number) {
    // Implémentez la logique pour supprimer une ligne de transaction
    this.service_deleteLignes.deleteLignes(id).subscribe(data=>
      {
        console.log("Ligne supprimée avec succès",data);
        this.getLignes(); // Récupérer à nouveau les lignes après la suppression  
        // Vous pouvez également mettre à jour l'interface utilisateur ici si nécessaire
      })
  }

  getLignes() {
    this.service_deleteLignes.getLignes().subscribe(data => {
      this.ligneTransaction = data;
      console.log("Lignes récupérées avec succès", this.ligneTransaction);
    }, error => {
      console.error("Erreur lors de la récupération des lignes", error);
    });
  } 

}
