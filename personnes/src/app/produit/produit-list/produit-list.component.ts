import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit.model';
import { ProduitService } from '../produit.service';
import { NgFor, NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-produit-list',
  standalone: true,
  imports: [NgFor,NgIf,FormsModule],
  templateUrl: './produit-list.component.html',
  styleUrl: './produit-list.component.css'
})
export class ProduitListComponent implements OnInit{
  produit: Produit[] = [];
  filteredProduits: Produit[] = []; 
  searchTerm: string = ''; 
  constructor(private produitService: ProduitService) {}

  ngOnInit(): void {
   this.getproduitlist();
   
  }


  sendemail(){
    this.produitService.sendMail().subscribe(data=>{
      console.log("email envoyé avec succès",data);
    })

  }
  getproduitlist(){
    this.produitService.getProduit().subscribe(data=>{
      this.produit = data;
      console.log("produitlist:",this.produit);
    })}

    filterProduits(): void {
      this.filteredProduits = this.produit.filter(prod =>
        prod.nomProd.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    }
}
