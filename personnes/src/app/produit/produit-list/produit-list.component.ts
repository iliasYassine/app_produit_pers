import { Component, OnInit } from '@angular/core';
import { Produit } from '../produit.model';
import { ProduitService } from '../produit.service';
import { NgFor, NgIf } from '@angular/common';

@Component({
  selector: 'app-produit-list',
  standalone: true,
  imports: [NgFor,NgIf],
  templateUrl: './produit-list.component.html',
  styleUrl: './produit-list.component.css'
})
export class ProduitListComponent implements OnInit{
  produit: Produit[] = [];

  constructor(private produitService: ProduitService) {}

  ngOnInit(): void {
   this.getproduitlist();
  }

  getproduitlist(){
    this.produitService.getProduit().subscribe(data=>{
      this.produit = data;
      console.log("produitlist:",this.produit);
    })}

}
