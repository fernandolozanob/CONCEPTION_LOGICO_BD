create database exorev;
use exorev;


create table fournisseur
	(idfour int(5) not null,
	nomfour varchar(25),
	adrefour varchar(25),
	cpfour int(5),
	telfour int(10),
	primary key (idfour));

create table typemat
	(idtype int(5) not null,
	designtypemat varchar (35),
	primary key (idtype));

create table materiel
	(idmat int(5) not null,
	desig varchar(35),
	nbport int(2),
	idtype int(5) not null,
	idfour int(5) not null,
	primary key (idmat),
	foreign key (idtype) references typemat (idtype),
	foreign key (idfour) references fournisseur (idfour));

alter table materiel 
	add prix int(5) after idfour; 

alter table fournisseur
	add adresse_mail varchar(50) after telfour;

insert into fournisseur values
	(1,'A','2 rue 1',75001,0111223344,'champ@gmail.com'),
	(2,'B','4 rue 2',75235,0122334455,'2@gmail.com');


insert into typemat values
	(1,'ecran'),
	(2,'clavier');


insert into materiel values
	(1,'bleu',3,1,1,100),
	(2,'vert',1,2,1,200),
	(3,'rouge',2,1,2,35);

--c) Afficher le ou les matériaux les plus chers .

select idmat,max(prix) from materiel
where prix = (select max(prix) from materiel);

--d) Afficher le nombre de matériel fournis par chaque fournisseur (Nomfournisseur)

select distinct(nomfour), count(idmat) as count from fournisseur
left join materiel on fournisseur.idfour=materiel.idfour
group by nomfour;


--e) Augmenter de 5% le prix du matériel des fournisseurs parisiens

update materiel
set prix=1.05*prix
where idfour in (select idfour from fournisseur 
	where cpfour like '750%');

-- f) supprimer le ou les matériaux  qui possèdent le plus grand nombre de Nbports

delete from materiel
	where nbport=(select max(nbport) from materiel);

--g) Afficher la liste des Fournisseurs dont l’indicatif du Tél est 02.

select nomfour from fournisseur
where telfour like '02%';

--i) Afficher le ou les noms des fournisseurs qui ont vendu le plus de matériels

select nomfour , count(idmat) from fournisseur f, materiel m
where f.idfour=m.idfour
group by f.idfour
having count(idmat) >= all (select count(idmat) 
	from materiel 
	group by idfour);

--j) Afficher le couple de fournisseur qui habite la même ville

select A.nomfour, B.nomfour from fournisseur A, fournisseur B
where A.idfour != B.idfour
and A.adrefour = B.adrefour
and A.idfour > B.idfour;


/*couple animaux ne la meme année */


select a.noma, b.noma, year(a.datenaissa) from animal a, animal b
where a.numa != b.numa
and year(a.datenaissa) = year(b.datenaissa)
and a.numa > b.numa
order by ;

--couple veterinaire qui ont pratiquer les meme prix sur les consultation

select a.nomv, b.nomv, c.prixc from veterinaire a
left join consultation c on a.numv=c.numv , veterinaire b left join consultation d on b.numv=d.numv
where a.numv != b.numv
and c.prixc = d.prixc
and a.numv < b.numv;

--afficher le nom des animaux qui ont passe des consultation chez tous les veterinaire

select distinct noma, a.numa from animal a, consultation c
where a.numa = c.numa
group by a.numa 
having count(distinct numv) = (select count(numv) from veterinaire);


-- afficher nom prenom des veto qui ont realise le plus grand CA


 select nomv, prenomv, sum(prixc) from veterinaire v, consultation c
where v.numv=c.numv
group by v.numv
having sum(prixc) >= all 
(select sum(prixc) 
	from consultation 
	group by numv);

