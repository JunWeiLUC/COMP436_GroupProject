<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match = "/">
<html>
	<body>
		<h1>Catalogue</h1>
		<table>
			<tr>
				<th>Maker</th>
				<th>Model</th>
			</tr>
		<xsl:for-each select="catalogue/Car">
		<xsl:sort select="Maker"/>
			<tr>
				<td><xsl:value-of select="Maker"/></td>
				<td><xsl:value-of select="Model"/></td>
			</tr>
		</xsl:for-each>
		</table>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>