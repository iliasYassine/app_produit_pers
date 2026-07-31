
export interface Produit {
    id: number|null;
    nomProd: string;
    prixAchat: number|null;
    prixVente: number|null;
    prixVenteGros: number|null;
    qte: number|null;
    qteMin: number|null;
    codeBarre: string;
    photo?: string|null;
    fournisseur: number|null;
  }

export interface AchatLigne {
  type: 'existant' | 'nouveau';
  produit_id?: number | null;
  quantite: number | null;
  prix_achat_unitaire?: number | null;
  nomProd?: string;
  prixAchat?: number | null;
  prixVente?: number | null;
  prixVenteGros?: number | null;
  qteMin?: number | null;
  codeBarre?: string;
  fournisseur?: number | null;
}

export interface AchatMarchandiseResponse {
  produits: Produit[];
  total_deduit: number;
  solde_bancaire: number;
}
