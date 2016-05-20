xquery version "3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";


(:Code übernommen und adaptiert von http://en.wikibooks.org/wiki/XQuery/TEI_Document_Timeline, Peter Andorfer, 26-07-2014 :)
 
(: get the file name from the URL parameter :)
let $file := request:get-parameter('file', '')
 
(: this is where we will get our TEI documents :)
(:let $data-collection := "/db/":)
 
(: open the document :)
let $tei-document := $file
 
(: get all dates in the body of the document :)
let $dates := doc($tei-document)//tei:body//tei:date
    
return
<data>{
   for $date in $dates
   (:context:)
let $nodesbefore := $date/preceding-sibling::node()
let $nodesafter := $date/following-sibling::node()
let $after := string-join($nodesafter, ' ')
let $afterString := substring($after,1,100)
let $before := string-join($nodesbefore,' ')
let $beforeString := substring($before,string-length($before)- 101,100)
let $context := 
        <div>
          {concat('...', $beforeString,' ')} 
          <b>{$date/text()}</b>
          {concat($afterString,' ...')}
        </div>
   where fn:exists($date/@when)
   return 
     <event start='{$date/@when}' title='{$date/@when}'>
       {util:serialize($context,("method=xhtml","media-type=text/html"))}
     </event>
}</data>