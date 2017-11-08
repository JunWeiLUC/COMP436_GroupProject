<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h3>Loyola</h3>
      <table>
        <xsl:apply-templates select="Loyola/campus">
          <xsl:sort select="name" order="ascending" data-type="string" />
        </xsl:apply-templates>
      </table>
	  
	  <table>
		<h4>Loyola old buildings</h4>
        <xsl:apply-templates select="Loyola/campus[./building/year &lt; 1940]">
          <xsl:sort select="year" order="descending" data-type="number" />
        </xsl:apply-templates>
      </table>
	  
    </body>
  </html>
</xsl:template>

<xsl:template match="campus">
  <tr>
    <xsl:apply-templates select="abbrev"/>
    <xsl:apply-templates select="building"/>
	<xsl:apply-templates select="building/images"/>
  </tr>
</xsl:template>

<xsl:template match="abbrev">
  <td>
    <xsl:value-of select="."/>
  </td>
</xsl:template>

<xsl:template match="building">
  <td>
	<xsl:value-of select="buildingName"/>
	<xsl:text> Its address is </xsl:text>
	<xsl:value-of select="address"/>
	<xsl:text> and it is build in </xsl:text>
    <xsl:value-of select="year"/>
  </td>
</xsl:template>

<xsl:template match="building/images">
  <td>
	<xsl:value-of select="image[position() = last()]"/>
  </td>
</xsl:template>



</xsl:stylesheet>