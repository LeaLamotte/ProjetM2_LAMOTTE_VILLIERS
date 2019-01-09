let $nom:=count(//mot[@pos="N"])
let $adj:=count(//mot[@pos="A"])
let $adv:=count(//mot[@pos="ADV"])
let $conj:=count(//mot[@pos="C"])
let $cl:=count(//mot[@pos="CL"])
let $det:=count(//mot[@pos="D"])
let $int:=count(//mot[@pos="I"])
let $prep:=count(//mot[@pos="P"])
let $contr1:=count(//mot[@pos="P+D"])
let $contr2:=count(//mot[@pos="P+PRO"])
let $pro:=count(//mot[@pos="PRO"])
let $vb:=count(//mot[@pos="V"])
let $aut:=count(//mot[@pos="X"]) + count(//mot[@pos="Qu"]) + count(//mot[@pos="PONCT"]) + count(//mot[@pos="PREF"]) + count(//mot[@pos="ET"])


let $Rnom:=count(collection('xml/Rhapsodie.xml')//mot[@pos="N"])
let $Radj:=count(collection('xml/Rhapsodie.xml')//mot[@pos="A"])
let $Radv:=count(collection('xml/Rhapsodie.xml')//mot[@pos="ADV"])
let $Rconj:=count(collection('xml/Rhapsodie.xml')//mot[@pos="C"])
let $Rcl:=count(collection('xml/Rhapsodie.xml')//mot[@pos="CL"])
let $Rdet:=count(collection('xml/Rhapsodie.xml')//mot[@pos="D"])
let $Rint:=count(collection('xml/Rhapsodie.xml')//mot[@pos="I"])
let $Rprep:=count(collection('xml/Rhapsodie.xml')//mot[@pos="P"])
let $Rcontr1:=count(collection('xml/Rhapsodie.xml')//mot[@pos="P+D"])
let $Rcontr2:=count(collection('xml/Rhapsodie.xml')//mot[@pos="P+PRO"])
let $Rpro:=count(collection('xml/Rhapsodie.xml')//mot[@pos="PRO"])
let $Rvb:=count(collection('xml/Rhapsodie.xml')//mot[@pos="V"])
let $Raut:=count(collection('xml/Rhapsodie.xml')//mot[@pos="X"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="Qu"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="PONCT"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="PREF"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="ET"])


let $Snom:=count(collection('xml/Sequoia.xml')//mot[@pos="N"])
let $Sadj:=count(collection('xml/Sequoia.xml')//mot[@pos="A"])
let $Sadv:=count(collection('xml/Sequoia.xml')//mot[@pos="ADV"])
let $Sconj:=count(collection('xml/Sequoia.xml')//mot[@pos="C"])
let $Scl:=count(collection('xml/Sequoia.xml')//mot[@pos="CL"])
let $Sdet:=count(collection('xml/Sequoia.xml')//mot[@pos="D"])
let $Sint:=count(collection('xml/Sequoia.xml')//mot[@pos="I"])
let $Sprep:=count(collection('xml/Sequoia.xml')//mot[@pos="P"])
let $Scontr1:=count(collection('xml/Sequoia.xml')//mot[@pos="P+D"])
let $Scontr2:=count(collection('xml/Sequoia.xml')//mot[@pos="P+PRO"])
let $Spro:=count(collection('xml/Sequoia.xml')//mot[@pos="PRO"])
let $Svb:=count(collection('xml/Sequoia.xml')//mot[@pos="V"])
let $Saut:=count(collection('xml/Sequoia.xml')//mot[@pos="X"]) + count(collection('xml/Sequoia.xml')//mot[@pos="Qu"]) + count(collection('xml/Sequoia.xml')//mot[@pos="PONCT"]) + count(collection('xml/Sequoia.xml')//mot[@pos="PREF"]) + count(collection('xml/Sequoia.xml')//mot[@pos="ET"])


return <table>
<th><td>Fichier</td><td>Noms</td><td>Verbes</td><td>Adjectifs</td><td>Adverbes</td><td>Conjonctions</td><td>Clitiques</td><td>Déterminants</td><td>Pronoms</td><td>Interjections</td><td>Prépositions</td><td>P+D</td><td>P+Pro</td><td>Autres</td></th>
<tr>
<td>Total</td><td>{$nom}</td><td>{$vb}</td><td>{$adj}</td><td>{$adv}</td><td>{$conj}</td><td>{$cl}</td><td>{$det}</td><td>{$pro}</td><td>{$int}</td><td>{$prep}</td><td>{$contr1}</td><td>{$contr2}</td><td>{$aut}</td>
</tr>
<tr>
<td>Rhapsodie</td><td>{$Rnom}</td><td>{$Rvb}</td><td>{$Radj}</td><td>{$Radv}</td><td>{$Rconj}</td><td>{$Rcl}</td><td>{$Rdet}</td><td>{$Rpro}</td><td>{$Rint}</td><td>{$Rprep}</td><td>{$Rcontr1}</td><td>{$Rcontr2}</td><td>{$Raut}</td>
</tr>
<tr>
<td>Sequoia</td><td>{$Snom}</td><td>{$Svb}</td><td>{$Sadj}</td><td>{$Sadv}</td><td>{$Sconj}</td><td>{$Scl}</td><td>{$Sdet}</td><td>{$Spro}</td><td>{$Sint}</td><td>{$Sprep}</td><td>{$Scontr1}</td><td>{$Scontr2}</td><td>{$Saut}</td>
</tr>
</table>