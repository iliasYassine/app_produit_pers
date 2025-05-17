import { Produit } from "../produit/produit.model";

export interface LignesTransaction {
    id: number;
    quantite: number;
    prix_unitaire:number;
    total:number;
    produit:number;
    transaction:number;
    produitDetails?: Partial<Produit>;

    
  }