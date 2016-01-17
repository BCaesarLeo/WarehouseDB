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

Upload Order DEBUG
<!--- <cfdump var="#strDir#"> </cfdump> 
<br>
<cfdump var="#strInExcel#"> </cfdump> 
<br>
<cfdump var="file.ServerDirectory"> </cfdump> 
<br>

 --->


 <cfdump var ="#exupl#"></cfdump>


	<!--- 	<cfdump var="#file.ServerDirectory#" label = "server director"> </cfdump>
<cfdump var="#file.ServerFile#" label = "server file"> </cfdump>

<cfset upFileDir=file.ServerDirectory>
      <cfset upNSFile=file.ServerFile>
        <cfset prodThumbExt=file.serverfileext>

 <cffile action="read"
            file="#upFileDir#/#upNSFile#"
            variable="strCSV">

<!--- <cfdump var="#strCSV#" label = "strCSV"> </cfdump> --->

<!--- NEW EXCEL READ --->
<cfspreadsheet action="read" src="#upFileDir#/#upNSFile#" query="ecoxlsxData" excludeHeaderRow = "true">
	

	<cfset ecoxlsquery  = ecoxlsxData/>
<cfdump var="#ecoxlsxData#" label = "ecoxlsxData"> </cfdump>
	<!--- Looks at top for Order No no and trims     --->
<cfset _OrderNo  = #ecoxlsxData["col_4"][4]#/>
<!--- Set date of Registration --->
<cfset _OrderRegDate = "#now()#" />
<!--- Set Name --->
<cfset _OrderDate = #ecoxlsxData["col_5"][4]#/>
<!--- Set Name --->
<cfset _OrderName  = #ecoxlsxData["col_2"][7]#/>
<!--- Set Address--->
<cfset _OrderAddress  = #ecoxlsxData["col_2"][8]#/>
<!--- Set date of Registration --->
<cfset _OrderAddress2  = #ecoxlsxData["col_2"][9]#/>
<!--- Set date of Registration --->
<cfset _OrderShipMethod  = #ecoxlsxData["col_5"][7]#/>

<cfdump var="#_OrderNo#" label = "OrderNo"> </cfdump>
<cfdump var="#_OrderRegDate#" label = "OrderUploadDate"> </cfdump>
<cfdump var="#_OrderDate#" label = "OrderDate"> </cfdump>
<cfdump var="#_OrderName#" label = "OrderName"> </cfdump>
<cfdump var="#_OrderAddress#" label = "OrderAdd"> </cfdump>
<cfdump var="#_OrderAddress#" label = "OrderAdd"> </cfdump>
<cfdump var="#_OrderAddress#" label = "OrderAdd"> </cfdump>

 
<cfloop query="ecoxlsquery" >
      <!----Removes lines which are blank.. then stops if removal is beyond recordcount   --->
      <cfif ecoxlsquery.col_5 is "">
        <cfif ecoxlsquery.CurrentRow lte (ecoxlsquery.RecordCount-2)>
          <cfset ecoxlsquery.RemoveRows((ecoxlsquery.CurrentRow)-1,1)>
            <!---Test  <cfoutput> #session.qResult.Class#</cfoutput>   ---->
            <!--- If name is repeated in column 3- Break out as it's redundant data --->
          </cfif>
        </cfif>
      </cfloop>

     
       <cfdump var ="#ecoxlsquery#"/> --->
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