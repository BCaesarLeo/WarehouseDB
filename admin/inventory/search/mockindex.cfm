<cfoutput>
<!--- *********************** _header ARGUMENTS ***********************--->
<cfsavecontent variable="extraCSS">
	<link href="/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
	<link href="/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
	<link href="/js/data-tables/DT_bootstrap.css" rel="stylesheet"  />
</cfsavecontent>

<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'inventory-search'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<cfinclude template="/includes/admin/inventory/_inventorySearch.cfm">

<cfoutput></cfoutput>
<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
	<script src="/js/advanced-datatable/js/jquery.dataTables.js" type="text/javascript"></script>
	<script src="/js/data-tables/DT_bootstrap.js" type="text/javascript"></script>
	<script src="/js/_core/inventory/inventorySearchDataTable.js" type="text/javascript"></script>
</cfsavecontent>

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">


<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

<!--- *********************** _DebugScript ***********************--->
<cfinclude template="/includes/chunks/_debug.cfm">
</cfoutput>
