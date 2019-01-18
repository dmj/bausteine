Bausteine wiederverwendbarer Metadaten
==

Regeln der RDF/XML Serialisierung
--

Die kanonische Serialisierung produziert ausschließlich gestreiftes (striped) RDF/XML.

URI-Referenzen werden immer als URIs, nie als relative URI-Referenzen ausgedrückt.

Aussagen werden nur über Entitäten getroffen, der URI aus der eigenen Wissensbasis stammen.  Die
Identität mit Entitäten anderer Wissensbasen wird durch die Eigenschaft owl:sameAs ausgedrückt.

Jede Entität muss mindestens eine Eigenschaften skos:prefLabel mit einem natürlichsprachigen
Bezeichner führen.

Bausteine
--

### lib/shared.rnc

RelaxNG für allgemeine Entitäten und Eigenschaften des kanonischen RDF/XML.

### lib/shared-dc.rnc

RelaxNG für Entitäten und Eigenschaften aus Dublin Core Qualified.

Anwendungen
--

### app/diglib-rightsmd.rnc

RelaxNG der administrativen Metadaten für [Produkte der Massendigitalisierung](https://github.com/dmj/mets-anwendungsprofil).

Literatur
--

Dodds, Leigh: „Principled use of RDF/XML“, 12.06.2012,
https://blog.ldodds.com/2012/06/12/principled-use-of-rdfxml/.

Dodds, Leigh und Ian Davis: Linked Data Patterns. A pattern catalogue for modelling, publishing, and
consuming Linked Data, online, http://patterns.dataincubator.org/book/.

DuCharme, Bob und John Cowan: „Make Your XML RDF-Friendly“, 30.10.2002,
https://www.xml.com/pub/a/2002/10/30/rdf-friendly.html.
