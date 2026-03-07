import { Routes } from '@angular/router';
import { PersonneListComponent } from './personne/personne-list/personne-list.component';
import { ProduitListComponent } from './produit/produit-list/produit-list.component';
import { ReportsComponent } from './reports/reports.component';
import { FournisseurListsComponent } from './fournisseurs/fournisseur-lists/fournisseur-lists.component';
import { CaisseEnregistreuseComponent } from './caisse/caisse-enregistreuse/caisse-enregistreuse.component';
import { DeleteLignesComponent } from './caisse/delete-lignes/delete-lignes.component';
import { FormulaireComponent } from './formulaire/formulaire/formulaire.component';
import { CommandeComponent } from './commande/commande/commande.component';
import { SuiviCommandeClientComponent } from './commande/suivi-commande-client/suivi-commande-client.component';
import { CapitalComponent } from './capital/capital.component';
import { VehiculeListComponent } from './vehicules/vehicule-list.component';
import { FraisComponent } from './frais/frais.component';

export const routes: Routes = [
    { path: 'personnes', component: PersonneListComponent },
    { path: 'produits', component: ProduitListComponent },
    { path: 'cout', component: ReportsComponent },
    { path: 'fournisseur', component: FournisseurListsComponent },
    { path: 'caisse', component: CaisseEnregistreuseComponent },
    { path: 'gestion_caisse', component: DeleteLignesComponent },
    { path: 'formulaire', component: FormulaireComponent },
    { path: 'commande', component: CommandeComponent },
    { path: 'suivie_client', component: SuiviCommandeClientComponent },
    { path: 'capital', component: CapitalComponent },
    { path: 'vehicules', component: VehiculeListComponent },
    { path: 'frais', component: FraisComponent },
];
