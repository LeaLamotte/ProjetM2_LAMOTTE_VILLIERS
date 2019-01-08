<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>

<xsl:template match="/">

<style>
html {
    width:600px;
    float:center;
    padding:10px; 
	margin-left:400px;
}
</style>

	<html>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
		
		<title>Documents structurés - Exercices autour du langage XML</title>
		
		<header>
			<xsl:apply-templates select="//entete"/>
			<xsl:apply-templates select="//menu"/>
		</header>
		
		<body>
			<xsl:apply-templates select="//exercice"/>
		</body>
	
	</html>
</xsl:template>

<!-- Template entete -->

<xsl:template match="entete">
	<div class="w3-container w3-white">
		<h2>
			<xsl:value-of select="titre_entete"/>
		</h2>
	</div>
	<div class="w3-container w3-white">
		<p>
			<xsl:value-of select="presentation"/>
		</p>
	</div>
</xsl:template>

<!-- Template menu -->

<xsl:template match="menu">
	<div class="w3-bar w3-light-grey">
		
		<xsl:apply-templates select="./bouton"/>
		
	</div>
</xsl:template>

<!-- Template bouton -->

<xsl:template match="bouton/titre_bouton">
	<div class="w3-dropdown-hover">
		<a href="#{@anchor}" class="w3-button">
			<xsl:value-of select="."/>

		</a>
	</div>
</xsl:template>
			
<!-- Template exercice -->

<xsl:template match="exercice">

	<div id="{@id}" class="w3-container">
	
		<xsl:apply-templates select="./exercice_intro"/>
		<xsl:apply-templates select="./exercice_corps"/>
		
	</div>

</xsl:template>

<!-- Template exercice_intro -->

<xsl:template match="exercice_intro">

		<h3>
			<span class="w3-tag w3-teal">\( ^o^)/</span>
			<xsl:value-of select="titre_paragraphe"/>
		</h3>
		<p>
			<xsl:value-of select="paragraphe"/>
		</p>
		
</xsl:template>

<!-- Template exercice_corps -->

<xsl:template match="exercice_corps/elem">
		<h4>
			<xsl:value-of select="./titre_corps"/>
		</h4>
		<p>
			<xsl:apply-templates select="./paragraphe_corps"/>
		</p>	
</xsl:template>

<!-- Template exercice_corps -->

<xsl:template match="paragraphe_corps">
	<xsl:apply-templates select="./text"/>
	<xsl:apply-templates select="./lien"/>
	<xsl:apply-templates select="./code"/>
	<xsl:apply-templates select="./image"/>
	<xsl:apply-templates select="./liste"/>
	<xsl:apply-templates select="./liste_2"/>
	<xsl:apply-templates select="./answer"/>
	<xsl:apply-templates select="./return"/>
</xsl:template>

<xsl:template match="text">
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="lien">
	<a href="{@url}"><xsl:value-of select ="."/></a>
</xsl:template>

<xsl:template match="code">
	<div class="w3-code htmlHigh notranslate"><xsl:value-of select="."/></div>
</xsl:template>

<xsl:template match="image">
	<img src="{@url}" />
</xsl:template>

<xsl:template match="liste">
	<ol><xsl:apply-templates select="./elem_liste"/></ol>
</xsl:template>

<xsl:template match="liste_2">
	<ul><xsl:apply-templates select="./elem_liste"/></ul>
</xsl:template>

<xsl:template match="answer">
	<h4><b><div class="w3-light-grey"><xsl:value-of select="."/></div></b></h4>
</xsl:template>

<xsl:template match="return">
	<a href="#top" class="w3-btn w3-light-grey"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="elem_liste">
	<li>
	<xsl:apply-templates select="./text-content"/>
	<xsl:apply-templates select="./lien-content"/>
	<xsl:apply-templates select="./code-content"/>
	</li>
</xsl:template>

<xsl:template match="text-content">
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="lien-content">
	<a href="{@url}"><xsl:value-of select ="."/></a>
</xsl:template>

<xsl:template match="code-content">
	<div class="w3-code htmlHigh notranslate"><xsl:value-of select="."/></div>
</xsl:template>

</xsl:stylesheet>