CREATE DATABASE VirtualArtGallery;
USE VirtualArtGallery;

CREATE TABLE Artist(
ArtistID int primary key,
Name varchar(50) not null,
Biography text,
BirthDate date,
Nationality varchar(50),
Website varchar(255) not null,
Phone char(10) unique not null,
Address varchar(50) unique not null,
email varchar(50) unique not null
);

CREATE TABLE Artwork(
ArtworkId int primary key,
Title varchar(50) not null,
Description text,
CreationDate date,
Medium varchar(255),
ImageURL varchar(255),
ArtistID int foreign key(ArtistID) references Artist(ArtistID) on delete cascade
);


CREATE TABLE Users(
UserID int primary key,
Username varchar(50),
password varchar(50) not null,
email varchar(50) not null,
firstname varchar(50) not null,
lastname varchar(50) not null,
dob date not null,
profile_picture bit
);

CREATE TABLE Gallery(
GalleryID int primary key,
name varchar(50) not null,
description varchar(50),
location varchar(50),
curator int foreign key(curator) references Artist(ArtistID) on delete cascade,
openinghours int not null
);

CREATE TABLE UserFavoriteArtwork(
UserID int foreign key(UserID) references Users(UserID),
ArtworkId int foreign key(ArtworkId) references Artwork(ArtworkId),
primary key(UserID,ArtworkId)
);

create table artwork_gallery(
GalleryID int foreign key(GalleryID) references Gallery(GalleryID),
ArtworkId int foreign key(ArtworkId) references Artwork(ArtworkId),
primary key(GalleryID,ArtworkId)
);

