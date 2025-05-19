import { Component, OnInit } from '@angular/core';
import { FormulaireService } from '../formulaire.service';
import { FormsModule, NgForm } from '@angular/forms';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
@Component({
  selector: 'app-formulaire',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './formulaire.component.html',
  styleUrl: './formulaire.component.css',
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class FormulaireComponent implements OnInit {

  pseudo: string = '';
  nom: string = '';
  prenom: string = '';
  email: string = '';
  tel: string = '';
  adr: string = '';
  date: string = '';
  montantTotal1: number = 0;
  statut1: string = '';
  typeExpedition1: string = '';
  numeroSuivi1: string = '';
  commentaire1: string = '';
  factureUrl1: File | null = null;
  clientId1: number | null = null;

  constructor(private service_formulaire:FormulaireService) { }

  ngOnInit(): void {
    
  }
  onSubmitClient(): void {
    const client = {
      id: 0, // Assuming you want to create a new client with ID 0
      nom: this.nom,
      prenom: this.prenom,
      email: this.email,
      telephone: this.tel,
      adresse: this.adr
    };

    
    this.service_formulaire.createclient(client).subscribe(data=>{
      console.log(data);
      console.log(data.id);
      this.clientId1=data.id;
       
      
      
    })
    
  }

  onSubmitCommande(): void {
    const commande = {
      id: 0, // Assuming you want to create a new commande with ID 0
      montant_total: this.montantTotal1,
      
      type_expedition: this.typeExpedition1,
      numero_suivi: this.numeroSuivi1,
      commentaire: this.commentaire1,
      facture: this.factureUrl1,
      client: this.clientId1, // Use the clientId obtained from the client creation
      date_commande: new Date().toISOString() // Setting the current date as a Date object
    };
    
    console.log("ff", this.clientId1);
   

    this.service_formulaire.createCommande(commande).subscribe(data=>{
      console.log(data);
    })
  }
  

  payerAvecStripe() {
    let montant=this.montantTotal1
    if(this.typeExpedition1==='MondialRelay'){
        montant+=6.90;
    }
  this.service_formulaire.createStripeSession(montant).subscribe({
    next: (res) => {
      window.location.href = res.url; // Redirige vers Stripe Checkout
    },
    error: (err) => {
      alert('Erreur Stripe : ' + (err.error?.error || ''));
    }
  });
}

  

}
