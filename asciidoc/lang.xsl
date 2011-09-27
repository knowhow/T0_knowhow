<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX 
    ############################################################################ -->

<xsl:param name="latex.encoding">utf8</xsl:param>
<xsl:param name="latex.babel.use">1</xsl:param>
<xsl:param name="korean.package">CJK</xsl:param>
<xsl:param name="cjk.font">cyberbit</xsl:param>
<xsl:param name="xetex.font">
  <xsl:text>\setmainfont{DejaVu Serif}&#10;</xsl:text>
  <xsl:text>\setsansfont{DejaVu Sans}&#10;</xsl:text>
  <xsl:text>\setmonofont{DejaVu Sans Mono}&#10;</xsl:text>
</xsl:param>


<xsl:template name="babel.setup">
  
  <!-- babel use? -->
  <xsl:if test="$latex.babel.use='1'">
    <xsl:variable name="babel">
      <xsl:call-template name="babel.language">
        <xsl:with-param name="lang">
          <xsl:call-template name="l10n.language">
            <xsl:with-param name="target" select="(/set|/book|/article)[1]"/>
            <xsl:with-param name="xref-context" select="true()"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="$babel!=''">
      <xsl:text>\usepackage[</xsl:text>
      <xsl:value-of select="$babel"/>
      <xsl:text>]{babel}&#10;</xsl:text>
      <xsl:text>\usepackage{cmap}&#10;</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="lang.setup">
  <!-- first find the language actually set -->
  <xsl:variable name="lang">
    <xsl:call-template name="l10n.language">
      <xsl:with-param name="target" select="(/set|/book|/article)[1]"/>
      <xsl:with-param name="xref-context" select="true()"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- locale setup for docbook -->
  <xsl:if test="$lang!='' and $lang!='en'">
    <xsl:text>\setuplocale{</xsl:text>
    <xsl:value-of select="substring($lang, 1, 2)"/>
    <xsl:text>}&#10;</xsl:text>
  </xsl:if>

  <!-- some extra babel setup -->
  <xsl:if test="$latex.babel.use='1'">
    <xsl:variable name="babel">
      <xsl:call-template name="babel.language">
        <xsl:with-param name="lang" select="$lang"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="$babel!=''">
      <xsl:text>\setupbabel{</xsl:text>
      <xsl:value-of select="$lang"/>
      <xsl:text>}&#10;</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>


<xsl:template name="babel.language">
  <xsl:param name="lang" select="'en'"/>

  <!-- select the corresponding babel language -->
  <xsl:choose>
    <xsl:when test="$latex.babel.language!=''">
      <xsl:value-of select="$latex.babel.language"/>
    </xsl:when>
    <xsl:when test="starts-with($lang,'af')">afrikaans</xsl:when>
    <xsl:when test="starts-with($lang,'bs')">bosnian</xsl:when>
    <xsl:when test="starts-with($lang,'br')">breton</xsl:when>
    <xsl:when test="starts-with($lang,'ca')">catalan</xsl:when>
    <xsl:when test="starts-with($lang,'cs')">czech</xsl:when>
    <xsl:when test="starts-with($lang,'cy')">welsh</xsl:when>
    <xsl:when test="starts-with($lang,'da')">danish</xsl:when>
    <xsl:when test="starts-with($lang,'de')">ngerman</xsl:when>
    <xsl:when test="starts-with($lang,'el')">greek</xsl:when>
    <xsl:when test="starts-with($lang,'en')">
      <xsl:choose>
        <xsl:when test="starts-with($lang,'en-CA')">canadian</xsl:when>
        <xsl:when test="starts-with($lang,'en-GB')">british</xsl:when>
        <xsl:when test="starts-with($lang,'en-US')">USenglish</xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="starts-with($lang,'eo')">esperanto</xsl:when>
    <xsl:when test="starts-with($lang,'es')">spanish</xsl:when>
    <xsl:when test="starts-with($lang,'et')">estonian</xsl:when>
    <xsl:when test="starts-with($lang,'fi')">finnish</xsl:when>
    <xsl:when test="starts-with($lang,'fr')">french</xsl:when>
    <xsl:when test="starts-with($lang,'ga')">irish</xsl:when>
    <xsl:when test="starts-with($lang,'gd')">scottish</xsl:when>
    <xsl:when test="starts-with($lang,'gl')">galician</xsl:when>
    <xsl:when test="starts-with($lang,'he')">hebrew</xsl:when>
    <xsl:when test="starts-with($lang,'hr')">croatian</xsl:when>
    <xsl:when test="starts-with($lang,'hu')">hungarian</xsl:when>
    <xsl:when test="starts-with($lang,'id')">bahasa</xsl:when>
    <xsl:when test="starts-with($lang,'it')">italian</xsl:when>
    <xsl:when test="starts-with($lang,'nl')">dutch</xsl:when>
    <xsl:when test="starts-with($lang,'nn')">norsk</xsl:when>
    <xsl:when test="starts-with($lang,'pl')">polish</xsl:when>
    <xsl:when test="starts-with($lang,'pt')">
      <xsl:choose>
        <xsl:when test="starts-with($lang,'pt_br')">brazil</xsl:when>
        <xsl:otherwise>portuges</xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="starts-with($lang,'ro')">romanian</xsl:when>
    <xsl:when test="starts-with($lang,'ru')">russian</xsl:when>
    <xsl:when test="starts-with($lang,'sk')">slovak</xsl:when>
    <xsl:when test="starts-with($lang,'sl')">slovene</xsl:when>
    <xsl:when test="starts-with($lang,'sv')">swedish</xsl:when>
    <xsl:when test="starts-with($lang,'tr')">turkish</xsl:when>
    <xsl:when test="starts-with($lang,'uk')">ukrainian</xsl:when>
  </xsl:choose>
