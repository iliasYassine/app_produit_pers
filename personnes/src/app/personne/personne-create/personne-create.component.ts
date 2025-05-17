import { Component } from '@angular/core';
import { User } from '../personne.model';
import { PersonneService } from '../personne.service';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
  selector: 'app-personne-create',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './personne-create.component.html',
  styleUrl: './personne-create.component.css'
})
export class PersonneCreateComponent {
  personne: User = {
    id: null,
    name: '',
    prenom:'',
    tel:'',
    // initialisation des autres propriétés…
  };
  
  constructor(private personneService: PersonneService) {}

  createPersonne(): void {
    this.personneService.createPersonne(this.personne).subscribe({
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
