#!/usr/bin/env python3
#________________________________________________________
#______________________SYNOPSIS__________________________
#________________________________________________________

# exectution : python3 Rhapsodie2XML.py
# coding: utf-8
# auteur : Lamotte-Villiers
# date : 07/01/2019

class Word: # on définit une classe Word
    """ Classe Word : définit un mot de la langue au format CoNLL-U """
    
    def __init__(self, line):
        line = line.strip().split('\t')
        self.id, self.form = line[0], line[1]
        self.lemma, self.upos = line[2], line[3]
        self.xpos, self.feats = line[4], line[5]
        self.head, self.deprel = line[6], line[7]
        self.deps, self.misc = line[8], line[9]

def read_file(path): # on définit une fonction pour parcourir le fichier ConNLL-U
    """ Lit un fichier en entrée au format CoNLL-U """
    
    res = []
    tree = []
    with open(path, encoding='utf-8') as f:
        for line in f:
            if line.startswith('#'):
                continue
            elif line.isspace():
                res.append(tree)
                tree = []
            else:
                word = Word(line)
                if not word.id.isdigit():
                    continue
                tree.append(word)
            
    return res

# -> Lecture du fichier

import sys,os
data_in = sys.argv[1]
parsed = read_file(data_in)
data_out = open("Sequoia.xml","w",encoding="utf-8")

# -> Conversion au format XML

tree_id = 1
for tree in parsed:
    line = ""
    line += ("<arbre id=\"{}\">\n".format(tree_id))
    for word in tree:
        line += ("\t<mot pos=\"{}\">\n".format(word.upos))
        line += ("\t\t<token>{}</token>\n".format(word.form))
        line += ("\t</mot>\n")
    line += ("</arbre>\n")
    data_out.write(line)
    tree_id += 1
