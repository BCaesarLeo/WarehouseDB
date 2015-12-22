<cfcomponent>
	<!---NOT WORKING CORRECTLY--- I don't have much here but a dump... Need to correctly make vars...--->
	<!--- INIT constructor function --->
	
<!--- method that gets containers inbound and Data --->
<!--- ************************************* --->
<cffunction name="genbarcode" access="public" output="false" returntype="any" hint="Gets Data from Inbound Spreadsheets">
	<!--- Sets Barcode Value if form value has been pressed		 --->
	<cfoutput>
		<script type="text/javascript">
		$("##bcTarget").barcode("#session.ecoflexspreadsheetupload.ContainerNo[1]#", "code128",{barWidth:2, barHeight:120});  
		</script>   
	</cfoutput>

<cfreturn genbarcode>


</cffunction>

<cffunction name="genbarcodes" access="public" output="false" returntype="any" hint="Generates 3 Barcodes from Query">
	<!--- Sets Barcode Value if form value has been pressed		 --->
	<cfscript>
		var qAuditDistinct ="";
	</cfscript>
<cfquery name="qAuditDistinct" maxrows="3">
       SELECT  Distinct DateRcvd, containerno
       FROM Scanned_D8TA_Qry
   ORDER BY DateRcvd DESC
     </cfquery>
<!---      Can delete this loop, as it's not working right trying to generate 3 barcodes --->
<cfloop query="qAuditDistinct">
	<cfoutput>
		<script type="text/javascript">
		$("##bcTarget#currentrow#").barcode("#session.ecoflexspreadsheetupload.ContainerNo##currentrow#", "code128",{barWidth:2, barHeight:120});  
		</script>   
	</cfoutput>
</cfloop>

<!---********************************---->
<cfreturn genbarcodes>


</cffunction>
	</cfcomponent>