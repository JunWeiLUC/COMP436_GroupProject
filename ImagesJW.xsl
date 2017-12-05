<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:template match="/">
 

<html lang="en">


  <header>
	<a href="book.html" class="book_link">
		<h1> <b>THE BIG BRICK HOUSE</b></h1>
	</a>
  </header>
 
<center><h2> Image Gallery</h2></center> 

   <body>

        <table border ="1"  >
	    <tr bgcolor="#9acd32" align="left">
		<th>No.</th>
		<th>Caption</th>
		<th>People</th>
		<th>Location</th>
		<th>Year</th>
		<th>Event</th>
		<th>Chapter</th>
		<th>Image</th>
		</tr>
      <xsl:for-each select="image_gallery/image">
      <tr>
        <td><xsl:value-of select="ID"/></td>
        <td><xsl:value-of select="Caption"/></td>
        <td><xsl:value-of select="People"/></td>
        <td><xsl:value-of select="Location"/></td>
        <td><xsl:value-of select="Year"/></td>
        <td><xsl:value-of select="Event"/></td>
        <td>
                <a>
			<xsl:attribute name="href">
            <xsl:value-of select="Chapter/@href"/>
        </xsl:attribute>
		<xsl:value-of select="Chapter"/></a>
		</td>
        <td>
		<a>
      <img style="margin: 10px; width:150px" alt="icon" width = "100%">
        <xsl:attribute name="src">
          <xsl:value-of select="photo/@url"/>
        </xsl:attribute>
      </img>
    </a>
		</td>
      </tr>
      </xsl:for-each>
      </table>
	</body>
	
   </html>
</xsl:template>  



</xsl:stylesheet>
  
	