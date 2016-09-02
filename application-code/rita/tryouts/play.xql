xquery version "3.0";
declare namespace functx = "http://www.functx.com";
import module namespace xmldb="http://exist-db.org/xquery/xmldb";
import module namespace config="http://www.digital-archiv.at/ns/rita/config" at "../modules/config.xqm";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $doc in collection('/db/apps/rita/data/other/summary.xml')//tei:row
return
    <li>{$doc}</li>