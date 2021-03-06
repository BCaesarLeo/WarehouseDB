
<cfoutput>
	<!--- *********************** _header ARGUMENTS ***********************--->
<cfsavecontent variable="extraCSS">
	<link href="//cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.css" rel="stylesheet" type="text/css" />
	<link href="/js/advanced-datatable/css/demo_page.css" rel="stylesheet" type="text/css"  />
	<link href="/js/advanced-datatable/css/demo_table.css" rel="stylesheet" type="text/css"  />
</cfsavecontent>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'inventory-edit'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<cfif arrayFindNoCase( SESSION.auth.roles, 'admin')>  
<cfinclude template="/includes/admin/inventory/_inventoryEdit.cfm">
	<cfelse>
    <cflocation addtoken="no" url="/admin?accessDenied=1">
</cfif>
<!--- <cflocation addtoken="no" url="/admin?accessDenied=1" /> --->


<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->

<cfsavecontent variable="extraJS">
	<!--- LOAD IN DATATABLES BASICS --->
	<script src="https://cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.js" type="text/javascript" ></script>
	<script src="//cdn.datatables.net/buttons/1.1.0/js/dataTables.buttons.min.js" type="text/javascript" ></script>
	<script src="//cdn.datatables.net/select/1.1.0/js/dataTables.select.min.js" type="text/javascript" ></script>

	<!--- YOUR DATA TABLES DEFINITION --->
	<script src="/js/_core/inventory/inventoryEditDataTable.js" type="text/javascript"></script>
	<!-- END JAVASCRIPTS -->

</cfsavecontent>
<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">
<!--- <cfinclude template="/includes/_debug.cfm"> --->
</cfoutput>
