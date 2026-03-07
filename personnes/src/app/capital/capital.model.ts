export interface Mouvement {
  id?: number;
  associe: number;
  montant: number;
  type_mvt: 'injection';
  description?: string;
  document?: string;
  date_mvt?: string;
}

export interface Associe {
  id?: number;
  nom: string;
  solde: number;
  mouvements?: Mouvement[];
}
