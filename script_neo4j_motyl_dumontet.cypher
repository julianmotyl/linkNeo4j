// MOTYL Julian - DUMONTET Etienne - FISA DE 1

// Insertion de six utilisateurs

CREATE (u1:user  {
					firstname: "Etienne", 
					lastname: "Dumontet", 
					age: 20,
					description: "Etudiant à Télécom Saint-Etienne",
					competences: ["C#", "PowerShell", "Azure"]
				})


CREATE (u2:user  {
					firstname: "Julian", 
					lastname: "Motyl", 
					age: 21,
					description: "Etudiant à Télécom Saint-Etienne",
					competences: ["MongoDB", "Linux", "SQL", "Java"]
				})

CREATE (u3:user  {
					firstname: "Mathias", 
					lastname: "Ruelle", 
					age: 20,
					description: "Etudiant à Télécom Saint-Etienne",
					competences: ["C#", "Neo4j", "Azure"]
				})

CREATE (u4:user {
					firstname: "Pierre-Alexandre",
					lastname: "Flèche",
					age: 35,
					description: "Chef de projet mobilité",
					competences: ["C#", "SharePoint", "Gestion de projet"]
				})
				
CREATE (u5:user {
					firstname: "Adrian",
					lastname: "May",
					age: 20,
					description: "Etudiant à télécom Saint-Etienne, alternant chez Groupe Casino",
					competences: ["SQL", "JavaScript", "Html"]
				})
				
CREATE (u6:user {
					firstname: "Philippe",
					lastname: "Le Calvé",
					age: 54,
					description: "Directeur général France chez Sword Group",
					competences: ["Business Management", "Business Strategy", "Enterprise Content Management"]
				})
				
// Insertion de deux entreprises

CREATE (c1:company{
					name: "Sword Group",
					activity: "ESN",
					description: "Société internationale de conseils, de software et de services, nous assistons les leaders mondiaux dans leur programme de transformation digitale.",
					size: 2000
				})

CREATE (c2:company{
					name: "Sopra Steria",
					activity: "ESN",
					description: "Sopra Steria est un leader européen de la transformation digitale qui propose l'un des portefeuilles d'offres les plus complets du marché.",
					size: 42000
				})

CREATE (c3:company{
					name: "Groupe Casino",
					activity: "Grande Distribution",
					description: "Acteur historique de la distribution en France depuis 1898, le groupe Casino est aussi l’un des leaders mondiaux du commerce alimentaire.",
					size: 220000
				})
				
// Insertion des relations utilisateur/entreprise

MATCH (u:user {lastname: "Motyl"})
MATCH (c:company {name: "Sopra Steria"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/09/2018",
							to: "31/08/2021",
							role: "Alternant"
						}]->(c)
						
MATCH (u:user {lastname: "Dumontet"})
MATCH (c:company {name: "Sword Group"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/09/2018",
							to: "31/08/2021",
							role: "Alternant"
						}]->(c)
						
MATCH (u:user {lastname: "Ruelle"})
MATCH (c:company {name: "Sword Group"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/09/2018",
							to: "31/08/2021",
							role: "Alternant"
						}]->(c)
						
MATCH (u:user {lastname: "May"})
MATCH (c:company {name: "Groupe Casino"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/09/2018",
							to: "31/08/2021",
							role: "Alternant"
						}]->(c)
						
MATCH (u:user {lastname: "Flèche"})
MATCH (c:company {name: "Sword Group"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/01/2007",
							to: "Undefined",
							role: "Chef de projet"
						}]->(c)
						
MATCH (u:user {lastname: "Le Calvé"})
MATCH (c:company {name: "Sword Group"})
CREATE (u)-[w:WORKS_FOR {
							from: "01/01/2005",
							to: "Undefined",
							role: "Directeur Général France"
						}]->(c)

// Insertion des relations utilisateur/utilisateur : relations

MATCH (u1:user {lastname: "Ruelle"})
MATCH (u2:user {lastname: "Dumontet"})
MATCH (u3:user {lastname: "Motyl"})
MATCH (u4:user {lastname: "May"})
MATCH (u5:user {lastname: "Flèche"})
MATCH (u6:user {lastname: "Le Calvé"})

CREATE (u1)-[w1:KNOWS]->(u2)
CREATE (u2)-[w2:KNOWS]->(u1)

CREATE (u1)-[w3:KNOWS]->(u3)
CREATE (u3)-[w4:KNOWS]->(u1)

CREATE (u4)-[w5:KNOWS]->(u1)
CREATE (u1)-[w6:KNOWS]->(u4)

CREATE (u5)-[w7:KNOWS]->(u1)
CREATE (u1)-[w8:KNOWS]->(u5)

CREATE (u2)-[w9:KNOWS]->(u3)
CREATE (u3)-[w10:KNOWS]->(u2)

CREATE (u2)-[w11:KNOWS]->(u4)
CREATE (u4)-[w12:KNOWS]->(u2)

CREATE (u2)-[w13:KNOWS]->(u5)
CREATE (u5)-[w14:KNOWS]->(u2)

CREATE (u3)-[w15:KNOWS]->(u4)
CREATE (u4)-[w16:KNOWS]->(u3)

CREATE (u5)-[w17:KNOWS]->(u6)
CREATE (u6)-[w18:KNOWS]->(u5)

// Insertion des relations utilisateur/utilisateur : travail

CREATE (u1)-[ww1: WORKS_WITH {effective: "yes"}]->(u2)
CREATE (u2)-[ww2: WORKS_WITH {effective: "yes"}]->(u1)

CREATE (u1)-[ww3: WORKS_WITH {effective: "yes"}]->(u5)
CREATE (u5)-[ww4: WORKS_WITH {effective: "yes"}]->(u1)

CREATE (u1)-[ww5: WORKS_WITH {effective: "yes"}]->(u6)
CREATE (u6)-[ww6: WORKS_WITH {effective: "yes"}]->(u1)

CREATE (u5)-[ww7: WORKS_WITH {effective: "yes"}]->(u2)
CREATE (u2)-[ww8: WORKS_WITH {effective: "yes"}]->(u5)

CREATE (u6)-[ww9: WORKS_WITH {effective: "yes"}]->(u2)
CREATE (u2)-[ww10: WORKS_WITH {effective: "yes"}]->(u6)

CREATE (u5)-[ww11: WORKS_WITH {effective: "yes"}]->(u6)
CREATE (u6)-[ww12: WORKS_WITH {effective: "yes"}]->(u5)

// Requete : recherche par nom

MATCH (u:user {lastname: "Motyl"})
return u;

MATCH (u:user)
WHERE u.firstname = "Etienne" OR u.firstname = "Julian"
return u.firstname, u.lastname, u.age, u.description, u.competences;

MATCH (c:company {name: "Groupe Casino"})
return c;

// Requete : suggestion de relations qui travaillent ensemble mais ne se connaissent pas

MATCH (u:user {firstname: "Philippe"})-[w:WORKS_WITH {effective: "yes"}]->(v:user)
WHERE NOT (u)-[:KNOWS]->(v)
return v;

// Requete : suggestion de personnes connues par les connaissances

MATCH (u:user {firstname: "Pierre-Alexandre"})-[k:KNOWS]->(v:user)
MATCH (v)-[k2:KNOWS]->(w:user)
WHERE NOT ((w)-[:KNOWS]->(u)) AND NOT (w.firstname = u.firstname)
return w;

// Requete : recherche par competences

MATCH (u:user)
WHERE ANY(item IN u.competences WHERE item = "C#")
return u.firstname, u.lastname, u.age, u.description, u.competences;