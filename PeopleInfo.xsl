<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:preserve-space elements="nickname last_name" />
<xsl:template match="/">

<html> 
<body>
  <h2>List of Names in Book</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Name</th>
      <th style="text-align:left">Key Dates</th>
      <th style="text-align:left">Generation</th>
</tr>
    <xsl:for-each select="family/name">
    <tr>
      <td><xsl:value-of select="nickname"/>   
      <xsl:value-of select="last_name"/> </td>
           <td>(<xsl:value-of select="birth_year"/>  -
      <xsl:value-of select="death_year"/>)</td>
           <td style="text-align:center">
     <xsl:value-of select="generation"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>