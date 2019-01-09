for $t in distinct-values(//mot/token/text())
let $freqR := count(collection('xml/Rhapsodie.xml')//mot/token/text()[.=$t])
let $freqS := count(collection('xml/Sequoia.xml')//mot/token/text()[.=$t])
return <tr><td>{$t}</td><td>{$freqR}</td><td>{$freqS}</td></tr>