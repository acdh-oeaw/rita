xquery version "3.0";
declare namespace functx = "http://www.functx.com";
import module namespace xmldb="http://exist-db.org/xquery/xmldb";
import module namespace config="http://www.digital-archiv.at/ns/rita/config" at "../modules/config.xqm";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare function local:slugify_refs( $arg as xs:string)  as xs:string {
   let $arg := lower-case(replace($arg, '[\[\]\(\)#/\?]', ""))
   let $arg := replace($arg, "[\]_\s*“„,;\.:]", "-")
   let $arg := replace($arg, "--*", "-")
   return $arg
 } ;

for $doc in collection('/db/apps/rita/data/editions/')//tei:rs[@type="place"]
    let $newValue := concat("#",local:slugify_refs(data($doc/@ref)))
    return
        update value $doc/@ref with $newValue
