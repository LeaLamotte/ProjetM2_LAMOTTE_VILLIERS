let $tokenR := collection('xml/Rhapsodie.xml')//token/text()
let $tokenS := collection('xml/Sequoia.xml')//token/text()
let $lentokenR := count($tokenR)
let $lentokenS := count($tokenS)

let $typeR := distinct-values($tokenR)
let $typeS := distinct-values($tokenS)
let $lentypeR := count($typeR)
let $lentypeS := count($typeS)

let $ptypeR := round(($lentypeR div $lentokenR)*100,2)
let $ptypeS := round(($lentypeS div $lentokenS)*100,2)

return <table>
<tr><td>Fichier</td><td>Rhapsodie</td><td>Sequoia</td></tr>
<tr><td>Nombre de Tokens</td><td>{$lentokenR}</td><td>{$lentokenS}</td></tr>
<tr><td>Nombre de Types</td><td>{$lentypeR}</td><td>{$lentypeS}</td></tr>
<tr><td>Pourcentage</td><td>{$ptypeR}</td><td>{$ptypeS}</td></tr>
</table>