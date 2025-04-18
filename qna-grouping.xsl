<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="chapter">
        <chapter num="{@num}" page="{@page}">
        <xsl:for-each-group select="*" group-starting-with="d[speaker='D']">
        
            <qna>
               <xsl:apply-templates select="current-group()"/> 
            </qna>
            
            
        </xsl:for-each-group>
        
        </chapter>
    </xsl:template>
    
</xsl:stylesheet>