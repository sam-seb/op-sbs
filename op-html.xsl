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
        <xsl:variable name="currVol" as="element()" select="current()"/>
        <html>
            <head> 
                <title>Volume <xsl:value-of select="@num"/></title>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <h1>
                    SBS Volume <xsl:value-of select="@num"/>
                </h1>
                
              <section class="qt">  
                  <h2>Question Tally</h2>
                
                <table>
                    <tr>
                        <th>Character Name</th>
                        <th>Count of Mentions</th>
                    </tr>
                    
                <xsl:for-each select="descendant::char/@name ! normalize-space() => distinct-values()">   
                    <xsl:sort select="$currVol//char[@name ! normalize-space() = current()] => count()" order="descending"/>
                    <tr>
                        <td><xsl:value-of select="current()"/></td>
                        <td><xsl:value-of select="$currVol//char[@name ! normalize-space() = current()] => count()"/></td>
                    </tr>
                </xsl:for-each>
                    
                    
                </table>
              </section>
                
                <xsl:apply-templates select="chapter">
                    <xsl:sort select="chapter/@num"/>
                </xsl:apply-templates>
                
                
            </body>
            
        </html>
    </xsl:template>
    
    
    <xsl:template match="chapter"> 
        <section class="chpt">
            <h2>Chapter <xsl:value-of select="@num"/>, Page <xsl:value-of select="@page"/></h2>
            <xsl:apply-templates/>
            
        </section>
    </xsl:template>
    <xsl:template match="qna">
        <div class="qna">
            <xsl:apply-templates/>
            
        </div>
        
    </xsl:template>
    
    
    <xsl:template match="d">
        <div class="d">
            <xsl:apply-templates/>
            
        </div>
        
    </xsl:template>
    
    
    <xsl:template match="speaker">
        <span class="speaker"><xsl:apply-templates/>:</span>
    </xsl:template>
    
    
    <xsl:template match="char">
        <span class= "char" title="{@name}">
         <!-- ebb: I changed this from <div> to <span> because in HTML a <span> is meant to be an inline element
         with text flowing around it. A <div> is designed to create a separate block on the page. -->   
            <xsl:apply-templates/>
        </span>
            
        
    </xsl:template>
    
    

</xsl:stylesheet>