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
import { DeleteLignesComponent } from './caisse/delete-lignes/delete-lignes.component';
import { DeleteTotalComponent } from './caisse/delete-total/delete-total/delete-total.component';
import { FormulaireComponent } from './formulaire/formulaire/formulaire.component';
import { CommandeComponent } from './commande/commande/commande.component';
import { SuiviCommandeClientComponent } from './commande/suivi-commande-client/suivi-commande-client.component';
import { MiniNavBarComponent } from './mini-nav-bar/mini-nav-bar.component';
import { NgIf } from '@angular/common';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [NgIf,RouterOutlet,PersonneListComponent,ProduitListComponent,PersonneDetailsComponent,ReportsComponent,ProduitDetailsComponent,NavbarComponent,FournisseurComponent,FournisseurListsComponent,CaisseEnregistreuseComponent,DeleteLignesComponent,DeleteTotalComponent,FormulaireComponent,CommandeComponent,SuiviCommandeClientComponent,MiniNavBarComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent  {
  title = 'personnes';
  constructor(public router: Router) {
    // Ajouter les routes à la configuration du routeur
    router.resetConfig(routes);
    
  }
  isSpecialRoute() {
  return ['/formulaire', '/suivie_client'].includes(this.router.url);
  
}








}
