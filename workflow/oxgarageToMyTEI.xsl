<xsl:stylesheet xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    <xsl:output method="xml" indent="no"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- teiHeader  -->
    <xsl:template match="tei:teiHeader">
        <xsl:element name="teiHeader">
            <xsl:element name="fileDesc">            
                <!-- titleStmt -->
                <xsl:element name="titleStmt">
                    <xsl:element name="title">
                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[2]/tei:cell[2]"/>
                        <xsl:text> von </xsl:text>
                        <xsl:element name="rs">
                            <xsl:attribute name="type">
                                <xsl:text>person</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="ref">
                                <xsl:text>#</xsl:text>
                                <!--<xsl:value-of select="lower-case(substring-after(ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[3]/tei:cell[2],' '))"/> can´t use this due lxml doesn´t support xpath 2.0-->
                                <xsl:value-of select="substring-after(ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[3]/tei:cell[2],' ')"/>
                                <xsl:text>_</xsl:text>
                                <xsl:value-of select="substring-before(ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[3]/tei:cell[2], ' ')"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[3]/tei:cell[2]"/>
                        </xsl:element>
                    <xsl:text> aus </xsl:text>
                    <xsl:element name="rs">
                        <xsl:attribute name="type">
                            <xsl:text>place</xsl:text>
                        </xsl:attribute>  
                        <xsl:attribute name="ref">
                            <xsl:text>#</xsl:text>
                            <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[4]/tei:cell[2]"/>
                        </xsl:attribute>
                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[4]/tei:cell[2]"/>
                    </xsl:element>
                    <xsl:text>, erstellt </xsl:text>
                    <xsl:element name="date">
                        <xsl:attribute name="when-iso">
                            <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[6]/tei:cell[2]"/>
                        </xsl:attribute>
                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[6]/tei:cell[2]"/>
                    </xsl:element>
                    </xsl:element>
                    <!--respStmt -->
                    <xsl:element name="respStmt">
                        <xsl:element name="resp">
                            <xsl:text>Transkribiert von</xsl:text>
                        </xsl:element>
                        <xsl:element name="name">
                            <xsl:element name="rs">
                                <xsl:attribute name="type">
                                    <xsl:text>person</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="ref">
                                    <xsl:text>#span_michael</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Michael Span</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="respStmt">
                        <xsl:element name="resp">
                            <xsl:text>XML kodiert von</xsl:text>
                        </xsl:element>
                        <xsl:element name="name">
                            <xsl:element name="rs">
                                <xsl:attribute name="type">
                                    <xsl:text>person</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="ref">
                                    <xsl:text>#andorfer_peter</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Peter Andorfer</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <!-- funder -->
                    <xsl:element name="funder">
                        <xsl:element name="name">
                            <xsl:element name="rs">
                                <xsl:attribute name="type">
                                    <xsl:text>organisation</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="ref">
                                    <xsl:text>#twf</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Tiroler Wissenschaftsfonds</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    
                </xsl:element> 
                <!-- publicationStmt -->
                <xsl:element name="publicationStmt">
                    <xsl:element name="publisher">
                        <xsl:text>Michael Span</xsl:text>
                    </xsl:element>
                    <xsl:element name="publisher">
                        <xsl:text>Peter Andorfer</xsl:text>
                    </xsl:element>
                    <xsl:element name="pubPlace">
                        <xsl:text>www.digital-archiv.at</xsl:text>
                    </xsl:element>
                    <xsl:element name="availability">
                        <xsl:element name="licence">
                            <xsl:attribute name="target">
                                <xsl:text>https://creativecommons.org/licenses/by/3.0/</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="p">
                                <xsl:text>The (CC BY-SA 3.0)-License applies to this document.</xsl:text>
                            </xsl:element>
                            <xsl:element name="p">
                                <xsl:text>You are allowed to share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material) for any purpose, even commercially.</xsl:text>
                            </xsl:element>
                            <xsl:element name="p">
                                <xsl:text>You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.</xsl:text>
                            </xsl:element>
                            <xsl:element name="p">
                                <xsl:text>ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="date">
                        <xsl:attribute name="when-iso">2015</xsl:attribute>
                        <xsl:text>2015</xsl:text>
                    </xsl:element>
                </xsl:element>            
                <xsl:element name="sourceDesc">
                    <xsl:element name="msDesc">
                        <xsl:element name="msIdentifier">
                            <xsl:element name="settlement">
                                <xsl:element name="rs">
                                    <xsl:attribute name="type">place</xsl:attribute>
                                    <xsl:attribute name="ref">
                                        <xsl:text>#innsbruck</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Innsbruck</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="repository">Tiroler Landesarchiv</xsl:element>
                            <xsl:element name="collection">
                                <xsl:value-of select="substring-before(ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[1]/tei:cell[2], 'Pos. ')"/>
                            </xsl:element>
                            <xsl:element name="idno">
                                <xsl:value-of select="substring-after(ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[1]/tei:cell[2], 'Pos. ')"></xsl:value-of>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="msContents">
                            <xsl:attribute name="class">
                                <xsl:text>#</xsl:text>
                                <!--<xsl:value-of select=""></xsl:value-of>-->
                            </xsl:attribute>
                            <xsl:element name="p">
                                <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[2]/tei:cell[2]"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="physDesc">
                            <xsl:element name="objectDesc">
                                <xsl:element name="supportDesc">
                                    <xsl:element name="extent">
                                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[10]/tei:cell[2]"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="history">
                            <xsl:element name="origin">
                                <xsl:element name="date">
                                    <xsl:attribute name="when-iso">
                                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[6]/tei:cell[2]"/>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="origPlace">
                                    <xsl:element name="rs">
                                        <xsl:attribute name="type">
                                            <xsl:text>place</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="ref">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[5]/tei:cell[2]"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="ancestor-or-self::tei:TEI//tei:table[preceding-sibling::tei:head[text()='Regest:']]/tei:row[5]/tei:cell[2]"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- text -->
    
    <xsl:template match="tei:div[child::tei:head/text()='Regest:']">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:text>regest</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:div[child::tei:head/text()='Transkription:']">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:text>text</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:head"/>
    
    <!-- hi rend -->
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='annotation_reference'">
                <xsl:element name="add">
                    <xsl:attribute name="place">
                        <xsl:text>margin</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="./tei:note/text()"></xsl:value-of>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@rend='background(yellow)'">
                <xsl:element name="bibl">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@rend='strikethrough'">
                <xsl:element name="dell">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!--<xsl:template match="tei:p[following-sibling::tei:pb[@n='2r']]">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:text>titelblatt</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:apply-templates select="tei:p"/>
        </xsl:element>
    </xsl:template>-->
    
</xsl:stylesheet>

