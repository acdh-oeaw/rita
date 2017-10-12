xquery version "3.1";
declare namespace functx = "http://www.functx.com";
import module namespace xmldb="http://exist-db.org/xquery/xmldb";
import module namespace config="http://www.digital-archiv.at/ns/rita/config" at "../modules/config.xqm";
import module namespace app="http://www.digital-archiv.at/ns/rita/templates" at "../modules/app.xql";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace util = "http://exist-db.org/xquery/util";
declare option exist:serialize "method=xml media-type=text/xml omit-xml-declaration=no indent=yes";

let $baseID := 'https://id.acdh.oeaw.ac.at/'
let $RDF := 
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#"
    xmlns:acdhi="https://id.acdh.oeaw.ac.at/"
    xmlns:foaf="http://xmlns.com/foaf/spec/#"

    xml:base="https://id.acdh.oeaw.ac.at/">
    
<!-- define involved Persons -->
    
        <acdh:Person rdf:about="http://d-nb.info/gnd/1133094783">
            <acdh:hasLastName>Span</acdh:hasLastName>
            <acdh:hasFirstName>Michael</acdh:hasFirstName>
        </acdh:Person>
        <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846">
            <acdh:hasLastName>Andorfer</acdh:hasLastName>
            <acdh:hasFirstName>Peter</acdh:hasFirstName>
        </acdh:Person>
        
<!-- define involved Organisations -->
        
        <acdh:Organisation rdf:about="https://www.tirol.gv.at/bildung/tiroler-wissenschaftsfoerderung/">
            <acdh:hasTitle>Tiroler Wissenschaftsförderung</acdh:hasTitle>
        </acdh:Organisation>
        
<!-- define involved Project(s) -->        

        <acdh:Project rdf:about="https://id.acdh.oeaw.ac.at/project/privater-buchbesitz">
            <acdh:hasTitle>Privater Buchbesitz in Tirol zwischen 1750 und 1850 – Eine Pilotstudie zu den Möglichkeiten und
Grenzen der systematischen Auswertung von Inventaren am Beispiel der Landgerichte Stubai und
Steinach.
            </acdh:hasTitle>
            <acdh:language>deu</acdh:language>
            <acdh:hasContact>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1133094783"/>
            </acdh:hasContact>
            <acdh:hasContact>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846"/>
            </acdh:hasContact>
            <acdh:hasDescription>
            Was las die Tiroler Landbevölkerung um 1800? Ziel des Projekts ist die Erforschung des privaten
