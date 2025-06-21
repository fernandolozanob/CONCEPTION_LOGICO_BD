select p.nump,nomp,prenomp,count(numa)
from proprietaire p,animal a
where a.nump=p.nump
group by p.nump
having count(numa) > 3;

afficher le nombre de consultation pratiquer par chaque vétérinaire
select count(c.numv), nomv, prenomv from consultation c
inner join veterinaire v on c.numv=v.numv
group by c.numv;

Afficher le nombre d'animaux' de chaque race:

select nomr, count(a.numa) from race R
left join animal a on  R.numR group by a.NumR;

afficher les véterinaires qui ont réalisé des consultation;
select distinct nomv, prenomv from veterinaire v inner join consultation c on v.numv=c.numv where prixc >(select avg(prixc) from consultation);
 afficher la liste des animaux dont la liste est composé de 2 mots
 select *from Animal Where NomA like "% %";
 afficher l'initial' du nom et du prenom en 1 seul tableau
 Select concat(left(NomV,1), left (PrenomV,1)) AS initial from Veterinaire;
 Afficher la liste des animaux qui contienne 2 fois la lettre a 
 Select Nom1 from animal where NomA like '%a%a%';