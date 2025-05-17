import { Component, inject, OnInit } from '@angular/core';
import { User } from '../personne.model';
import { PersonneService } from '../personne.service';
import { ActivatedRoute } from '@angular/router';
import { CommonModule, NgFor, NgIf } from '@angular/common';
import { FormsModule, NgModel } from '@angular/forms';

@Component({
  selector: 'app-personne-details',
  standalone: true,
  imports: [NgIf,FormsModule,NgFor,CommonModule],
  templateUrl: './personne-details.component.html',
  styleUrl: './personne-details.component.css'
})
export class PersonneDetailsComponent implements OnInit{
  personnes: User[]=[];
  //private route = inject(ActivatedRoute);
  private personneService = inject(PersonneService);

  
 
  ngOnInit(): void {
    this.loadUsers();
   
  }

  loadUsers():void{
    this.personneService.getUsers().subscribe({
      next:(data)=>{
        this.personnes=data;
      },
    })
  }
  updateUser(personne: User): void {
    this.personneService.updateUser(personne).subscribe({
      next: () => {
        console.log(`Les détails de ${personne.name} ont été mis à jour`);
      },
      error: (error) => {
        console.error('Erreur lors de la mise à jour des détails de la personne', error);
      }
    });
  }

  deleteUser(personneId: number): void {
    // Pas besoin de vérifier si personneId est null ici car nous avons modifié la signature de la méthode pour n'accepter que des numbers
    this.personneService.deleteUser(personneId).subscribe({
      next: (result) => {
        console.log(`Utilisateur avec id=${personneId} supprimé`, result);
        this.loadUsers();  // Rafraîchit la liste après la suppression
      },
      error: (error) => {
        console.error(`Erreur lors de la suppression de l'utilisateur`, error);
      }
    });
  }
  







 

}
