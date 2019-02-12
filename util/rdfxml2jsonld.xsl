<xsl:transform version="3.0"
               expand-text="yes"
               xmlns:json="http://www.w3.org/2005/xpath-functions"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:variable name="json-xml">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:value-of select="xml-to-json($json-xml, map{'indent': true()})"/>
  </xsl:template>

  <xsl:template match="rdf:RDF">
    <json:array>
      <xsl:apply-templates/>
    </json:array>
  </xsl:template>

  <xsl:template match="*">
    <json:map>
      <xsl:if test="not(self::rdf:Description)">
        <json:string key="@type">{namespace-uri()}{local-name()}</json:string>
      </xsl:if>
      <xsl:for-each-group select="*" group-by="name()">
        <json:array key="{namespace-uri()}{local-name()}">
          <xsl:call-template name="property-value"/>
        </json:array>
      </xsl:for-each-group>
    </json:map>
  </xsl:template>

  <xsl:template name="property-value" as="element()*">
    <xsl:for-each select="current-group()">
      <xsl:choose>
        <xsl:when test="empty(*) and @rdf:resource">
          <json:string>{@rdf:resource}</json:string>
        </xsl:when>
        <xsl:when test="empty(*) and not(@xml:lang)">
          <json:string>{.}</json:string>
        </xsl:when>
        <xsl:when test="empty(*)">
          <json:map>
            <json:string key="@value">{.}</json:string>
            <json:string key="@language">{@xml:lang}</json:string>
          </json:map>
        </xsl:when>
        <xsl:otherwise>
          <json:array>
            <xsl:apply-templates/>
          </json:array>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

</xsl:transform>
