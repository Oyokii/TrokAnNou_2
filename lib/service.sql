-- SQLite
CREATE TABLE IF NOT EXISTS service (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
libelle VARCHAR
descriptif VARCHAR
idTheme VARCHAR(255) NOT NULL
idUsager VARCHAR VARCHAR(255) NOT NULL
publie INTEGER
);

INSERT INTO services (libelle, descriptif, idTheme, idUsager, publie)
VALUES
('Reparation de voiture', 'Pour réparer les voitures ', 5, 2, true),
('Decoration interieur', 'Pour faire revivre votre maison, 1, 1, true'),
('Coach sportif', 'Pour séduire les métisses', 3, 3, true),
('Apprendre a developper', 'Apprendre a developper', 4, 4, true)
;