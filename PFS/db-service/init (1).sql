-- Création de la base de données
CREATE DATABASE IF NOT EXISTS smartspenddb;

-- Sélection de la base de données pour l'utilisation
USE smartspenddb;

-- Création de la table 'Utilisateurs'
CREATE TABLE IF NOT EXISTS Utilisateurs (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    MotDePasse VARCHAR(255),
    DateInscription DATE
);

-- Création de la table 'Categories'
CREATE TABLE IF NOT EXISTS Categories (
    CategorieID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) UNIQUE
);

-- Création de la table 'Transactions'
CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CategorieID INT,
    Montant DECIMAL(10, 2),
    Date DATE,
    Description TEXT,
    FOREIGN KEY (UserID) REFERENCES Utilisateurs(UserID),
    FOREIGN KEY (CategorieID) REFERENCES Categories(CategorieID)
);

-- Création de la table 'ObjectifsFinanciers'
CREATE TABLE IF NOT EXISTS ObjectifsFinanciers (
    ObjectifID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Nom VARCHAR(255),
    MontantCible DECIMAL(10, 2),
    DateCible DATE,
    Progression DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Utilisateurs(UserID)
);

-- Création de la table 'Alertes'
CREATE TABLE IF NOT EXISTS Alertes (
    AlerteID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Message TEXT,
    DateHeure DATETIME,
    FOREIGN KEY (UserID) REFERENCES Utilisateurs(UserID)
);

-- Insertion des catégories par défaut dans la table 'Categories'
INSERT INTO Categories (Nom) VALUES
('Nourriture'),
('Logement'),
('Transport'),
('Loisirs'),
('Santé'),
('Éducation'),
('Factures'),
('Vêtements'),
('Épargne'),
('Divertissement'),
('Voyage'),
('Assurance'),
('Impôts'),
('Remboursements de dettes'),
('Autres');

-- Création de la table 'budgets'
CREATE TABLE IF NOT EXISTS budgets (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UtilisateurID INT NOT NULL,
    MoisAnnee DATE NOT NULL,
    BudgetMensuel DECIMAL(10, 2) NOT NULL,
    MontantAEconomiser DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(UserID)
);
