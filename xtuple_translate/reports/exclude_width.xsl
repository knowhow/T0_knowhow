<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/TS">
      <!-- <!DOCTYPE TS> -->
      <TS version="2.0">
          <xsl:apply-templates select="context" />
      </TS>
  </xsl:template>

<xsl:template match="context">

    <!-- novi kontekst -->
    <context>
             <name>
                 <xsl:value-of select="name" />
             </name>

              <xsl:apply-templates select="message" />
    </context>

</xsl:template>

<xsl:template match="message">
   <message>
      <source>
         <xsl:value-of select="source" />
       </source>
       <translation>
         <xsl:value-of select="translation" />
       </translation>
   </message>
</xsl:template>

</xsl:stylesheet>
