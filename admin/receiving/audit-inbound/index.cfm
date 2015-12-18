<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'audit-inbound'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<!--- Attempt to serve correct step of upload pending which form submit value is cached. --->
 
<cfif Not structKeyExists(form, 'ecoSubmit1') and Not structKeyExists(form, 'ecoSubmit2')>
<cfinclude template="/includes/admin/receiving/_receivingLatestAudit.cfm">
<cfelseif structKeyExists(form, 'ecoSubmit1')>
<cfinclude template="/admin/receiving/register-inbound/_verify_data.cfm">
<cfelseif structKeyExists(form, 'ecoSubmit2')>
<cfinclude template="/admin/receiving/register-inbound/_append_data.cfm">
</cfif>


<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
	<script src="https://cdn.datatables.net/s/bs/dt-1.10.10/datatables.min.js" type="text/javascript" ></script>
	<script src="/js/_core/inventory/inventoryEditTable.js" type="text/javascript"></script>
</cfsavecontent>



<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>