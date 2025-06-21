create database cc;
use cc;

create table client
(numcl int not null,
nomcl varchar (20),
primary key (numcl)) engine=innoDB;

create table commande(
refcom char(10) not null,
datecom date,
numcl int not null,
primary key(refcom),
foreign key (numcl) references client (numcl)
on delete cascade
on update cascade) engine=innoDB;

create table comptec(
numc int not null,
montantc decimal(10,2),
numcl int not null,
primary key (numc),
foreign key (numcl) references client (numcl)
on delete no action
on update no action) engine=innoDB;

create table produit(
refp int not null,
designation varchar(30),
prixu decimal(10,2)
primary key (refp)) engine=innoDB;

create table lignecom (
refp int not null,
refcom char(10) not null,
quantite int,
primary key (refp, refcom),
foreign key (refp) references produit(refp) on delete cascade,
foreign key (refcom) references commande(refcom)
on delete cascade on update cascade) engine=innoDB;


insert into client values (1,'Sony'),(2,'Dell'),(3,'HP'),(4,'IBM');

insert into commande values ('SS1',curdate(),1),('SS2',curdate(),1),('DD1',curdate(),2),('DD2',curdate(),2);

insert into comptec values (3,1000.00,4),(4,20000.00,3);



select noma, nomr from animal, race 
where animal.numr= race.numr;

select noma, nomr from animal inner join race on animal.numr=race.numr;



select noma, nomr, nomp, prenomp from animal, race, proprietaire
where proprietaire.nump=animal.nump and animal.numr=race.numr;


select nomp, prenomp, noma, nomr from proprietaire inner join animal on proprietaire.nump=animal.nump inner join race on animal.numr=race.numr;

select nomr, count(noma) 
from animal, race
where  animal.numr=race.numr
group by race.numr;

select nomr, count(numa)
from race
left join animal on race.numr=animal.numr
group by race.numr;


select noma, count(numc)
from animal 
left join consultation on animal.numa=consultation.numa
group by animal.numa;


select nomv, prenomv, count(numc), sum(prixc),year(datec)
from veterinaire 
left join consultation on veterinaire.numv=consultation.numv
group by veterinaire.numv, year(datec)
order by 5 asc;


select distinct(nomm), count(animal.numa)
from medicament 
left join prescrire on medicament.numm=prescrire.numm
left join consultation on prescrire.numc=consultation.numc
left join animal on consultation.numa= animal.numa
left join race on animal.numr= race.numr
group by medicament.numm;


select nomp, prenomp, max(prixm)
from proprietaire
left join animal on proprietaire.nump=animal.nump
left join consultation on animal.numa=consultation.numa
left join prescrire on consultation.numc=prescrire.numc
left join medicament on prescrire.numm=medicament.numm
group by nump;	


Update emp
set sal = sal*1.2 where emp.nd=(select nd from dept where nd=20) ;


Update emp
set comm = 200 where job like 'salesman' and emp.nd=(select nd from dept where ville='Chicago') ;