<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:template match="/">
 <html>
   <head>
    <title>Image Gallery</title>
   </head>
	
   <body>
	<header> 
	 <h1>Image Gallery</h1>
	</header>
	
	<xsl:apply-templates select="image_gallery/image"/>
   </body>
  
  </html>
  
  <xsl:template match="image"> 
   <p>
	<xsl:apply-templates select="title"/>
	<xsl:apply-templates select="description"/>
   </p>
   <xsl:apply-templates selct="photo">
   <xsl:apply-templates selct="link">
 </xsl:template>	
 
 <xsl:template match="title">
  Name: 
  <xsl:value-of selct="."/> 
  <br />
 </xsl:template>
 
 <xsl:template match="description">
  Description: 
  <xsl:value-of selct="."/> 
  <br />
 </xsl:template>

 <xsl:template match="photo">
  Image:
  <a>
   <xsl:attribute name="src">
    <xsl:value-of selct="image[@type='jpg']/@url"/>
   </xsl:attribute>
  </a>
  <br />
 </xsl:template> 
 
</xsl:stylesheet>
  
	