#!/usr/bin/env python3
#________________________________________________________
#______________________SYNOPSIS__________________________
#________________________________________________________

# exectution : python3 Rhapsodie2XML.py
# coding: utf-8
# auteur : Lamotte-Villiers
# date : 07/01/2019

import os
import re


#______________________FONCTIONS__________________________
def structure(annotations):
    """Cette fonction prend en entree une liste de tuple.
    Ces tuples correspondent a la segmentation en arbre 
    syntaxique, en token, en mots, et a l'annotation en
    parties du discours. Elle renvoi un dictionnaire dont
    la structure reflete la nivelation de l'information."""
    arbre = {}
    for ligne in annotations:#On examine tous les tuples
        arbre.setdefault(int(ligne[0]), []) #On creer une entree par arbre
        #Chaque arbre est associe a la liste de mots qui le compose
        #Sachant qu'un mot est une liste de tuples (token, POS)
        if ligne[2] == 'B': #Le Word_span est un B -> frontiere de mot
            arbre[int(ligne[0])].append([(ligne[1], ligne[3])])
        elif ligne[2] == 'I': #Le Word_span est un I -> suite de mot
            arbre[int(ligne[0])][-1].append((ligne[1], ligne[3]))
    return arbre
    

def structure2xml(structure):
    """Cette fonction prend en entree la structure de donnees
    issue de la fonction structure(). Et la transforme en string
    contenant du XML."""
    texte = ''
    #La table de correspondance avec les etiquettes du sequoia
    conv = {'Adj' : 'A', 'Adv' : 'ADV',
            'CS' : 'C', 'J' : 'C',
            'Cl' : 'CL', 'Pro' : 'PRO',
            'Pre' : 'P', 'Pre+D' : 'P+D', 'Pre+Qu' : 'P+PRO'}
    for arbre in sorted(structure.keys()):#Pour chaque arbre/cle
        #On ouvre une balise arbre (numerotee)
        texte += '    <arbre id="'+str(arbre)+'">\n'
        for mot in structure[arbre]:#Pour chaque mot dans cet arbre
            #On ouvre une balise mot, et on en note la POS
            try: #Celle du sequoia quand c'est possible
                texte += '        <mot pos="'+conv[mot[0][1]]+'">\n'
            except: #L'originelle sinon
                texte += '        <mot pos="'+mot[0][1]+'">\n'
            for token in mot:#Pour chaque token dans le mot
                if token[0].isspace():#Si ce n'est pas un espace
                    continue
                elif token[0] == '-' or token[0] == "'":
                    continue
                else:
                    t = token[0].replace('&', '&amp;')
                    t = t.replace('>', '&gt;')
                    t = t.replace('<', '&lt;')
                    texte += '            <token>'+t+'</token>\n'
            texte += '        </mot>\n'
        texte += '    </arbre>\n'
    return texte


#______________________MAIN__________________________

#La RegEx qui modelise une ligne du fichier
ligneRG = re.compile("[^\t]*\t([^\t]*)\t[^\t]*\t([^\t]*)\t[^\t]*\t([^\t]*)\t[^\t]*\t[^\t]*\t([^\t]*)\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*\t[^\t]*")


with open('../xml/Rhapsodie.xml', 'w', encoding='UTF-8') as sortie:
    sortie.write('<?xml version="1.0"?>\n')
    sortie.write('<!DOCTYPE note SYSTEM "../grammaire/Corpus.dtd">\n')
    sortie.write('<root>\n') # On creer la racine du fichier XML
    # Pour tous les fichiers du Corpus Rhapsodie
    for dossier, sous_dossiers, fichiers in os.walk('../data/Rhapsodie'):
        for fichier in fichiers:
            if fichier.endswith('.tabular'):# si on a affaire a un fichiers tabulaire
                with open(os.path.join(dossier, fichier), 'r', encoding='UTF-8') as file:#On l'ouvre
                    texte = file.read()#On le lit
                    #Dans le texte on recupere les colonnes qui nous interesse
                    listLignes = ligneRG.findall(texte)
                    #On retire les lignes qui ne nous interessent pas
                    annotations = [i for i in listLignes if i != ('', ' ', '', '') and i != ('', '', '', '') and i != ('Tree_ID', 'Token', 'Word_span', 'POS')]
                    #On hierarchise les annotations
                    root = structure(annotations)
                    xml = structure2xml(root)
                #Pour chaque fichier on ecrit le XML produit a partir du tabulaire
                sortie.write(xml)
    #Enfin on ferme la balise racine
    sortie.write('</root>') 
