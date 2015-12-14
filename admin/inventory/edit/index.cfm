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
<cfinclude template="/includes/admin/inventory/_inventoryEdit.cfm">

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->

<cfsavecontent variable="extraJS">
	<script src="https://cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.js" type="text/javascript" ></script>
	<script src="/js/_core/inventory/inventorySearchDataTable.js" type="text/javascript"></script>
	<script src="/js/table-editable.js"></script>
	<!-- END JAVASCRIPTS -->

</cfsavecontent>
<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>
