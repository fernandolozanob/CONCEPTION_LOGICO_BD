create database school;
Use school;
CREATE TABLE batiment
(
    idb int(5) not null,
    Nombre int (3),
    Datec  date,
    primary Key (idb)
);
CREATE TABLE Salles
(
    ids int(5) not null ,
    idb int(5) not null,
    capacité int(5),
    superficie float(4,2),
    primary key (idb,ids)
);
CREATE TABLE ordinateur
(
    ido int(5) not null ,
    Nomo varchar(35),
    capacité int(3),
    capacité_dis int(11),
    idb int(5) not null,
    ids int(5) not null,  
    primary key (ido),
    foreign key(idb,ids) references salles(idb,ids)
);