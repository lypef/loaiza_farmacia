<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="https://www.w3.org/1999/XSL/Transform" xmlns:xs="https://www.w3.org/2001/XMLSchema" xmlns:fn="https://www.w3.org/2005/xpath-functions" xmlns:BCE="www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion" xmlns:BCEB="https://www.sat.gob.mx/esquemas/ContabilidadE/1_1/BalanzaComprobacion">
	<!--En esta sección se define la inclusión de las plantillas de utilerías para colapsar espacios -->
	<xsl:include href="https://www.sat.gob.mx/esquemas/utilerias.xslt"/>
	<!-- Con el siguiente método se establece que la salida deberá ser en texto -->
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	
		<!-- Aquí iniciamos el procesamiento de la cadena original con su | inicial y el terminador || -->
  <xsl:template match="/">|<xsl:apply-templates select="/BCE:Balanza"/><xsl:apply-templates select="/BCEB:Balanza"/>||</xsl:template>
	
	
	<xsl:template match="BCE:Balanza">
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Version"/>
		</xsl:call-template>		
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@RFC"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Mes"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Anio"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@TipoEnvio"/>
		</xsl:call-template>
		<xsl:call-template name="Opcional">
			<xsl:with-param name="valor" select="./@FechaModBal"/>
		</xsl:call-template>		
		
		<xsl:apply-templates select="./BCE:Ctas"/>
	</xsl:template>
	<xsl:template match="BCE:Ctas">
		
<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@NumCta"/>
		</xsl:call-template>		
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@SaldoIni"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Debe"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Haber"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@SaldoFin"/>
		</xsl:call-template>		
		
	</xsl:template>
	
<!-- Sección B-->	
		<xsl:template match="BCEB:Balanza">
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Version"/>
		</xsl:call-template>		
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@RFC"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Mes"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Anio"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@TipoEnvio"/>
		</xsl:call-template>
		<xsl:call-template name="Opcional">
			<xsl:with-param name="valor" select="./@FechaModBal"/>
		</xsl:call-template>		
		
		<xsl:apply-templates select="./BCEB:Ctas"/>
	</xsl:template>
	<xsl:template match="BCEB:Ctas">
		
<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@NumCta"/>
		</xsl:call-template>		
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@SaldoIni"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Debe"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@Haber"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@SaldoFin"/>
		</xsl:call-template>		
		
	</xsl:template>
	
	
</xsl:stylesheet>
