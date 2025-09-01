import { Component, OnInit } from '@angular/core';
import { CommandeService } from '../commande.service';
import { Commande } from '../commande.model';
import { CommonModule, NgFor, NgIf } from '@angular/common';
import Swal from 'sweetalert2';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-commande',
  standalone: true,
  imports: [NgIf,NgFor,CommonModule],
  templateUrl: './commande.component.html',
  styleUrl: './commande.component.css'
})
export class CommandeComponent implements OnInit {
  baseUrl = environment.apiUrl;
  commande:Commande[]=[];
  constructor(private service_commande:CommandeService) { }

  ngOnInit(): void {
    this.getCommande()
    
  }
  getCommande(){
    this.service_commande.getCommandes().subscribe(data=>{
      this.commande=data
    })

  }


  updateCommande(id:number,commande:Commande){
    this.service_commande.updateCommande(id,commande).subscribe(data=>{
      console.log("Commande modifiée avec succès",data);
      this.getCommande();
    },error=>{
      console.log("Erreur lors de la modification de la commande",error);
    })
  }

  deleteCommande(id:number){
    this.service_commande.deleteCommande(id).subscribe(data=>{
      console.log("Commande supprimée avec succès",data);
      this.getCommande();
    },error=>{
      console.log("Erreur lors de la suppression de la commande",error);
    })
  } 

}
