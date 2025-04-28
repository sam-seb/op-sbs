<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    <!-- XML to XML Identity Transform to mark character names from a series of names stored in a variable. -->

    <xsl:variable name="charName" as="xs:string+" select="'Morgan', 'Alvida', 'Luffy', 'Zoro', 'Nami', 'Usopp'"/>

<xsl:template match="say">
    <xsl:variable name="tokenizedText" as="xs:string+" select="text() ! tokenize(., '\s+')"/>
   
       <xsl:for-each select="$tokenizedText">
        
       <xsl:choose>
           <xsl:when test="for $i in $charName return current()[matches(., $i)]">
               <span class="char" title="{for $i in $charName return $i[contains(current(), .) ]}"><xsl:value-of select="current()"/></span>
               <xsl:text> </xsl:text>
           </xsl:when>
           <xsl:otherwise>
               <xsl:value-of select="current() || ' '"/>
           </xsl:otherwise>
           
       </xsl:choose>
        
    </xsl:for-each>
    
    
</xsl:template>



    
</xsl:stylesheet>