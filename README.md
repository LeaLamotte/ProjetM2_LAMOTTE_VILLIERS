# Projet_XML
  
  
  Ce repertoire contient notre projet pour le cours de XML de notre premier semestre de M2 Ingéniérie Multilingue.
  
  Détail des dossiers :
  
 ### data
 --- contient les données telles que nous les avons récupérées, triées par corpus (format coNLL-U pour le corpus écrit Sequoia, tabular pour le corpus oral Rhapsodie)
 
 ### xml
 --- contient les données au format xml, après conversion des corpus bruts et nettoyage
 
 ### transformation
 --- contient les fichiers "explication.xml" et "tableau.xml" avant la transformation xslt ainsi que le fichier de tranformation xsl
 
 ### grammaire
 --- contient les grammaires des données xml aux formats DTD et RelaxNG
 --- ainsi qu'une capture d'écran témoignant des résultats aux tests de validité
 
 ### script
 --- contient les scripts python ayant servi à la transformation des données brutes (corpus) en données xml structurées
 --- un fichier requirements (vide car nous n'avons utilisé que les modules inclus dans python 3.6)
 
 ### web
 ------ **html**
 ------ contient les pages web (html) "explication.html" et "tableau"
 ------ **css**
 ------ contient les feuilles de style css utilisées pour l'affichage des pages html
 ------ **js**
 ------ contient les programmes javascript utilisés pour l'affichage des pages html
  
  
Sources du corpus :
Notre corpus est constitué des tree-banks **Deep-Sequoia** (disponibles via https://deep-sequoia.inria.fr/)
et **Rhapsodie** (disponibles via https://www.projet-rhapsodie.fr/static/).  
Ces deux corpus sont également disponibles sur http://universaldependencies.org sous les noms **French-Sequoia** et **Spoken French**.
