-- Data add

SET search_path TO UniDB;

INSERT INTO Diplome VALUES('B.ing. Informatique', 1);
INSERT INTO Diplome VALUES('B.Sc. Informatique', 1);
INSERT INTO Diplome VALUES('B.ing. Logiciel', 1);
INSERT INTO Diplome VALUES('B.ing. Electrique', 1);
INSERT INTO Diplome VALUES('Maitrise Informatique', 2);

INSERT INTO Formation VALUES(1, 'Informatique emb.', 'B.ing. Informatique', 'ouverte');
INSERT INTO Formation VALUES(2, 'Cybersecurite', 'B.ing. Logiciel', 'ouverte');
INSERT INTO Formation VALUES(3, 'Infographie', 'B.ing. Logiciel', 'suspendue');

INSERT INTO Parcours VALUES(1, 'Parcours regulier', 1);
INSERT INTO Parcours VALUES(2, 'Parcours accelere', 1);
INSERT INTO Parcours VALUES(3, 'Cybersecu de base', 2);
INSERT INTO Parcours VALUES(4, 'Cybersecu reseaux', 2);

INSERT INTO Campus VALUES('Campus 1', 'Canada');
INSERT INTO Campus VALUES('Campus 2', 'Etats-Unis');
INSERT INTO Campus VALUES('Campus 3', 'France');

INSERT INTO StructureAcademique VALUES(0, 'Dep. Genie logiciel', 'departement', 'Canada');
INSERT INTO StructureAcademique VALUES(1, 'Fac. recherche 1', 'facultee', 'Etats-Unis');

INSERT INTO Personne VALUES(12345, 'Paul', 'Bob', 'paul.bob@example.com');
INSERT INTO Personne VALUES(12346, 'Pierre', 'Gilles', 'Pierre.Gilles@example.com');
INSERT INTO Personne VALUES(12344, 'Jean', 'Jean-Paul', 'jpj@aaaaaaa.net');
INSERT INTO Personne VALUES(12348, 'Jaques', 'Julie', 'jjjjjjj@jjj.fr');
INSERT INTO Personne VALUES(12349, 'Roy', 'Alice', 'alice.roy@example.com');
INSERT INTO Personne VALUES(12347, 'Robert', 'Gilbert', 'jenesais@plusquoimettre.ici');

INSERT INTO PersonnelAdministratif VALUES(12349, 'Secretaire');

INSERT INTO Etudiant VALUES(12344, 20031, 1);
INSERT INTO Etudiant VALUES(12345, 20032, 3);
INSERT INTO Etudiant VALUES(12346, 20033, 3);
INSERT INTO Etudiant VALUES(12347, 20034, 3);

INSERT INTO Enseignant VALUES(12347, 'vacataire', 2);
INSERT INTO Enseignant VALUES(12348, 'permanent', 10);

INSERT INTO ModuleCours VALUES(1, 'INF1000', 3);
INSERT INTO ModuleCours VALUES(2, 'INF2001', 2);
INSERT INTO ModuleCours VALUES(3, 'INF3710', 3);
INSERT INTO ModuleCours VALUES(4, 'MTH2210', 2);
INSERT INTO ModuleCours VALUES(5, 'MAT4700', 3);
INSERT INTO ModuleCours VALUES(6, 'LOG4301', 3);
INSERT INTO ModuleCours VALUES(7, 'INF8100', 4);
INSERT INTO ModuleCours VALUES(8, 'ING9009', 8);

INSERT INTO Evaluation VALUES(0, 4, 'Examen', 30.00);
INSERT INTO Evaluation VALUES(1, 6, 'TP', 5.00);
INSERT INTO Evaluation VALUES(2, 6, 'TP', 5.00);
INSERT INTO Evaluation VALUES(3, 6, 'TP', 5.00);
INSERT INTO Evaluation VALUES(4, 2, 'CC', 25.00);

INSERT INTO Note VALUES(90.00, 20032, 1);
INSERT INTO Note VALUES(94.00, 20032, 2);
INSERT INTO Note VALUES(79.50, 20032, 3);
INSERT INTO Note VALUES(76.20, 20034, 0);

INSERT INTO PriseChargeModule VALUES(12348, 4, 'responsable', 2020, 'Canada', 20.00);
INSERT INTO PriseChargeModule VALUES(12348, 5, 'responsable', 2019, 'Canada', 25.00);
INSERT INTO PriseChargeModule VALUES(12347, 4, 'intervenant', 2026, 'Canada', 10.00);

INSERT INTO ParcoursModule VALUES(1, 1, 'obligatoire');
INSERT INTO ParcoursModule VALUES(1, 2, 'obligatoire');
INSERT INTO ParcoursModule VALUES(1, 3, 'obligatoire');
INSERT INTO ParcoursModule VALUES(1, 4, 'obligatoire');
INSERT INTO ParcoursModule VALUES(1, 6, 'obligatoire');
INSERT INTO ParcoursModule VALUES(2, 1, 'obligatoire');
INSERT INTO ParcoursModule VALUES(2, 2, 'obligatoire');
INSERT INTO ParcoursModule VALUES(2, 3, 'optionnel');
INSERT INTO ParcoursModule VALUES(2, 4, 'obligatoire');
INSERT INTO ParcoursModule VALUES(2, 6, 'optionnel');