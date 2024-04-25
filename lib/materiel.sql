-- SQLite
CREATE TABLE IF NOT EXISTS materiels (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
libelle VARCHAR
descriptif VARCHAR
idTheme VARCHAR(255) NOT NULL
idUsager VARCHAR VARCHAR(255) NOT NULL
publie BOOLEAN

);

INSERT INTO materiels (libelle, descriptif, idTheme, idUsager, publie)
VALUES
('Biscuit', 'Pour manger ', 5, 2, true),
('chaise', 'Pour s"assoire', 1, 1, true),
('altères', 'Pour séduire les métisses', 3, 3, true),
('Ordinateur', 'Apprendre a developper', 4, 4, true)
;

/*('Outils''13','Tondeuse''99','Javel''5'),
('chaise''45','Table''59','Cuisine''1200'),
('Velos''150','Ballons''23','trotinette''145'),
('Appareils_photos''250','Jeux_videos''123','accessoires''12')
;