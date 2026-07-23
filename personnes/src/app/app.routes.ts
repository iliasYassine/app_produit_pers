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
import { LoginComponent } from './auth/login/login.component';
import { authGuard } from './auth/auth.guard';

export const routes: Routes = [
    // Public (accès sans connexion)
    { path: 'login', component: LoginComponent },
    { path: 'formulaire', component: FormulaireComponent },
    { path: 'suivie_client', component: SuiviCommandeClientComponent },

    // Protégé par connexion Google
    { path: 'personnes', component: PersonneListComponent, canActivate: [authGuard] },
    { path: 'produits', component: ProduitListComponent, canActivate: [authGuard] },
    { path: 'cout', component: ReportsComponent, canActivate: [authGuard] },
    { path: 'fournisseur', component: FournisseurListsComponent, canActivate: [authGuard] },
    { path: 'caisse', component: CaisseEnregistreuseComponent, canActivate: [authGuard] },
    { path: 'gestion_caisse', component: DeleteLignesComponent, canActivate: [authGuard] },
    { path: 'commande', component: CommandeComponent, canActivate: [authGuard] },
    { path: 'capital', component: CapitalComponent, canActivate: [authGuard] },
    { path: 'vehicules', component: VehiculeListComponent, canActivate: [authGuard] },
    { path: 'frais', component: FraisComponent, canActivate: [authGuard] },
];
