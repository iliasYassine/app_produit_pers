-- Import produits reçus - fournisseur Mohamed Polonais
-- qteMin = 3 pour tous, prixVente = prixAchat x 2
-- A executer via: mysql -u DB_USER -p -h localhost DB_NAME < import_produits_mohamed_polonais.sql

SET @fid = (SELECT id FROM fournisseurs WHERE nom LIKE '%Polonais%' LIMIT 1);

-- Sécurité : arrête si le fournisseur n'a pas été trouvé
SELECT IF(@fid IS NULL, 'ERREUR: fournisseur introuvable', CONCAT('OK fournisseur id=', @fid)) AS verif;

INSERT INTO produits (nomProd, prixAchat, prixVente, qte, qteMin, fournisseur_id) VALUES
-- Cp Collection Imperium (3,5€/u)
('Cp Collection Imperium - Rouge', 3.5, 7.00, 10, 3, @fid),
('Cp Collection Imperium - Glace Vanille', 3.5, 7.00, 10, 3, @fid),
('Cp Collection Imperium - Infinity', 3.5, 7.00, 10, 3, @fid),
('Cp Collection Imperium - Élixir', 3.5, 7.00, 11, 3, @fid),
('Cp Collection Imperium - Full Moon', 3.5, 7.00, 7, 3, @fid),
('Cp Collection Imperium - Times', 3.5, 7.00, 9, 3, @fid),
('Cp Collection Imperium - Esprit of Dubaï', 3.5, 7.00, 10, 3, @fid),

-- Parfums individuels
('Kenzie Oud Blend', 7.9, 15.80, 5, 3, @fid),
('Le Rouge Baraque Extrême', 7.5, 15.00, 7, 3, @fid),
('Qissa Pink', 7.0, 14.00, 5, 3, @fid),
('Taskeen (Lekel)', 8.5, 17.00, 5, 3, @fid),
('Marshmallow Blush', 13.5, 27.00, 5, 3, @fid),
('Marshmallow Luis Martin', 7.5, 15.00, 5, 3, @fid),

-- Collection Mystical (0,9€/u, 12u/boite)
('Collection Mystical - Hayati', 0.9, 1.80, 12, 3, @fid),
('Collection Mystical - Mayar Intense', 0.9, 1.80, 12, 3, @fid),
('Collection Mystical - Fakhar Black', 0.9, 1.80, 12, 3, @fid),
('Collection Mystical - Hayati Bleu', 0.9, 1.80, 12, 3, @fid),

-- Yum Yum (1,95€/u) - Vanille remplacée par Chocolat par erreur fournisseur
('Yum Yum - Bonbon', 1.95, 3.90, 5, 3, @fid),
('Yum Yum - Banane Caramel', 1.95, 3.90, 5, 3, @fid),
('Yum Yum - Chocolat', 1.95, 3.90, 5, 3, @fid),

-- Divers
('Charbon', 2.5, 5.00, 10, 3, @fid),
('Kharma 50ml', 5.5, 11.00, 5, 3, @fid),
('Ameerat El Arab 50ml', 4.8, 9.60, 5, 3, @fid),
('Yara Rose 50ml', 4.8, 9.60, 5, 3, @fid),
('Maybee Lychee', 5.5, 11.00, 4, 3, @fid),
('Maybee Marshmallow', 5.5, 11.00, 5, 3, @fid),

-- Elysia (3,5€/u) - Fleur Malesty: 1 cassé exclu du stock
('Elysia - Vanilla 28', 3.5, 7.00, 5, 3, @fid),
('Elysia - Fleur Malesty', 3.5, 7.00, 4, 3, @fid),
('Elysia - Marshmallow', 3.5, 7.00, 5, 3, @fid);

-- Vérification finale
SELECT nomProd, prixAchat, prixVente, qte, qteMin, fournisseur_id FROM produits WHERE fournisseur_id = @fid ORDER BY id DESC LIMIT 29;
