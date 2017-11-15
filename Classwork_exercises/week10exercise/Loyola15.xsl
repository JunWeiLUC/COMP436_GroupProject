<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h3>Loyola</h3>
      <table border ="1"  >
	    <tr bgcolor="#9acd32" align="left">
		<th>Campus</th>
		<th>Building type</th>
		<th>Building Name</th>
		<th>Year</th>
		<th>Area</th>
		<th>Introduction</th>
		<th>Image No.</th>
		<th>Image Name</th>
		<th>Image</th>
		</tr>
        <xsl:apply-templates select="Loyola/campus">
          <xsl:sort select="name" order="ascending" />
        </xsl:apply-templates>
      </table>
	  </body>
	  <body>
	  <h4>Campus with old buildings</h4>
	  <table border="1">
	    <tr bgcolor="#9acd32" align="left">
		<th>Campus</th>
		<th>Building type</th>
		<th>Building Name</th>
		<th>Year</th>
		<th>Area</th>
		<th>Introduction</th>
		<th>Image No.</th>
		<th>Image Name</th>
		<th>Image</th>
        </tr>
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
    <xsl:apply-templates select="building[@type='general']"/>
  </tr>
</xsl:template>

<xsl:template match="abbrev">
  <td>
    <xsl:value-of select="."/>
  </td>
</xsl:template>

<xsl:template match="building">
  <td>
      <xsl:choose>
      <xsl:when test="year &lt; 1940">
        <xsl:text>Landmark</xsl:text>
      </xsl:when>
      <xsl:otherwise>
       <xsl:text>New building</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </td>
  <td>
	<xsl:value-of select="buildingName"/>
  </td>

  <td>
	<xsl:value-of select="2017-year"/>
	<xsl:text> years old</xsl:text>
  </td>
  
  <td>
    <xsl:text>total area: </xsl:text>
	<xsl:value-of select="format-number(./number-of-floors*./floorArea, '0.#')"/> foot<sup>2</sup>
  </td>
  
  <td>
    <xsl:value-of select="substring(./note,1,30)"/>
    ...
  </td>
  
  <td>
    <xsl:value-of select="count(./images/image)"/>
  </td>
  
  <xsl:apply-templates select="images"/>
  
</xsl:template>

<xsl:template match="images">
  <td>
	<xsl:value-of select="image[position() = last()]"/>
  </td>
  <td>
      <a>
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="image[position() = last()]/@src"/>
        </xsl:attribute>
      </img>
    </a>
  </td>
</xsl:template>


</xsl:stylesheet>