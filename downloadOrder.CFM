<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'inventory'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<cfdump var="#form#">

<section>
	<!--- <cfheader name="Content-disposition" value="attachment;filename=ORDER-#FORM.orderNo#.pdf">
<cfhtmltopdf>
    <cfoutput>#FORM.content#</cfoutput>
</cfhtmltopdf> --->


<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->




<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>