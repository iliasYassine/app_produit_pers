import { Produit } from "../produit/produit.model";

export interface Client {
id: number;
nom: string | null;
prenom: string | null;
email: string | null;
telephone: string | null;
adresse: string | null;
code_postal?: string | null; // Code postal de livraison
ville?: string | null; // Ville de livraison
    
  }