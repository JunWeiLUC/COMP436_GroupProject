<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h3>Loyola</h3>
      <table border="1">
	<tr bgcolor="#9acd32">
	<th>Campus</th>
        <th>Building</th>
        <th>Address</th>
        <th>History</th>
        <th>Area</th>
        <th>Introduction</th>
        <th>No. Images</th>
        <th>Image</th>
        </tr>

        <xsl:apply-templates select="Loyola/campus">
          <xsl:sort select="name" order="ascending" data-type="string" />
        </xsl:apply-templates>
      </table>
	  
	  <table border = "1">
		<h4>campus with old buildings</h4>
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
  </td>
  <td>
	<xsl:value-of select="address"/>
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
  <!--add image, wrap a link with at least one element and one image-->
  <td>
    <image>
	<xsl:attribute name="src">
	  <xsl:value-of select="./images/image[@src]"/>
        </xsl:attribute>
    </image>
    <!--xsl:value-of select="./images/image[position() = last()]"/-->
  </td>
  
</xsl:template>



</xsl:stylesheet>
