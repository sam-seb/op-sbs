<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"    
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:variable name="charTaggedXML" as="document-node()+" select="collection('char-xml-out')"/>
    <xsl:variable name="ySpacer" select="-10"/>
    <xsl:variable name="xSpacer" select="80"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                    <title>Final Results</title>
                    <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <nav>
                    <a href="index.html">Home Page</a>
                    <a href="volume-select.html">Volume Select</a>
                    <a href="results.html">Character Tally</a>
                </nav>
                <main>
                    <h1>Findings</h1>
                    <p>Here we share how often each of ten significant characters from <cite>One Piece</cite> 
                        is mentioned across all SBS sections in the volumes we studied in this project.</p>
                    
                    
                    
                    <div class="svg">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 650" width="1000" height="650">
                            
                            <!-- ADAPT THE CODE ABOVE TO OUTPUT A BEAUTIFUL SVG PLOT. USE THE SAME FOR-EACH AND SORT.
                            
                            REMEMBER TO ADD viewBox to handle scaling in the browser.
                            
                            REFER TO EXAMPLES KINDLY LEFT FOR YOU IN textAnalysis-Hub
                            -->
                            <g transform="translate(100, 600)">
                                <!-- ebb: This means 0,0 is pushed to the right 50 and down 600. 
                                    So when you multiply by the $ySpacer, you'll be plotting UP the screen from 600.-->
                                
                                <!-- Make an X and Y axis first. 
                                Then, apply xsl:for-each above to output the bars for each character.
                                -->
                                
                                
                                
                                <!--BARS-->
                                <xsl:for-each select="$charTaggedXML//char/@name ! normalize-space() => distinct-values()">  
                                    <xsl:sort select="$charTaggedXML//char[@name ! normalize-space() = current()] => count()" order="descending"/>
                                    <xsl:variable name="yVal" select="$charTaggedXML//char[@name ! normalize-space() = current()] => count()"/>
                                    
                                    <line x1="{$xSpacer * position()}" x2="{$xSpacer * position()}" y1="0" y2="{$yVal * $ySpacer}" stroke="red" stroke-width="70"/>
                              <!--GRAPH LABELS-->
                                    <!--NUMBERS-->
                                    <text x="{$xSpacer * position()}" y="{($ySpacer * $yVal) - 7}" text-anchor="middle" font-size="14" fill="black">
                                        <xsl:value-of select="$charTaggedXML//char[@name ! normalize-space() = current()] => count()"/>
                                    </text>
                                    
                                    <!--NAMES-->
                                    <text x="{$xSpacer * position()}" y="{$ySpacer * - 2}" text-anchor="middle" font-size="14" fill="black">
                                        <xsl:value-of select="current()"/>
                                    </text>
                              
                                </xsl:for-each>
                                
                                <!--AXES-->
                                <line x1="0" y1="-600" x2="0" y2="1" stroke="#000000" stroke-width="3"/>
                                <line x1="-1" y1="0" x2="900" y2="0" stroke="black" stroke-width="3"/>
                                
                                
                            </g> 
                        </svg>
 
                    </div>
                   <table>
                        <tr>
                            <th>Character Name</th>
                            <th>Count of Mentions</th>
                        </tr>
                    <xsl:for-each select="$charTaggedXML//char/@name ! normalize-space() => distinct-values()">  
                        <xsl:sort select="$charTaggedXML//char[@name ! normalize-space() = current()] => count()" order="descending"/>
                        <tr>
                            <td><xsl:value-of select="current()"/></td>
                            <td><xsl:value-of select="$charTaggedXML//char[@name ! normalize-space() = current()] => count()"/></td>
                        </tr>
                    </xsl:for-each>
                    </table>
                    
                </main>
            </body>
        </html>
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>