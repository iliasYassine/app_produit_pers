import { Produit } from "../produit/produit.model";

export interface Commande {
    id: number;
    client : number| null;
    dateCommande: Date;
    montant_total: number
    statut?: string;
    type_expedition?: string;
    numero_suivi?: string;
    commentaire?: string;
    facture?: File|null;
   
  }