drop database if exists 'gestion';
create database gestion;
use gestion;


create table Categorie(
			Code_cat varchar(5) not null,
			primary key (Code_cat),
			Nom_cat varchar(20),
			Taux_r float)engine=InnoDB;			

create table Representants(
			Num_rep varchar(3) not null,
			primary key (Num_rep),
			Nom_rep varchar(20),
			Prenom_rep varchar(10),
			Date_embauche date,
			Date_dep date) engine=InnoDB;
			
create table Clients(
			Num_Client integer not null,
			primary key (Num_Client),
			Nom_mag varchar(20),
			Adresse varchar(30),
			Ville varchar(30),
			Cp int,
			Telephone varchar (12),
			Code_cat varchar(5) not null,
			foreign key (Code_cat) references Categorie (Code_cat)) engine=InnoDB;
			
create table Factures(
			Num_Factures integer not null,
			primary key (Num_Factures),
			Date_factures date,
			Num_Client integer not null,
			Payee varchar(10),
			Num_rep varchar(3) not null,
			Montant_HS decimal(10,2),
			foreign key (Num_Client) references Clients(Num_Client),
			foreign key (Num_rep) references Representants(Num_rep)
			on delete cascade)engine=InnoDB;
				
			
insert into Categorie values('BOU','Boulangerie',5.50);
insert into Categorie values('EPI','Epicerie',0.0);
insert into Categorie values('HYP','Hypermarche',12.50);
insert into Categorie values('PAT','Patisserie',7.00);		
insert into Categorie values('SUP','Supermarche',10.00);								
										
insert into Representants values('R1','SIGUENOU','Jean','1999/10/15',null);
insert into Representants values('R2','LANTEGI','Françoise','15/10/1999',null);
insert into Representants values('R3','CHEZSAN','Jacques','01/01/2000',null);
insert into Representants values('R4','NORK','Genevieve','01/03/2001','2001/03/31');
insert into Representants values('R5','LAUMEVI','Arlette','01/05/20001',null);							
								
																
insert into Clients values(1,'Anis et Miel','7 Chemin de cassis','Marseille',13010,'91-4513-12','BOU');						
insert into Clients values(2,'Auchan','Zone industrielle','Aubagne',13400,'91-26-45-23','HYP');
insert into Clients values(3,'Casino','La Valentine','Marseille',13011,'91-85-54-42','HYP');
insert into Clients values(4,'Lecler','Plan de campagne','Marseille',13601,'91-25-54-47','HYP');
insert into Clients values(5,'Intermarche','30 rue pipe','Mallemort',13456,'42-45-48-87','SUP');
insert into Clients values(6,'Casino','Boulevard Paul Claudel','Marseille',13010,'91-45-23-87','SUP');
insert into Clients values(7,'Moulins de provence','74 Boulevard Remi Rolland','Marseille',13010,'97-45-52-23','BOU');
insert into Clients values(8,'Moulins de provence','45 Avenue Marcel Pagnol','Aubagne',13400,'91-25-48-78','PAT');						
insert into Clients values(9,'Aux delices de Provence','3 rue Fontange','Marseille',13006,'91-18-21-12','EPI');

Insert into Factures values(1,'2001/01/04',1,'Oui','R3',250.56);
Insert into Factures values(2,'04/01/2000',2,'Oui','R2',358.40);
Insert into Factures values(3,'10/01/2001',2,'Oui','R2',400.00);
Insert into Factures values(4,'19/01/1999',4,'Non','R1',354.14);
Insert into Factures values(5,'11/01/2002',3,'Oui','R1',238.41);
Insert into Factures values(6,'24/01/2004',3,'Non','R1',120.00);
Insert into Factures values(7,'25/01/2005',7,'Oui','R4',178.45);
Insert into Factures values(8,'21/01/2006',5,'Non','R4',238.54);	
Insert into Factures values(9,'2001/01/26',4,'Non','R1',127.17);
Insert into Factures values(10,'21/02/1992',4,'Oui','R2',540.45);
Insert into Factures values(11,'22/02/2005',2,'Oui','R2',475.18);
Insert into Factures values(12,'20/02/2007',3,'Oui','R1',238.41);
Insert into Factures values(13,'21/02/2009',1,'Oui','R3',225.47);
Insert into Factures values(14,'22/02/2009',6,'Non','R4',110.00);
Insert into Factures values(15,'24/02/2009',7,'Oui','R5',335.44);
Insert into Factures values(16,'21/02/2010',8,'Non','R5',445.11);
Insert into Factures values(17,'29/02/2004',9,'Non','R5',85.18);
Insert into Factures values(18,'28/02/2004',4,'Non','R1',235.00);