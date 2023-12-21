create database Crime_Analysis_Report_system;
use Crime_Analysis_Report_system;

CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Phone char(10) unique not null,
	Address varchar(50) unique not null,
	email varchar(50) unique not null
);

CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Phone char(10) unique not null,
	Address varchar(50) unique not null,
	email varchar(50) unique not null
);

CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(255),
    Jurisdiction VARCHAR(255),
    Phone char(10) unique not null,
	Address varchar(50) unique not null,
	email varchar(50) unique not null,
);

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(255),
    IncidentDate DATE,
    Location GEOMETRY, 
    Description TEXT,
    Status VARCHAR(50) check (status in ('Open', 'Closed', 'Under Investigation') ),
    VictimID INT,
    SuspectID INT,
	AgencyID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID),
	FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BadgeNumber INT,
    Rank VARCHAR(50),
    Phone char(10) unique not null,
	Address varchar(50) unique not null,
	email varchar(50) unique not null,
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);


CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Description TEXT,
    LocationFound VARCHAR(255),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);


CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(50) check(status in('Draft', 'Finalized')),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);