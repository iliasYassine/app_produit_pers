export interface Commande {
    id?: number;
    client?: number | null; // ID du client (clé étrangère)
    date_commande?: string | null; // ISO string (ex: '2024-06-10T12:34:56Z')
    montant_total?: number | null;
    statut?: string | null;
    type_expedition?: string | null;
    numero_suivi?: string | null;
    commentaire?: string | null;
    numero_expediteur?: string | null;
    facture?: File | string | null; // URL du fichier facture ou objet File
}