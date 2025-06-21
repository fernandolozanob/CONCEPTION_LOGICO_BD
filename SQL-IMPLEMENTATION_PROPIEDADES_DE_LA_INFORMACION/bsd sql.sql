create table personne (
idp int(3) not null auto_increment,
nomp varchar(50),
prenomp varchar(50),
adresse varchar(50),
cp char(5),
telephone char(10),
fonction varchar(50),
primary key (idp)
);
create table client(
idpcl int(3) not null,
datead date,
finval date,
nomp varchar(50),
prenomp varchar(50),
adresse varchar(50),
cp char(5),
telephone char(10),
primary key (idpcl),
foreign key (idpcl) references personne(idp)
);
create table discipline(
iddis int(3) not null,
libelle varchar(50),
primary key(iddis)
);
create table salle(
idsalle int(3) not null,
primary key(idsalle)
);
create table rdv(
idpco int(3) not null,
idpcl int(3) not null,
ids int(3) not null,
datedebut datetime, 
datefin datetime,
duree time, 
etat boolean,
primary key (idpco, idpcl, ids, datedebut),
foreign key (idpco) references coach(idpco),
foreign key (idpcl) references client(idpcl),
foreign key (ids) references salle(idsalle)
);
create table coach (
idpco int not null,
iddis int(3),
nomp varchar(50),
prenomp varchar(50),
adresse varchar(50),
cp char(5),
telephone char(10),
fonction varchar(50),
primary key (idpco),
foreign key (iddis) references discipline(iddis),
foreign key (idpco) references personne(idp)
);

create table administrateur(
ida int(3) not null,
nomp varchar(50),
prenomp varchar(50),
adresse varchar(50),
cp char(5),
telephone char(10),
primary key (ida),
foreign key (ida) references personne(idp)
);
create table gestionnaire(
idg int(3) not null,
nomp varchar(50),
prenomp varchar(50),
adresse varchar(50),
cp char(5),
telephone char(10),
primary key (idg),
foreign key (idg) references personne(idp)
);
create table abonnement(
idabo int(3) not null,
idpcl int(3) not null,
libabo varchar(50),
datedebut date,
datefin date,
etatabo boolean,
primary key(idabo),
foreign key (idpcl) references client(idpcl)
);
create table facture(
idfact int(3) not null,
idabo int (3) not null, 
idg int (3) not null,
datefacture date,
primary key (idfact),
foreign key (idg) references gestionnaire(idg),
foreign key (idabo) references abonnement(idabo)
);
