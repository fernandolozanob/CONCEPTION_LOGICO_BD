create table Animal2 as select * Animal where datenaissa is null or tatouage is null;
	show tables;
	describe Animal2;
	select * from Animal2;


	create table histoconsultation as select * from consultation where 2=0 ;


		create table proprietaire2 as select nump, nomp,telp from proprietaire where nomp not like 'R%';
			show tables;
			describe tables;
			select * from proprietaire2;


create table veterinaire2 as select numv, nomv, count(numc) from veterinaire inner join consultation;



create table veterinaire3 as select numv, prenomv, 9999 as nbconsultation, curdate() as dateemb,'______' as grade 
	from veterinaire 
	where 2=0;



update Animal set datenaissa= curdate() where datenaissa is null; 

update consultation 
set prixc=(select prixm from medicament where numm=4)
where numc=5;




update medicament
set prixm=0.95*prixm
where numm in (select numm from prescrire 
where numc in (select numc from consultation
where numa in (select numa from Animal
where nump in (select nump from proprietaire
where nump like 'f%'))));




delete from medicament
where numm in (select numm from prescrire 
where numc in (select numc from consultation
where numa in (select numa from Animal
where numr = (select numr from race
where nomr like 'saluki'))));



update pilote 
set salaire=salaire*0.92,comm=1000
where adresse='paris' or 'lyon' ;




alter table veterinaire
add nbconsultation int default 0;
update veterinaire
	set nbconsultation=(select count(*)from consultation where numv=2)where numv=2;


	update consultation
		set prixc=0.95*prixc
		where numv = (select numv from veterinaire where nomv like 'Carre' and prenomv like 'Violette');


/*sur tout les soins */

		update soin 
			set tarifs= 0.95*tarifs
			where nums in (select nums from pratiquer 
				where numc in (select numc from consultation
					where numv = (select numv from veterinaire
						where nomv like 'Carre' and prenomv like 'Violette')));




			update medicament 
				set prixm=