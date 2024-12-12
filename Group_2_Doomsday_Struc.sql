-- Group 2
-- Adam Hanson, Alexis Brewers, Colton Bondhus, Ismail Abdullahi, Lily Rossman

USE [master]
GO
CREATE DATABASE [Doomsday]
GO
USE [Doomsday]
GO

-- Location Type AH

CREATE TABLE LocationType(
    locationTypeKey VARCHAR(8) PRIMARY KEY NOT NULL,
    locationTypeName VARCHAR(50) UNIQUE NOT NULL
);

-- Locations AH

CREATE TABLE Locations(
    locationKey VARCHAR(8) PRIMARY KEY NOT NULL,
    locationName VARCHAR(50) UNIQUE NOT NULL,
    locationTypeKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES LocationType(locationTypeKey),
    locationLatitude DECIMAL(9,6) NOT NULL,
    locationLongitude DECIMAL(9,6) NOT NULL,
    locationDescrption VARCHAR(500) NULL,
    locationSafe BIT NOT NULL DEFAULT 0,
    locationUpdated DATETIME DEFAULT GETDATE()
);

-- Water CB 

CREATE TABLE Water(
    waterKey VARCHAR(8) PRIMARY KEY NOT NULL,
    waterName VARCHAR(50) NOT NULL,
    waterSafetyRating TINYINT NULL CHECK(waterSafetyRating BETWEEN 1 AND 10),
    waterAbundanceRating TINYINT NULL CHECK(waterAbundanceRating BETWEEN 1 AND 10),
    locationKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Locations(locationKey)
);

-- Factions IA

CREATE TABLE Factions(
    factionKey VARCHAR(8) PRIMARY KEY NOT NULL,
    factionName VARCHAR(75) UNIQUE NOT NULL,
    factionStr TINYINT NULL CHECK(factionStr BETWEEN 1 AND 10),
    locationKey VARCHAR(8) NULL FOREIGN KEY REFERENCES Locations(locationKey)
);

-- Alliances IA

CREATE TABLE Alliances(
    factionKeyA VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Factions(factionKey),
    factionKeyB VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Factions(factionKey),
    relationship VARCHAR(20) NOT NULL,

	CHECK(factionKeyB != factionKeyA)
);

-- Power Type IA

CREATE TABLE PowerType(
    powerTypeKey VARCHAR(8) PRIMARY KEY NOT NULL,
    powerTypeName VARCHAR(20) UNIQUE NOT NULL
);

-- Power IA

CREATE TABLE Power(
    powerKey VARCHAR(8) PRIMARY KEY NOT NULL,
    powerTypeKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES PowerType(powerTypeKey),
    locationKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Locations(locationKey),
    powerStatus VARCHAR(20) NOT NULL CHECK(powerStatus = 'Operational' OR 
                                           powerStatus = 'Needs Repair' OR 
                                           powerStatus = 'Inactive' OR 
                                           powerStatus = 'Unknown'),
    powerLastMaintenance DATETIME NULL
);

-- Lodging CB

CREATE TABLE Lodging(
    lodgingKey VARCHAR(8) PRIMARY KEY NOT NULL,
    lodgingName VARCHAR(50) NOT NULL,
    locationKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Locations(locationKey),
    lodgingComfortRating TINYINT NULL CHECK(lodgingComfortRating BETWEEN 1 AND 10)
);

-- Virus CB 

CREATE TABLE Virus(
    virusKey VARCHAR(8) PRIMARY KEY NOT NULL,
    virusName VARCHAR(50) UNIQUE NOT NULL,
    virusEffect VARCHAR(100) NULL,
    virusSource VARCHAR(50) NULL,
    virusDangerRating TINYINT NULL CHECK(virusDangerRating BETWEEN 1 AND 10)
);

-- Virus Transmission CB

CREATE TABLE VirusTransmission(
    transmissionMethodKey VARCHAR(8) PRIMARY KEY NOT NULL,
    transmissionMethod VARCHAR(100) UNIQUE NOT NULL
);

-- Virus Transmission Details CB

CREATE TABLE VirusTransmissionDetails(
    virusKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Virus(virusKey),
    transmissionMethodKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES VirusTransmission(transmissionMethodKey)
);

-- Role Types AH

CREATE TABLE RoleTypes(
    roleTypeKey VARCHAR(8) PRIMARY KEY NOT NULL,
    roleTypeName VARCHAR(20) UNIQUE NOT NULL
);

-- Work Roles AH

CREATE TABLE WorkRoles(
    roleKey VARCHAR(8) PRIMARY KEY NOT NULL,
    roleTypeKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES RoleTypes(roleTypeKey),
    roleName VARCHAR(50) NOT NULL,
    roleDescription VARCHAR(500) NULL
);

-- People LR

CREATE TABLE People(
    personKey VARCHAR(8) PRIMARY KEY NOT NULL,
    personFirstName VARCHAR(50) NOT NULL,
    personLastName VARCHAR(50) NULL,
    personAge INT NULL CHECK (personAge>=0),
    factionKey VARCHAR(8) NULL FOREIGN KEY REFERENCES Factions(factionKey),
    roleKey VARCHAR(8) NULL FOREIGN KEY REFERENCES WorkRoles(roleKey)
);

-- Zombies LR

CREATE TABLE Zombies(
    zomKey VARCHAR(8) PRIMARY KEY NOT NULL,
    zomFirstName VARCHAR(50) NOT NULL,
    zomLastName VARCHAR(50) NULL,
    zomAge INT NULL CHECK (zomAge>=0),
    factionKey VARCHAR(8) NULL FOREIGN KEY REFERENCES Factions(factionKey),
    virusKey VARCHAR(8) NULL FOREIGN KEY REFERENCES Virus(virusKey)
);

-- Plants AB

CREATE TABLE Plants(
    plantKey VARCHAR(8) PRIMARY KEY NOT NULL,
    plantName VARCHAR(20) UNIQUE NOT NULL,
    plantWaterFequency INT NOT NULL DEFAULT 1,
    plantInfo TEXT NULL
);

-- Greenhouse AB

CREATE TABLE Greenhouse(
    spotKey VARCHAR(8) PRIMARY KEY NOT NULL,
    factionKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Factions(factionKey),
    plantKey VARCHAR(8) NULL FOREIGN KEY REFERENCES Plants(plantKey),
    lastWatered DATETIME NULL,
    spotDetails TEXT NULL
);

-- Item Type LR

CREATE TABLE ItemType(
    typeKey VARCHAR(8) PRIMARY KEY NOT NULL,
    typeName VARCHAR(20) NOT NULL UNIQUE
);

-- Items LR

CREATE TABLE Items(
    itemKey VARCHAR(8) PRIMARY KEY NOT NULL,
    typeKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES ItemType(typeKey),
    itemName VARCHAR(20) UNIQUE NOT NULL,
    itemInfo TEXT NULL
);

-- Inventory LR

CREATE TABLE Inventory(
    factionKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Factions(factionKey),
    itemKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Items(itemKey),
    inventoryQty INT NOT NULL DEFAULT 0,

    CHECK (inventoryQty>=0)
);

-- Ammo AB

CREATE TABLE Ammo(
    ammoKey VARCHAR(8) PRIMARY KEY NOT NULL,
    ammoName VARCHAR(20) UNIQUE NOT NULL
);

-- Weapon Ammo AB

CREATE TABLE WeaponAmmo(
    itemKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Items(itemKey),
    ammoKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Ammo(ammoKey)
);

-- Currency AH

CREATE TABLE Currency(
    itemKey VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Items(itemKey),
    value INT NOT NULL DEFAULT 1 CHECK(value>=1)
);