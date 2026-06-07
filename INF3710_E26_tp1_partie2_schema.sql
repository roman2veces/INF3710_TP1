-- Database: TP1

SET search_path TO UniDB;

CREATE SCHEMA IF NOT EXISTS UniDB;

CREATE EXTENSION IF NOT EXISTS citext;


-- types
CREATE TYPE role_enseignant AS ENUM ('responsable','intervenant');
CREATE TYPE etat_formation AS ENUM ('ouverte','suspendue');
CREATE TYPE type_module AS ENUM ('obligatoire','optionnel');
CREATE TYPE type_evaluation AS ENUM ('CC','TP','Examen');
CREATE TYPE statut_enseignant AS ENUM ('permanent','vacataire');
CREATE TYPE type_structure AS ENUM ('departement','facultee');


-- tables

CREATE TABLE IF NOT EXISTS Diplome (
	intitule	VARCHAR(50)	NOT NULL,
	niveau		SMALLINT	NOT NULL,

	PRIMARY KEY (intitule)
);
CREATE TABLE IF NOT EXISTS Formation (
	ID				NUMERIC			NOT NULL,
	nom				VARCHAR(50)		NOT NULL,
	diplome			VARCHAR(50)		NOT NULL,
	etat			etat_formation	NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (diplome) REFERENCES Diplome(intitule)
);

CREATE TABLE IF NOT EXISTS Parcours (
	ID				NUMERIC		NOT NULL,
	nom				VARCHAR(50)	NOT NULL,
	formation_id	NUMERIC		NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (formation_id) REFERENCES Formation(ID)
);


CREATE TABLE IF NOT EXISTS Campus (
	nom 	VARCHAR(30) 	NOT NULL,
	pays 	VARCHAR(20) 	NOT NULL,
	PRIMARY KEY (pays)
);

CREATE TABLE IF NOT EXISTS StructureAcademique (
	ID			NUMERIC			NOT NULL,
	nom			VARCHAR(30)		NOT NULL,
	type		type_structure	NOT NULL,
	campus_pays	VARCHAR(20)		NOT NULL,

	PRIMARY KEY (ID),
	FOREIGN KEY (campus_pays) REFERENCES Campus(pays)
);

CREATE TABLE IF NOT EXISTS Personne (
	matricule	NUMERIC 			NOT NULL,
	nom			VARCHAR(50)		NOT NULL,
	prenom		VARCHAR(50)		NOT NULL,
	courriel	CITEXT			NOT NULL,

	PRIMARY KEY (matricule),
	CONSTRAINT courriel_valide CHECK (
		courriel ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'
	)
);

CREATE TABLE IF NOT EXISTS PersonnelAdministratif (
	matricule	NUMERIC			NOT NULL,
	fonction	VARCHAR(30)		NOT NULL,

	PRIMARY KEY (matricule),
	FOREIGN KEY (matricule) REFERENCES Personne(matricule)
);

CREATE TABLE IF NOT EXISTS Etudiant (
	matricule	NUMERIC		NOT NULL,
	no_etudiant	NUMERIC		NOT NULL UNIQUE,
	parcours_id	NUMERIC		NOT NULL,
	
	PRIMARY KEY (matricule),
	FOREIGN KEY (matricule) REFERENCES Personne(matricule),
	FOREIGN KEY (parcours_id) 	REFERENCES Parcours(ID)
);

CREATE TABLE IF NOT EXISTS Enseignant (
	matricule	NUMERIC				NOT NULL,
	statut		statut_enseignant	NOT NULL,
	grade		SMALLINT			NOT NULL,
	
	PRIMARY KEY (matricule),
	FOREIGN KEY (matricule) REFERENCES Personne(matricule)
);

CREATE TABLE IF NOT EXISTS ModuleCours(
	ID			NUMERIC		NOT NULL,
	libelle		VARCHAR(20)	NOT NULL,
	n_credits	SMALLINT	NOT NULL,
	
	PRIMARY KEY (ID),
	CONSTRAINT credits_valide CHECK (n_credits > 0 AND n_credits < 120)
);

CREATE TABLE IF NOT EXISTS Evaluation (
	ID			NUMERIC			NOT NULL,
	module_id	NUMERIC			NOT NULL,
	type_eval	type_evaluation	NOT NULL,
	coefficient	NUMERIC(5,2)	NOT NULL,

	PRIMARY KEY (ID),
	FOREIGN KEY (module_id) REFERENCES ModuleCours(ID)
);

CREATE TABLE IF NOT EXISTS Note (
	note_obtenue	NUMERIC(5,2)	NOT NULL,
	no_etudiant		NUMERIC			NOT NULL,
	evaluation		NUMERIC			NOT NULL,

	PRIMARY KEY (no_etudiant, evaluation),
	FOREIGN KEY (no_etudiant) REFERENCES Etudiant(no_etudiant),
	FOREIGN KEY (evaluation)  REFERENCES Evaluation(ID),

 	CONSTRAINT note_positive CHECK (note_obtenue > 0 OR note_obtenue = 0)
);


CREATE TABLE IF NOT EXISTS PriseChargeModule(
	enseignant		NUMERIC				NOT NULL,
	module_id		NUMERIC				NOT NULL,
	responsabilite	role_enseignant		NOT NULL,	
	annee			NUMERIC(4,0)		NOT NULL,
	campus_pays		VARCHAR(20)			NOT NULL,
	chargeHoraire	NUMERIC(4,2),

	PRIMARY KEY (enseignant, module_id),
	FOREIGN KEY (enseignant) REFERENCES Enseignant(matricule),
	FOREIGN KEY (module_id) REFERENCES ModuleCours(ID),
	FOREIGN KEY (campus_pays) REFERENCES Campus(pays)
);

CREATE TABLE IF NOT EXISTS ParcoursModule(
	parcours_id		NUMERIC			NOT NULL,
	module_id		NUMERIC			NOT NULL,
	obligatoire		type_module		NOT NULL,

	PRIMARY KEY (parcours_id, module_id),
	FOREIGN KEY (parcours_id) REFERENCES Parcours(ID),
	FOREIGN KEY (module_id) REFERENCES ModuleCours(ID)
);




