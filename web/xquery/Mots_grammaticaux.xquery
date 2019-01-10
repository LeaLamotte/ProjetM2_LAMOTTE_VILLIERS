<table>
<th><td>Mot</td><td>Rhapsodie</td><td>Sequoia</td></th>
{
  for $t in distinct-values(//mot[not(@pos="A") and not(@pos="N") and not(@pos="V") and not(@pos="ADV") and not(@pos="X")]/token/text())
let $freqR := count(collection('xml/Rhapsodie.xml')//mot/token/text()[.=$t])
let $freqS := count(collection('xml/Sequoia.xml')//mot/token/text()[.=$t])

return <tr><td>{$t}</td><td>{$freqR}</td><td>{$freqS}</td></tr>}
</table>