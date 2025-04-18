import { Component } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';
import { PersonneListComponent } from './personne/personne-list/personne-list.component';
import { ProduitListComponent } from './produit/produit-list/produit-list.component';
import { PersonneDetailsComponent } from './personne/personne-details/personne-details.component';
import { routes } from './app.routes';
import { ReportsComponent } from './reports/reports.component';
import { ProduitDetailsComponent } from './produit/produit-details/produit-details.component';
import { NavbarComponent } from './navbar/navbar.component';
import { FournisseurComponent } from './fournisseurs/fournisseur-create/fournisseur.component';
import { FournisseurListsComponent } from './fournisseurs/fournisseur-lists/fournisseur-lists.component';
import { CaisseEnregistreuseComponent } from './caisse/caisse-enregistreuse/caisse-enregistreuse.component';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,PersonneListComponent,ProduitListComponent,PersonneDetailsComponent,ReportsComponent,ProduitDetailsComponent,NavbarComponent,FournisseurComponent,FournisseurListsComponent,CaisseEnregistreuseComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent  {
  title = 'personnes';
  constructor(router: Router) {
    // Ajouter les routes à la configuration du routeur
    router.resetConfig(routes);
  }








}
