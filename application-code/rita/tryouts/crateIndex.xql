xquery version "3.0";
declare namespace functx = "http://www.functx.com";
import module namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tei = "http://www.tei-c.org/ns/1.0";


declare function functx:is-node-in-sequence-deep-equal
  ( $node as node()? ,
    $seq as node()* )  as xs:boolean {

   some $nodeInSeq in $seq satisfies deep-equal($nodeInSeq,$node)
 } ;

declare function functx:distinct-deep
  ( $nodes as node()* )  as node()* {

    for $seq in (1 to count($nodes))
    return $nodes[$seq][not(functx:is-node-in-sequence-deep-equal(
                          .,$nodes[position() < $seq]))]
 } ;

declare function local:slugify_refs( $arg as xs:string)  as xs:string {
   let $arg := lower-case(replace($arg, '[\[\]\(\)#/\?]', ""))
   let $arg := replace($arg, "[\]_\s*“„,;\.:]", "-")
   let $arg := replace($arg, "--*", "-")
   return $arg
 } ;

declare function local:createIndex($type as xs:string, $filename as xs:string) as xs:string {
if($type = "person") then
let $indexFile := 
    <listPerson>{
        for $doc in collection('/db/apps/rita/data/editions/')//tei:rs[@type=$type]
        let $id := local:slugify_refs(data($doc/@ref))
        return 
           <person xml:id="{$id}">
                <persName>{replace($doc, '#', '')}</persName>
            </person>
    }</listPerson>

let $newIndex := <listPerson>{functx:distinct-deep($indexFile//*[name()=$type])}</listPerson>
let $store := xmldb:store('/db/apps/rita/data/indices/', $filename, $newIndex)
return 
    $store
else
    let $indexFile := 
    <listPlace>{
        for $doc in collection('/db/apps/rita/data/editions/')//tei:rs[@type=$type]
        let $id := local:slugify_refs(data($doc/@ref))
        return 
            <place xml:id="{$id}">
                <placeName>{replace($doc, '#', '')}</placeName>
            </place>
    }</listPlace>

let $newIndex := <listPlace>{functx:distinct-deep($indexFile//*[name()=$type])}</listPlace>
let $store := xmldb:store('/db/apps/rita/data/indices/', $filename, $newIndex)
return 
    $store
};

let $indexFile := local:createIndex("place", "placelist.xml")
return 
    $indexFile