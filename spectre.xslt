<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- Allows ships to move through other ships, turns ships inside out and reduce mass, increases crew capacity.
	Side effects that may occur are negative rotation; causing uncontrollable rotation; this can be alleviated by switching around blocks/mass.

-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Output root element unaltered -->
<xsl:template match="/*">
<xsl:variable name="name">
	 <xsl:value-of select="name()"/>
</xsl:variable>
 <xsl:element name="{$name}">
	 <xsl:attribute name="accumulateHealth" >
		<xsl:value-of select="'true'"/>
	 </xsl:attribute>
	 <xsl:attribute name="convex" >
		<xsl:value-of select="'false'"/>
	 </xsl:attribute>
<xsl:apply-templates select="node()"/>
   </xsl:element>
</xsl:template>

<!-- center all blocks -->
<xsl:template match="item">
	<item>
		<!--Populate the attributes for the item element with same values.-->
		 <xsl:copy-of select="@*" />
		<block>

  		<xsl:choose>
		  <!--  Dont invert anything for holograms, give them the exact same dimensions.
		  	Hologram	190
			Hologram Edge	191
			Hologram Corner	182
			Hologram Inverted Corner	183
			Hologram Centered Corner	184
		   -->
         <xsl:when test="block/@index = '190' or block/@index =  '191' or block/@index = '182' or block/@index = '183' or block/@index = '184' ">
		 	<!-- debug statement <xsl:attribute name="holo">
			   <xsl:value-of select="'unaltered'"/>
			</xsl:attribute> -->
           <xsl:copy-of select="block/@*[name()='lz' or name()='uz' or name()='lx' or name()='ux' or name()='ly' or name()='uy']" />
         </xsl:when>
         <xsl:otherwise>
             <!-- not a holohgram; always make it inverted on x and y to allow passthrough. -->
			<xsl:attribute name="lx">
			   <xsl:value-of select="block/@ux"/>
			</xsl:attribute>
			<xsl:attribute name="ux">
			   <xsl:value-of select="block/@lx"/>
			</xsl:attribute>
			<xsl:attribute name="ly">
			   <xsl:value-of select="block/@uy"/>
			</xsl:attribute>
			<xsl:attribute name="uy">
			   <xsl:value-of select="block/@ly"/>
			</xsl:attribute>
			
			<!-- now choose whether to also flip stats (by flipping the third access, and thus volume)-->
			<xsl:choose>
			<!-- these blocks are interesting to invert to exploit their usual negative effects as positive ones:
				Stone	4
				Crew Quarters	6
				Armour	8
				Dock	11
				Flight Recorder	16
				Shield Generator	50
				Battery	51
				Stone Edge	185
				Stone Corner	186
				Stone Inverted Corner	187
				Stone Centered Corner	188
				Rich Stone	510
				Rich Stone Edge	511
				Rich Stone Corner	512
				Rich Stone Inverted Corner	513
				Rich Stone Centered Corner	514
			-->
				<xsl:when test="block/@index = '4' or block/@index = '6' or block/@index = '8' or block/@index = '11' or block/@index = '16' or block/@index = '50' or block/@index = '51' or block/@index = '185' or block/@index = '186' or block/@index = '187' or block/@index = '188' or block/@index = '510' or block/@index = '511' or block/@index = '512' or block/@index = '513' or block/@index = '514'">
					<!-- output the block with two negative dimensions, so the volume calculation comes up e.g. as -1*-1*2 = 1; meaning the block works as normal. -->	
					<xsl:attribute name="lz"><xsl:value-of select="block/@uz"/></xsl:attribute>
					<xsl:attribute name="uz"><xsl:value-of select="block/@lz"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
				<!--keep last remaining dimension positive, so we end up with volume that registers as positive. -->
					<xsl:copy-of select="block/@*[name()='lz' or name()='uz']" />
				</xsl:otherwise>
			</xsl:choose>
         </xsl:otherwise>
       </xsl:choose>


		<!--Finally, output the other things the block needs to be happy in XML.-->
		<xsl:copy-of select="block/@*[name()!='lz' and name()!='uz' and name()!='lx' and name()!='ux' and name()!='ly' and name()!='uy']" />

		</block>
	</item>
</xsl:template>


</xsl:stylesheet>
