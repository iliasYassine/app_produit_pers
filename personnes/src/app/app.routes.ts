import { Routes } from '@angular/router';
import { PersonneListComponent } from './personne/personne-list/personne-list.component';
import { PersonneDetailsComponent } from './personne/personne-details/personne-details.component';
import { ProduitListComponent } from './produit/produit-list/produit-list.component';
import { PersonneCreateComponent } from './personne/personne-create/personne-create.component';
import { ReportsComponent } from './reports/reports.component';
import { ProduitDetailsComponent } from './produit/produit-details/produit-details.component';
import { ProduitCreateComponent } from './produit/produit-create/produit-create.component';
import { FournisseurComponent } from './fournisseurs/fournisseur-create/fournisseur.component';
import { FournisseurListsComponent } from './fournisseurs/fournisseur-lists/fournisseur-lists.component';
import { CaisseEnregistreuseComponent } from './caisse/caisse-enregistreuse/caisse-enregistreuse.component';

export const routes: Routes = [
    { path: 'personnes', component: PersonneListComponent, pathMatch: 'full' },
    { path: 'details_personnes', component: PersonneDetailsComponent },
    { path: 'create_personnes', component: PersonneCreateComponent },
    { path: 'produits', component: ProduitListComponent },
    { path: 'details_produit', component: ProduitDetailsComponent },
    { path: 'create_produit', component: ProduitCreateComponent },
    { path: 'cout', component: ReportsComponent },
    { path: 'fournisseur', component: FournisseurListsComponent },
    { path: 'create_fournisseur', component: FournisseurComponent },
    { path: 'caisse', component: CaisseEnregistreuseComponent },
];
