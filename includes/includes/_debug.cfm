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

<cfdump var="#strDir#"> </cfdump> 
<br>
<cfdump var="#strInExcel#"> </cfdump> 
<br>
<cfdump var="file.ServerDirectory"> </cfdump> 
<br>
<cfif isDefined("ecoxlsxData")>

	

	<cfdump var="#ecoxlsxDataextract#" label = "ecoxlsxDataextract" > </cfdump>

	<!--- 	<cfdump var="#ecoxlsquery#" label = "ecoxlsquery"> </cfdump> --->
	<!---  <cfdump var="#ecoxlsquery["ITEM NO."][1]#" label = "Item 1 ecoxlsquery"> </cfdump> --->

	<!--- <cfdump var="#_ContainerNo#"> </cfdump> --->


</cfif>

<!--- *************************************** --->

</div>
</div>
</div>
</div>
<!--- *************************************** --->

</section>