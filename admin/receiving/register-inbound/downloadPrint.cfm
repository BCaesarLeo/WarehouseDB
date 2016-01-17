  <cfinvoke component="cfc.inventory.inventoryService" method="getUploadedData" returnvariable="exupl">
<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'receiving-archive'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">
<!--Barcode Generator--->
<script type="text/javascript" src="/js/jquery-barcode.js"></script>
<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->

<section>
<cfheader name="Content-disposition" value="attachment;filename=ORDER-#FORM.orderID#.pdf"> 
<cfhtmltopdf>
  
    <cfoutput>#FORM.content#</cfoutput> 
</cfhtmltopdf>
  </section>

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->




<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>


