<?xml version="1.0" c="1" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:hy="https://hyacinth.library.columbia.edu/functions#"
    extension-element-prefixes="hy"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" method="text" omit-xml-declaration="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">{<xsl:call-template name="linebreak" />
        <xsl:apply-templates select="/mods:mods/mods:identifier[@type='fedora_pid']"/>
        <xsl:call-template name="separator" />
        <xsl:text>"identifiers":</xsl:text>
        <xsl:call-template name="quote-array">
            <xsl:with-param name="array" select="/mods:mods/mods:identifier" />
        </xsl:call-template>
        <xsl:call-template name="separator" />
        <xsl:text>"title":</xsl:text>
        <xsl:call-template name="quote-value">
            <xsl:with-param name="value" select="/mods:mods/mods:titleInfo/mods:title[1]" />
        </xsl:call-template>
        <xsl:call-template name="separator" />
        <xsl:call-template name="state" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="dc-type" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="project" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="publish-targets" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="digital-object-type" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="dynamic-field-data" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="ordered-children-blank" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="parent-objects-blank" />
        <xsl:call-template name="separator" />
        <xsl:call-template name="doi-blank" />
}</xsl:template>

    <xsl:template match="mods:identifier[@type='fedora_pid']">
        <xsl:text>"pid": </xsl:text>
        <xsl:call-template name="quote-value">
            <xsl:with-param name="value" select="current()" />
        </xsl:call-template>
    </xsl:template>

   <xsl:template name="state">
"state":"A"</xsl:template>
   <xsl:template name="dc-type">
"dc_type":"InteractiveResource"</xsl:template>
   <xsl:template name="project">
"project": {
    "pid": "cul:8w9ghx3ftg",
    "uri": "https:\/\/dlc.library.columbia.edu\/restricted\/universityseminars",
    "display_label": "University Seminars Digital Archive",
    "short_label": "University Seminars Digital Archive",
    "string_key": "university_seminars"
}</xsl:template>
   <xsl:template name="publish-targets">
"publish_targets": [
    
]</xsl:template>
   <xsl:template name="digital-object-type">
"digital_object_type": {
    "string_key": "item",
    "display_label": "Item"
}</xsl:template>
   <xsl:template name="dynamic-field-data">
"dynamic_field_data": {
    <xsl:call-template name="dfd-collection" />
    <xsl:call-template name="separator" />
<xsl:call-template name="date-created" />
<xsl:call-template name="separator" />
<xsl:call-template name="date-created-textual" />
<xsl:call-template name="separator" />
<xsl:call-template name="digital-origin" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-form" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-language" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-location" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-name" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-place-of-origin" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-record-info" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-type-of-resource" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-subjects" />
<xsl:call-template name="separator" />
<xsl:call-template name="dfd-title" />
}</xsl:template>
   <xsl:template name="dfd-collection">
    "collection": [
        {
            "collection_term": {
                "uri": "http:\/\/id.library.columbia.edu\/term\/d0703c8d-ecb9-4a41-baf9-2ae87bdf1227",
                "value": "University Seminars records",
                "type": "local",
                "authority": "local",
                "vocabulary_string_key": "collection",
                "internal_id": 195692
            }
        }
    ]</xsl:template>
   <xsl:template name="date-created">
    "date_created": [
        {
            "date_created_start_value": <xsl:call-template name="quote-value"><xsl:with-param name="value" select="/mods:mods/mods:originInfo/mods:dateCreated[@point='start']" /></xsl:call-template>,
            "date_created_end_value": <xsl:call-template name="quote-value"><xsl:with-param name="value" select="/mods:mods/mods:originInfo/mods:dateCreated[@point='end']" /></xsl:call-template>
        }
    ]</xsl:template>

   <xsl:template name="date-created-textual">
    "date_created_textual": [
        {
            "date_created_textual_value": <xsl:call-template name="quote-value"><xsl:with-param name="value" select="/mods:mods/mods:originInfo/mods:dateCreated[not(@point)]" /></xsl:call-template>
        }
    ]</xsl:template>
    <xsl:template name="digital-origin">
    "digital_origin": [
        {
            "digital_origin_value": "born digital"
        }
    ]</xsl:template>
    <xsl:template name="dfd-form">
    "form":[
        <xsl:for-each select="/mods:mods/mods:physicalDescription/mods:form[@authority='local']">
        {
            "form_term": <xsl:value-of select="hy:lookup('form',@authority, current())" />
        },
        </xsl:for-each>
        {
            "form_term": {
                "uri": "http:\/\/vocab.getty.edu\/aat\/300027425",
                "value": "administrative records",
                "type": "external",
                "authority": "aat",
                "vocabulary_string_key": "form",
                "internal_id": 364173
            }
        }
    ]</xsl:template>
    <xsl:template name="dfd-language">
    "language": [
            {
                "language_term": {
                    "uri": "http:\/\/id.loc.gov\/vocabulary\/languages\/eng",
                    "value": "English",
                    "type": "external",
                    "authority": "iso639-2",
                    "vocabulary_string_key": "language",
                    "internal_id": 362874
                }
            }
        ]</xsl:template>
    <xsl:template name="dfd-location">
