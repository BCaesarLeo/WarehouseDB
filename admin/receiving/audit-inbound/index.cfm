<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'audit-inbound'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<cfinclude template="/includes/admin/receiving/_receivingLatestAudit.cfm">

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
	<script src="https://cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.js" type="text/javascript" ></script>
	<script src="/js/_core/inventory/inventoryEditTable.js" type="text/javascript"></script>
</cfsavecontent>



<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>