import { Component, OnInit } from '@angular/core';
import {Fournisseur} from '../fournisseur.model';
import {ServiceFournisseurService} from '../service-fournisseur.service'
import { NgFor, NgIf } from '@angular/common';
@Component({
  selector: 'app-fournisseur-lists',
  standalone: true,
  imports: [NgFor,NgIf],
  templateUrl: './fournisseur-lists.component.html',
  styleUrl: './fournisseur-lists.component.css'
})
export class FournisseurListsComponent implements OnInit{
  fournisseur: Fournisseur[] = [];

  constructor(private fournisseurService: ServiceFournisseurService) {}

  ngOnInit(): void {
    this.fournisseurService.getFournisseur().subscribe(
      (data: Fournisseur[]) => { 
        this.fournisseur = data;
      }
    );
  }
}
