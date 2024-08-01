
export interface Produit {
    id: number|null ;
    nomProd :string;
    prixAchat :number;   
    prixVente :number;
    qte  :number;
    qteMin:number;
    codeBarre:string;
    fournisseur_id:number;
    
  }