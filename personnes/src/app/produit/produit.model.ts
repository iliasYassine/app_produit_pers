
export interface Produit {
    id: number|null ;
    nomProd :string;
    prixAchat :number|null;   
    prixVente :number|null;
    qte  :number|null;
    qteMin:number|null;
    codeBarre:string;
    fournisseur:number|null;
    
  }