Buchbesitzes in Tirol in der sogenannten Sattelzeit, dem Zeitraum von 1750 bis 1850. In den
Inventaren, die sich in den Aktenbeständen zu den ehemaligen Landgerichten Stubai und Steinach
erhalten haben, sollen die verzeichneten Bücher erhoben und so der private Buchbesitz in diesen
ländlichen Regionen beschrieben und analysiert werden. Das Projekt ist als Pilotstudie angelegt. Es
gilt die Potenziale, aber auch die Grenzen der Auswertung von Inventaren am konkreten Beispiel
auszuloten. Basierend auf den in dieser Pilotstudie gewonnenen Erfahrungen sollen in der Folge
Methoden und Workflows entwickelt werden, um ein ähnliches, jedoch größer gefasstes Projekt
beantragen und realisieren zu können.
Diese Studie betritt wissenschaftliches Neuland, ist die erste dieser Art, nicht nur für das Gebiet des
heutigen Österreich, sondern auch für den gesamten katholisch-süddeutschen Raum. Das Projekt
kann somit einen bedeutenden Beitrag zur europäischen Buch- und Lesegeschichte im 18. und 19.
Jahrhundert leisten. Darüber hinaus sollen die im Projekt bearbeiteten Inventarbestände über eine
Onlinedatenbank der wissenschaftlichen Forschung und der interessierten Öffentlichkeit zur
Verfügung gestellt werden.
Für Projektleitung, Archivrecherche und Datenerhebung sowie „analoge“ Dissemination zeichnet
Michael Span verantwortlich. Die technische Umsetzung der Online-Lösung obliegt Peter Andorfer.
            </acdh:hasDescription>
            <acdh:hasStartDate>2015-03-01</acdh:hasStartDate>
            <acdh:hasEndDate>2016-03-31</acdh:hasEndDate>
            <acdh:hasPrincipalInvestigator>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1133094783"/>
            </acdh:hasPrincipalInvestigator>
            <acdh:hasContributor>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846"/>
            </acdh:hasContributor>
            <acdh:hasFunder>
                <acdh:Organisation rdf:about="https://www.tirol.gv.at/bildung/tiroler-wissenschaftsfoerderung/"/>
            </acdh:hasFunder>
            <acdh:hasRelatedCollection rdf:about="{concat($baseID, $config:app-name)}"/>
        </acdh:Project>
        

        <acdh:Collection rdf:about="{concat($baseID, $config:app-name)}">
            <acdh:hasTitle>{$config:app-title}</acdh:hasTitle>
            <acdh:hasContact>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1133094783"/>
            </acdh:hasContact>
            <acdh:hasContact>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846"/>
            </acdh:hasContact>
            <acdh:hasDepositor>
                <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846"/>
            </acdh:hasDepositor>
            <acdh:hasDescription>A collection of XML/TEI transcriptions of inventories</acdh:hasDescription>
            <acdh:hasRelatedProject>
                <acdh:Project rdf:about="https://id.acdh.oeaw.ac.at/project/privater-buchbesitz"/>
            </acdh:hasRelatedProject>          
            <acdh:hasLicense rdf:resource="https://creativecommons.org/licenses/by-sa/4.0/"/>
        </acdh:Collection>

        <acdh:Collection rdf:about="{concat($baseID, string-join(($config:app-name, 'data'), '/'))}">
            <acdh:hasTitle>{string-join(($config:app-name, 'data'), '/')}</acdh:hasTitle>
            <acdh:isPartOf rdf:resource="{concat($baseID,$config:app-name)}"/>
            <acdh:hasLicense rdf:resource="https://creativecommons.org/licenses/by-sa/4.0/"/>
        </acdh:Collection>

        {
            for $x in xmldb:get-child-collections($config:data-root) 
                return
                    <acdh:Collection rdf:about="{concat($baseID,string-join(($config:app-name, 'data', $x), '/'))}">
                        <acdh:hasTitle>{string-join(($config:app-name, 'data', $x), '/')}</acdh:hasTitle>
                        <acdh:isPartOf rdf:resource="{concat($baseID, string-join(($config:app-name, 'data'), '/'))}"/>
                        <acdh:hasContact>
                            <acdh:Person rdf:about="http://d-nb.info/gnd/1133094783"/>
                        </acdh:hasContact>
                        <acdh:hasContact>
                            <acdh:Person rdf:about="http://d-nb.info/gnd/1043833846"/>
                        </acdh:hasContact>
                        <acdh:hasLicense rdf:resource="https://creativecommons.org/licenses/by-sa/4.0/"/>
                    </acdh:Collection>
        }
        {
            for $x in xmldb:get-child-collections($config:data-root)
                for $doc in xmldb:get-child-resources($config:data-root||'/'||$x)
                let $node := try {
                        doc(string-join(($config:data-root, $x, $doc), '/'))
                    } catch * {
                        false()
                    }
                let $filename := string-join(($config:app-name, 'data', $x, $doc), '/')
                let $title := try {
                        <acdh:hasTitle>{normalize-space(string-join($node//tei:titleStmt/tei:title//text(), ' '))}</acdh:hasTitle>
                    } catch * {
                        <acdh:hasTitle>{tokenize($filename, '/')[last()]}</acdh:hasTitle>
                    }

                
                let $filename := string-join(($config:app-name, 'data', $x, $doc), '/')
                return
                    <acdh:Resource rdf:about="{concat($baseID, $filename)}">
                        {$title}
                        <acdh:hasCreator rdf:resource='http://d-nb.info/gnd/1133094783'/>
                        <acdh:hasContributor rdf:resource='http://d-nb.info/gnd/1043833846'/>
                        <acdh:hasDepositor rdf:resource='http://d-nb.info/gnd/1043833846'/>
                        <acdh:hasLicense rdf:resource="https://creativecommons.org/licenses/by-sa/4.0/"/>    
                        <acdh:isPartOf rdf:resource="{concat($baseID, (string-join(($config:app-name, 'data', $x), '/')))}"/>
                        
                    </acdh:Resource>
        }

        
    </rdf:RDF>
    
return
    $RDF