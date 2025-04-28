<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    

    <xsl:template match="volume">
        <html>
            <head> 
                <title>Volume <xsl:value-of select="@num"/></title>
                <!-- CSS LINK!!!!!! PUT IT HERE!!-->
            </head>
            <body>
                <h1>
                    SBS Volume <xsl:value-of select="@num"/>
                </h1>
                
                <xsl:apply-templates select="chapter">
                    <xsl:sort select="chapter/@num"/>
                </xsl:apply-templates>
                
                
            </body>
            
        </html>
    </xsl:template>
    
    
    <xsl:template match="chapter"> 
        <section class="chpt">
            <h4>
                Chapter <xsl:value-of select="@num"/>, Page <xsl:value-of select="@page"/>
        </h4>
            <xsl:apply-templates/>
            
        </section>
    </xsl:template>
    <xsl:template match="d">
        <div class="d">
            <xsl:apply-templates/>
            
        </div>
        
    </xsl:template>
    
    <xsl:template match="speaker">
        <span class="speaker"><xsl:apply-templates/>:</span>
    </xsl:template>

</xsl:stylesheet>