<![CDATA[
    "location": [
            {
                "location_term": {
                    "uri": "http:\/\/id.library.columbia.edu\/term\/d2142d01-deaa-4a39-8dbd-72c4f148353f",
                    "value": "Rare Book & Manuscript Library, Columbia University",
                    "type": "local",
                    "authority": "marcorg",
                    "vocabulary_string_key": "location",
                    "internal_id": 50,
                    "code": "NNC-RB"
                }
            }
        ]]]></xsl:template>
    <xsl:template name="dfd-name">
    "name":[
        <xsl:for-each select="/mods:mods/mods:name[@usage='primary']/mods:nameTerm[not(text() = '')]">
        {
            "name_usage_primary": true,
            "name_term": <xsl:value-of select="hy:lookup('name','local',current())" />
        },
        </xsl:for-each>
        {
            "name_term": {
                "uri": "http:\/\/id.loc.gov\/authorities\/names\/n81132211",
                "value": "Columbia University. University Seminars",
                "type": "external",
                "vocabulary_string_key": "name",
                "internal_id": 364185,
                "name_type": "corporate"
            }
        }
    ]</xsl:template>
    <xsl:template name="dfd-place-of-origin">
    "place_of_origin": [
<xsl:for-each select="/mods:mods/mods:originInfo/mods:place/mods:placeTerm">
        {
            "place_of_origin_value": <xsl:call-template name="quote-value">
            <xsl:with-param name="value" select="current()"/></xsl:call-template>
        }
            <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
        
</xsl:for-each>
    ]</xsl:template>
    <xsl:template name="dfd-record-info">
    "record_content_source": [
        {
            "record_content_source_value": <xsl:call-template name="quote-value"><xsl:with-param select="//mods:recordInfo/mods:recordContentSource[1]" name="value" /></xsl:call-template>
        }
    ],
    "record_origin": [
        {
            "record_origin_value": <xsl:call-template name="quote-value"><xsl:with-param select="//mods:recordInfo/mods:recordOrigin[1]" name="value" /></xsl:call-template>
        }
    ]</xsl:template>
    <xsl:template name="dfd-type-of-resource">
    "type_of_resource": [
        {
            "type_of_resource_value": <xsl:call-template name="quote-value"><xsl:with-param select="//mods:mods/mods:typeOfResource[1]" name="value" /></xsl:call-template>
        }
    ]</xsl:template>
    <xsl:template name="dfd-subjects">
    "subject_topic": [ <xsl:variable name="vocabulary" select="'subject_topic'" />
    <xsl:for-each select="/mods:mods/mods:subject[mods:topic/text()]">
        <xsl:variable name="authority" select="@authority" />
        {
        "subject_topic_term": <xsl:value-of select="hy:lookup($vocabulary, $authority, current())" />
        }
            <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
    </xsl:for-each>
    ]</xsl:template>
    <xsl:template name="dfd-title">
    "title": [
<xsl:for-each select="/mods:mods/mods:titleInfo/mods:title/node()">
    <xsl:choose><xsl:when test="local-name(current()) = 'nonSort'">
        {
            "title_non_sort_portion": "<xsl:value-of select="current()" />"
        }
    </xsl:when><xsl:otherwise>
        {
            "title_sort_portion": "<xsl:value-of select="current()" />"
        }
    </xsl:otherwise></xsl:choose><xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if></xsl:for-each>]</xsl:template>
    <xsl:template name="ordered-children-blank">
"ordered_child_digital_objects": []</xsl:template>
    <xsl:template name="parent-objects-blank">
"parent_digital_objects": []</xsl:template>
    <xsl:template name="doi-blank">
"doi": null</xsl:template>
    <xsl:template name="quote-array">
        <xsl:param name="array" />
        <xsl:text>[</xsl:text>
        <xsl:call-template name="quote-list">
            <xsl:with-param name="list" select="$array" />
        </xsl:call-template>
        <xsl:text>]</xsl:text>
    </xsl:template>
    <xsl:template name="quote-list">
        <xsl:param name="list" />
        <xsl:for-each select="$list">
            <xsl:call-template name="quote-value">
                <xsl:with-param name="value" select="current()" />
            </xsl:call-template>
            <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="quote-value">
        <xsl:param name="value" />
        <xsl:text>"</xsl:text><xsl:value-of select="$value"/><xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template name="linebreak">
        <xsl:text>
</xsl:text>
    </xsl:template>
    <xsl:template name="separator">
        <xsl:text>,
</xsl:text>
    </xsl:template>

</xsl:stylesheet>
