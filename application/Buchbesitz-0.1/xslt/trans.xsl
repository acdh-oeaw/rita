<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html"/>
    <xsl:param name="ref"/>
    <xsl:template match="/">
        <div id="content" class="container-fluid"><!-- Kopfzeile -->
            <div class="header" style="background-color: #EEE; margin-top:1.7em; font-size: 1.5em; text-align: right; line-height: 120%;">
                <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
            </div><!-- Regest -->
            <div class="regest" style="margin-right:10%;">
                <h3 align="center">
                    Regest
                </h3>
                <xsl:apply-templates select="//tei:msContents"/>
                <hr/>
            </div>
            <div class="regest" style="margin-right:10%;">
                <h3 align="center">
                    Anmerkungen zum Dokument
                </h3>
                <xsl:apply-templates select="//tei:physDesc"/>
                <hr/>
            </div><!-- Transkritp -->
            <div class="transcript">
                <xsl:apply-templates select="//tei:body"/>
                <hr/>
            </div><!-- Fußnotenapparat -->
            <xsl:for-each select="tei:TEI/tei:text/tei:body//tei:note">
                <div class="footnotes">
                    <xsl:element name="a">
                        <xsl:attribute name="name">
                            <xsl:text>fn</xsl:text>
                            <xsl:number level="any" format="1" count="tei:note"/>
                        </xsl:attribute>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>#fna_</xsl:text>
                                <xsl:number level="any" format="1" count="tei:note"/>
                            </xsl:attribute>
                            <span style="font-size:7pt;vertical-align:super;">
                                <xsl:number level="any" format="1" count="tei:note"/>
                            </span>
                        </a>
                    </xsl:element>
                    <text/>
                    <xsl:apply-templates/>
                </div>
            </xsl:for-each><!-- Kommentare -->
            <div align="center">
                <div>
                    <h3>Kommentare</h3>
                    <p>Sie möchten einen Kommentar, Anmerkungen oder Kritik hinterlassen, dann folgen Sie btte nachstehendem Link</p>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>http://thun-korrespondenz.uibk.ac.at:8080/exist/apps/Thun-Collection/pages/comment_input.html?filename=</xsl:text>
                            <xsl:value-of select="substring-before(tei:TEI/@xml:id,'.')"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        Kommentar verfassen
                    </xsl:element>
                </div>
                <div>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>http://thun-korrespondenz.uibk.ac.at:8080/exist/apps/Thun-Collection/pages/comment_output.html?filename=</xsl:text>
                            <xsl:value-of select="substring-before(tei:TEI/@xml:id,'.')"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        Zeige Kommentare
                    </xsl:element>
                </div>
            </div><!-- Footer -->
            <div class="footer">
                <xsl:text>Das Dokument mit der Signatur:</xsl:text>
                <br/>
                <strong>
                    <xsl:value-of select="//tei:msIdentifier/tei:institution"/>,
                    <xsl:value-of select="//tei:msIdentifier/tei:repository"/>,
                    <xsl:value-of select="//tei:msIdentifier/tei:idno"/>
                </strong>
                <br/>
                wurde transkribiert und annotiert von <a href="http://thun-korrespondenz.uibk.ac.at/?page_id=38">Tanja Kraler</a> und <a href="http://thun-korrespondenz.uibk.ac.at/?page_id=42">Christof Aichner</a>. <br/>Die Web-Darstellung der
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:TEI/@xml:base"/>
                        <xsl:value-of select="tei:TEI/@xml:id"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:text>_blank</xsl:text>
                    </xsl:attribute>
                    TEI/XML-Datei
                </xsl:element> wurde mittels 
                <a href="http://thun-korrespondenz.uibk.ac.at:8080/exist/apps/eXide/index.html?open=/db/files/thun/xsl/transform.xsl">xsl-Transformation</a> realisiert.<br/>
            </div>
        </div>
    </xsl:template><!-- EINZELNE TEMPLATES    --><!-- Schlagwörter   -->
    <xsl:template match="tei:index">
        <div>
            <h3 align="center">Schlagwörter</h3>
            <xsl:for-each select="//tei:term">
                <ul>
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </ul>
            </xsl:for-each>
            <hr/>
            <h3 align="center">Transkript</h3>
        </div>
    </xsl:template><!-- placeName  --><!--<xsl:template match="tei:placeName">
        <a>
            <xsl:attribute name="href">
                <xsl:text>javascript:show_annotation('/db/files/thun/register','/xml/ortsverzeichnis.xml','/xsl/show-place.xsl','</xsl:text>
                <xsl:value-of select="./@key"/>
                <xsl:text>',300,500)</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>--><!-- persName   -->
    <xsl:template match="tei:persName">
        <a>
            <xsl:attribute name="href">
                <xsl:text>javascript:show_annotation('/db/files/thun/register','/xml/personenverzeichnis.xml','/xsl/show-person.xsl','</xsl:text>
                <xsl:value-of select="./@key"/>
                <xsl:text>',300,500)</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template><!--  tei:date  -->
    <xsl:template match="tei:date">
        <abbr>
            <xsl:attribute name="title">
                <xsl:value-of select="./@when"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </abbr>
    </xsl:template><!-- tei:p   -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template><!-- Handwechsel -->
    <xsl:template match="tei:add">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template><!-- unterstrichen -->
    <xsl:template match="tei:hi[@rend='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template><!-- Fußnotenanzeiger im Text -->
    <xsl:template match="tei:note">
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:text>fna_</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:text>#fn</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
            <span style="font-size:7pt;vertical-align:super;">
                <xsl:number level="any" format="1" count="tei:note"/>
            </span>
        </xsl:element>
    </xsl:template><!-- head -->
    <xsl:template match="tei:head">
        <div>
            <xsl:attribute name="class">
                <text>info</text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template><!-- regest -->
    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="@type='regest'">
                <div>
                    <xsl:attribute name="class">
                        <text>regest</text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>
            </xsl:when><!-- transcript -->
            <xsl:when test="@type='transcript'">
                <div>
                    <xsl:attribute name="class">
                        <text>transcript</text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template><!-- linebreak - Zeilenumbruch   -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template><!--Versuche-->
</xsl:stylesheet>