<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
 <html>
 <body>
 <h2>Music Albums</h2>
 <table>
	<tr>
		<th>Album</th>
		<th>Artist</th>
		<th>Year</th>
	</tr>
	<xsl:for-each select="catalogue/album[year!='2010' and year&lt;2016]">
		<tr>
			<td><xsl:value-of select="title"/></td>
			<td><xsl:value-of select="artist"/></td>
			<td><xsl:value-of select="year"/></td>
		</tr>
	</xsl:for-each>
 </table>
 </body>
 </html>

</xsl:template>
 
</xsl:stylesheet>