let $lg := count(//mot)
let $nom := round((count(//mot[@pos="N"]) div $lg) * 100 , 2)
let $adj := round((count(//mot[@pos="A"]) div $lg) * 100 , 2)
let $adv := round((count(//mot[@pos="ADV"]) div $lg) * 100 , 2)
let $conj := round((count(//mot[@pos="C"]) div $lg) * 100 , 2)
let $cl := round((count(//mot[@pos="CL"]) div $lg) * 100 , 2)
let $det := round((count(//mot[@pos="D"]) div $lg) * 100 , 2)
let $int := round((count(//mot[@pos="I"]) div $lg) * 100 , 2)
let $prep := round((count(//mot[@pos="P"]) div $lg) * 100 , 2)
let $contr1 := round((count(//mot[@pos="P+D"]) div $lg) * 100 , 2)
let $contr2 := round((count(//mot[@pos="P+PRO"]) div $lg) * 100 , 2)
let $pro := round((count(//mot[@pos="PRO"]) div $lg) * 100 , 2)
let $vb := round((count(//mot[@pos="V"]) div $lg) * 100 , 2)
let $aut := round(((count(//mot[@pos="X"]) + count(//mot[@pos="Qu"]) + count(//mot[@pos="PONCT"]) + count(//mot[@pos="PREF"]) + count(//mot[@pos="ET"])) div $lg) * 100 , 2)


let $Rlg := count(collection('xml/Rhapsodie.xml')//mot)
let $Rnom := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="N"]) div $Rlg) * 100 , 2)
let $Radj := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="A"]) div $Rlg) * 100 , 2)
let $Radv := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="ADV"]) div $Rlg) * 100 , 2)
let $Rconj := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="C"]) div $Rlg) * 100 , 2)
let $Rcl := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="CL"]) div $Rlg) * 100 , 2)
let $Rdet := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="D"]) div $Rlg) * 100 , 2)
let $Rint := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="I"]) div $Rlg) * 100 , 2)
let $Rprep := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="P"])div $Rlg) * 100 , 2)
let $Rcontr1 := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="P+D"]) div $Rlg) * 100 , 2)
let $Rcontr2 := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="P+PRO"]) div $Rlg) * 100 , 2)
let $Rpro := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="PRO"]) div $Rlg) * 100 , 2)
let $Rvb := round((count(collection('xml/Rhapsodie.xml')//mot[@pos="V"]) div $Rlg) * 100 , 2)
let $Raut := round(((count(collection('xml/Rhapsodie.xml')//mot[@pos="X"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="Qu"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="PONCT"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="PREF"]) + count(collection('xml/Rhapsodie.xml')//mot[@pos="ET"])) div $Rlg) * 100 , 2)


let $Slg := count(collection('xml/Sequoia.xml')//mot)
let $Snom := round((count(collection('xml/Sequoia.xml')//mot[@pos="N"]) div $Slg) * 100 , 2)
let $Sadj := round((count(collection('xml/Sequoia.xml')//mot[@pos="A"]) div $Slg) * 100 , 2)
let $Sadv := round((count(collection('xml/Sequoia.xml')//mot[@pos="ADV"]) div $Slg) * 100 , 2)
let $Sconj := round((count(collection('xml/Sequoia.xml')//mot[@pos="C"]) div $Slg) * 100 , 2)
let $Scl := round((count(collection('xml/Sequoia.xml')//mot[@pos="CL"]) div $Slg) * 100 , 2)
let $Sdet := round((count(collection('xml/Sequoia.xml')//mot[@pos="D"]) div $Slg) * 100 , 2)
let $Sint := round((count(collection('xml/Sequoia.xml')//mot[@pos="I"]) div $Slg) * 100 , 2)
let $Sprep := round((count(collection('xml/Sequoia.xml')//mot[@pos="P"])div $Slg) * 100 , 2)
let $Scontr1 := round((count(collection('xml/Sequoia.xml')//mot[@pos="P+D"]) div $Slg) * 100 , 2)
let $Scontr2 := round((count(collection('xml/Sequoia.xml')//mot[@pos="P+PRO"]) div $Slg) * 100 , 2)
let $Spro := round((count(collection('xml/Sequoia.xml')//mot[@pos="PRO"]) div $Slg) * 100 , 2)
let $Svb := round((count(collection('xml/Sequoia.xml')//mot[@pos="V"]) div $Slg) * 100 , 2)
let $Saut := round(((count(collection('xml/Sequoia.xml')//mot[@pos="X"]) + count(collection('xml/Sequoia.xml')//mot[@pos="Qu"]) + count(collection('xml/Sequoia.xml')//mot[@pos="PONCT"]) + count(collection('xml/Sequoia.xml')//mot[@pos="PREF"]) + count(collection('xml/Sequoia.xml')//mot[@pos="ET"])) div $Slg) * 100 , 2) 


return <table>
<tr><td>Fichier</td><td>Taille</td><td>Noms(%)</td><td>Verbes(%)</td><td>Adjectifs(%)</td><td>Adverbes(%)</td><td>Conjonctions(%)</td><td>Clitiques(%)</td><td>Déterminants(%)</td><td>Pronoms(%)</td><td>Interjections(%)</td><td>Prépositions(%)</td><td>P+D(%)</td><td>P+Pro(%)</td><td>Autres(%)</td></tr>
<tr>
<td>Total</td><td>{$lg}</td><td>{$nom}</td><td>{$vb}</td><td>{$adj}</td><td>{$adv}</td><td>{$conj}</td><td>{$cl}</td><td>{$det}</td><td>{$pro}</td><td>{$int}</td><td>{$prep}</td><td>{$contr1}</td><td>{$contr2}</td><td>{$aut}</td>
</tr>
<tr>
<td>Rhapsodie</td><td>{$Rlg}</td><td>{$Rnom}</td><td>{$Rvb}</td><td>{$Radj}</td><td>{$Radv}</td><td>{$Rconj}</td><td>{$Rcl}</td><td>{$Rdet}</td><td>{$Rpro}</td><td>{$Rint}</td><td>{$Rprep}</td><td>{$Rcontr1}</td><td>{$Rcontr2}</td><td>{$Raut}</td>
</tr>
<tr>
<td>Sequoia</td><td>{$Slg}</td><td>{$Snom}</td><td>{$Svb}</td><td>{$Sadj}</td><td>{$Sadv}</td><td>{$Sconj}</td><td>{$Scl}</td><td>{$Sdet}</td><td>{$Spro}</td><td>{$Sint}</td><td>{$Sprep}</td><td>{$Scontr1}</td><td>{$Scontr2}</td><td>{$Saut}</td>
</tr>
</table>