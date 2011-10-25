<?xml version="1.0" encoding="utf-8"?>
<!--
This file is part of the xTuple ERP: PostBooks Edition, a free and
open source Enterprise Resource Planning software suite,
Copyright (c) 1999-2011 by OpenMFG LLC, d/b/a xTuple.
It is licensed to you under the Common Public Attribution License
version 1.0, the full text of which (including xTuple-specific Exhibits)
is available at www.xtuple.com/CPAL.  By using this software, you agree
to be bound by its terms.
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" />

  <xsl:template match="@*|node()">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>

  <xsl:template match="label">
    <message>
      <width><xsl:value-of select="rect/width"/></width>
      <source><xsl:value-of select="string"/></source>
      <translation type="unfinished"></translation>
    </message>
  </xsl:template>

  <xsl:template match="report">
    <context>
      <name><xsl:value-of select="name"/></name>
      <xsl:apply-templates select="*" />
    </context>
  </xsl:template>

</xsl:stylesheet>
