	<!--- css needed to keep other css from overlapping errors --->
	<!--- *************************************** --->
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Debug Page</h3>
					</div>
					<div class="panel-body">
						<!--- *************************************** --->

						<!--- Common Debug Scripts for this app. Saved for quick dumps  --->
	<!--- <cfdump var="#application#"> </cfdump> 
--->

	<!---  <cfdump var="#qInventory#"> </cfdump> 
--->	

<!--- FIlE SAVING LOCATION INVENTORYSERVICE CFC
<cfdump var="#strDir#"> </cfdump> 
<br>
<cfdump var="#strInExcel#"> </cfdump> 
<br>
<cfdump var="file.ServerDirectory"> </cfdump> 
<br>
<cfif isDefined("ecoxlsxData")>

 --->

<!--- 
 <cfdump var ="#session#"></cfdump> --->

	<!--- 	<cfdump var="#ecoxlsquery#" label = "ecoxlsquery"> </cfdump> --->
	<!---  <cfdump var="#ecoxlsquery["ITEM NO."][1]#" label = "Item 1 ecoxlsquery"> </cfdump> --->

	<!--- <cfdump var="#_ContainerNo#"> </cfdump> --->



<!--- create a dummy query using queryNew --->
<!--- <cfquery name="sInventory" datasource="db10">
    SELECT * FROM D8TA 
</cfquery>
<cfset writeDump(sInventory)>


	<cfquery name="qInventory" datasource="db10">
			SELECT SKU, MAXDESCRIPTION as Description, CONTAINERNO as Container, sum(INVQTY) as qty, dateRcvd
			FROM D8TA 
			group by CONTAINERNO, SKU, MAXDESCRIPTION, dateRcvd
		</cfquery>
		<cfset writeDump(qInventory)> --->
<!--- *************************************** --->
<!--- 	inventory audit cfc dumps
<cfdump var="#exoinbound#"> </cfdump> 
<cfdump var="#exoDisinbound#"> </cfdump> 
<cfdump var="#exoAudit#"> </cfdump>  --->

<!--- working barcode! --->





<!--- 	<cfdump var="#exoDisInbound#"> --->

	<!--- orderEntry Error Testing --->
<!--- List Length --->



</div>
</div>
</div>
</div>
<!--- *************************************** --->

</section>