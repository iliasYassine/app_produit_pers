import { Produit } from "../produit/produit.model";

export interface LignesTransaction {
    id: number | null;
    quantite: number;
    prix_unitaire:number;
    total:number;
    produit_id:number;
    transaction_id:number;
    produit?: Partial<Produit>;

    
  }