/*Afficher le nom de l'avion qui a réaliser le plus grand nombre de vols*/
CREATE VIEW Avion_max
AS SELECT Av.Nom_Av, COUNT(Af.NoVol) as Nombre_Affectations
FROM Avion Av LEFT JOIN Affectation Af ON
Av.NUAVION=Af.NoAvion
GROUP BY Av.NUAVION
HAVING Nombre_Affectations>=all(SELECT COUNT(NoVol) FROM Affectation GROUP BY NoAvion);

/*Afficher tout les information essentiel sur la base veto*/
CREATE VIEW Info
AS SELECT Pr.NumP, Pr.NomP, Pr.PrenomP, An.NomA, Ra.NomR, Co.DateC, Co.PrixC, Ve.NomV, Ve.PrenomV
FROM proprietaire Pr, animal An, race Ra, consultation Co, veterinaire Ve
WHERE An.NumP=Pr.NumP AND An.NumR=Ra.NumR AND An.NumA=Co.NumA AND Co.NumV=Ve.NumV;

/*OU*/
CREATE VIEW Info
AS SELECT Pr.NumP, Pr.NomP, Pr.PrenomP, An.NomA, Ra.NomR, Co.DateC, Co.PrixC, Ve.NomV, Ve.PrenomV
FROM proprietaire Pr
INNER JOIN animal An ON An.NumP=Pr.NumP
INNER JOIN race Ra ON An.NumR=Ra.NumR
INNER JOIN consultation Co ON An.NumA=Co.NumA
INNER JOIN veterinaire Ve ON Co.NumV=Ve.NumV;

/*Crée une vue qui permet d'afficher le nom des animaux qui on passer des consultation chez
tout les veto*/

CREATE VIEW An_Co_Tt_Veto
AS SELECT An.NomA, COUNT(DISTINCT(Co.NumV))
FROM animal An LEFT JOIN consultation Co 
ON An.NumA=Co.NumA
GROUP BY Co.NumA
HAVING COUNT(DISTINCT(Co.NumV))=(SELECT COUNT(NumV) FROM veterinaire);

/*Crée une vue qui affiche sur le meme tableau les couple d'animaux qui on le meme mois et
la meme année de naissance*/

CREATE VIEW DATENAISSA
AS SELECT e1.NomA, e2.NomA
FROM animal e1, animal e2
WHERE MONTH(e1.DATENAISSA)=MONTH(e2.DATENAISSA) AND YEAR(e1.DATENAISSA)=YEAR(e2.DATENAISSA) 
AND e1.NumA!=e2.NumA AND e1.NumA>e2.NumA;

/*Crée une vue qui permet d'afficher le nom de l'annimal suivit de la liste de médicament*/