</xsl:template>


<xsl:template name="lang.document.begin">
  <xsl:param name="lang"/>
  <xsl:if test="starts-with($lang,'zh') or
                starts-with($lang,'ja') or
                (starts-with($lang,'ko') and $korean.package='CJK')">
    <xsl:text>\begin{CJK}{UTF8}{</xsl:text>
    <xsl:value-of select="$cjk.font"/>
    <xsl:text>}&#10;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template name="lang.document.end">
  <xsl:param name="lang"/>
  <xsl:if test="starts-with($lang,'zh') or
                starts-with($lang,'ja') or
                (starts-with($lang,'ko') and $korean.package='CJK')">
    <xsl:text>\clearpage&#10;</xsl:text>
    <xsl:text>\end{CJK}&#10;</xsl:text>
  </xsl:if>
</xsl:template>

<!-- #############
     # Encodings #
     ############# -->
<!-- Encodings are put with langs since the locale has impact on the encoding
     to use -->

<xsl:template name="lang-in-unicode">
  <xsl:param name="lang"/>
  <xsl:choose>
    <xsl:when test="starts-with($lang,'zh')">1</xsl:when>
    <xsl:when test="starts-with($lang,'ko')">1</xsl:when>
    <xsl:when test="starts-with($lang,'ja')">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- This template should not be there, but currently only encoding needs it -->
<xsl:template name="py.params.set">
  <xsl:variable name="use-unicode">
    <xsl:call-template name="lang-in-unicode">
      <xsl:with-param name="lang">
        <xsl:call-template name="l10n.language">
          <xsl:with-param name="target" select="(/set|/book|/article)[1]"/>
          <xsl:with-param name="xref-context" select="true()"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:variable>
  <xsl:text>%%&lt;params&gt;&#10;</xsl:text>
  <xsl:if test="$use-unicode='1' or $latex.encoding='utf8'">
    <xsl:text>%% latex.encoding utf8&#10;</xsl:text>
  </xsl:if>
  <xsl:text>%%&lt;/params&gt;&#10;</xsl:text>
</xsl:template>

<xsl:template name="encode.before.style">
  <xsl:param name="lang"/>
  <xsl:variable name="use-unicode">
    <xsl:call-template name="lang-in-unicode">
      <xsl:with-param name="lang" select="$lang"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- XeTeX preamble to handle fonts -->
  <xsl:text>\IfFileExists{ifxetex.sty}{%
    \usepackage{ifxetex}%
  }{%
    \newif\ifxetex
    \xetexfalse
  }
  </xsl:text>
  <xsl:text>\ifxetex&#10;</xsl:text>
  <xsl:text>\usepackage{fontspec}&#10;</xsl:text>
  <xsl:text>\usepackage{xltxtra}&#10;</xsl:text>
  <xsl:value-of select="$xetex.font"/>
  <xsl:text>\else&#10;</xsl:text>

  <!-- Standard latex font setup -->
  <xsl:choose>
  <xsl:when test="$use-unicode='1'"/>
  <xsl:when test="$latex.encoding='latin1'">
    <xsl:text>\usepackage[T1]{fontenc}&#10;</xsl:text>
    <xsl:text>\usepackage[latin1]{inputenc}&#10;</xsl:text>
  </xsl:when>
  <xsl:when test="$latex.encoding='utf8'">
    <xsl:text>\usepackage[T2A,T2D,T1]{fontenc}&#10;</xsl:text>
    <xsl:text>\usepackage{ucs}&#10;</xsl:text>
    <xsl:text>\usepackage[utf8x]{inputenc}&#10;</xsl:text>
    <xsl:text>\def\hyperparamadd{unicode=true}&#10;</xsl:text>
  </xsl:when>
  </xsl:choose>

  <xsl:text>\fi&#10;</xsl:text>
</xsl:template>

<xsl:template name="encode.after.style">
  <xsl:param name="lang"/>
  <xsl:variable name="use-unicode">
    <xsl:call-template name="lang-in-unicode">
      <xsl:with-param name="lang" select="$lang"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:choose>
  <xsl:when test="$use-unicode='1' or $latex.encoding='utf8'">
    <xsl:text>\lstset{inputencoding=utf8x, extendedchars=\true}&#10;</xsl:text>
  </xsl:when>
  <xsl:when test="$latex.encoding='latin1' and $latex.unicode.use!='0'">
    <!-- Use the UTF-8 Passivetex support if required -->
    <xsl:text>\usepackage{unicode}&#10;</xsl:text>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- Font setup, used by annotation files embedded in main files -->
<xsl:template name="font.setup">
  <xsl:param name="lang"/>
  <xsl:call-template name="encode.before.style">
    <xsl:with-param name="lang" select="$lang"/>
  </xsl:call-template>
  <xsl:call-template name="encode.after.style">
    <xsl:with-param name="lang" select="$lang"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
