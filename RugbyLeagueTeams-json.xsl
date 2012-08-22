<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:strip-space elements="teamsItem" />

    <xsl:template match="/">{ "collection" : 
   		{
    		"version" : "1.0",
    		"href" : "ssgdemo:8080/json",
    		"items" : [<xsl:apply-templates select="//teamsItem"/>],
        	"queries" : [
        		{
        			"prompt" : "Search by Name:", 
        			"rel" : "search", 
        			"href" : "...", 
        			"data" : [
        				{"name" : "name", "value" : ""}
        			]
        		}
        	]
        }
    }
    </xsl:template>

	<!-- team element -->
    <xsl:template match="teamsItem">
			{
				"href" : "...",
				"data" : [
				<xsl:for-each select="*">
				{
					"name" : "<xsl:value-of select="name()"/>", 
	        		"value" : "<xsl:value-of select="." />", 
	        		"prompt" : "<xsl:value-of select="name()"/>"
	        	}<xsl:if test="following-sibling::*">,</xsl:if>
	        	</xsl:for-each>]
	        <xsl:choose>
	        	<xsl:when test="following-sibling::*">},</xsl:when>
	        	<xsl:otherwise>}</xsl:otherwise>
	        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

