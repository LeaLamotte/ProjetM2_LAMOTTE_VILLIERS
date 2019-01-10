let $RhapA := collection('xml/Rhapsodie.xml')//arbre/count(mot/token)
let $SequA := collection('xml/Sequoia.xml')//arbre/count(mot/token)

let $MoyR := round(avg($RhapA), 2)
let $MoyS := round(avg($SequA), 2)

return 
<table>
<th><td>Fichier</td><td>Rhapsodie</td><td>Sequoia</td></th>
<tr><td>Moyenne</td><td>{$MoyR}</td><td>{$MoyS}</td></tr>
</table>