<!--- Attempt to create Barcodes to be placed on first page --->
<!--- <cfinvoke component="cfc.inventory.barcode" method="genbarcodes" returnvariable="barcodeq">  --->
<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'archive'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">
<script type="text/javascript" src="/js/jquery-barcode.js"></script>

<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<!--- Attempt to serve correct step of upload pending which form submit value is cached. --->
 
<cfif Not structKeyExists(form, 'ecoSubmit1') and Not structKeyExists(form, 'ecoSubmit2')>
	<cfinclude template="/admin/receiving/archive/_inbound.cfm">
<cfelseif structKeyExists(form, 'ecoSubmit1')>
	<cfinclude template="/admin/receiving/archive/_inboundreport.cfm">
<cfelseif structKeyExists(form, 'ecoSubmit2')>
	<cfinclude template="/admin/receiving/audit-inbound/_compareResult2.cfm">
</cfif>


<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
	<script src="https://cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.js" type="text/javascript" ></script>
	<script src="/js/_core/inventory/auditDataTable.js" type="text/javascript"></script>

	<!--Barcode Generator--->

<!--- 	 <cfloop query="barcodeq">
	<cfoutput>
		<script type="text/javascript">
		$("##bcTarget#currentrow#").barcode("#barcodeq.ContainerNo#[#currentrow#]", "code128",{barWidth:2, barHeight:120});  
		</script>   
	</cfoutput>
</cfloop> --->

</cfsavecontent>



<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">
<!--- <cfinclude template="/includes/_debug.cfm"> --->

</cfoutput>