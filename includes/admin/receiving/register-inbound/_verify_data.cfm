
<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Shipment Manifest Upload- Step 2  *Verify Data</h3>
          </div>
          <div class="panel-body">
		


<!--- <cfoutput>  #form.ecoDataFile# </cfoutput> --->

<!--- define temp filelocation --->
<cfset strDir=GetDirectoryFromPath(ExpandPath("*.*")) & "file_uploads">
  <cfset strInExcel=strDir>

    <!--- upload file --->
    <cffile action="Upload"
    filefield="ecoDataFile"
    destination="#strInExcel#"
    nameconflict="Overwrite" >
    <cfset upFileDir=file.ServerDirectory>
      <cfset upNSFile=file.ServerFile>
        <cfset prodThumbExt=file.serverfileext>
          <cfif (prodThumbExt neq "xlsx")>
            Please Correct 
            .xlsx file only
            <cfabort>
            </cfif>
  <cffile action="read"
            file="#upFileDir#/#upNSFile#"
            variable="strCSV">


<!--- NEW EXCEL READ --->
<cfspreadsheet action="read" src="#upFileDir#/#upNSFile#" query="ecoxlsxData" excludeHeaderRow = "true">
  <!--- NEW EXCEL READ --->

<!--- NEW EXCEL READ --->
<cfspreadsheet action="read" src="#upFileDir#/#upNSFile#" query="ecoxlsxDataextract"   excludeHeaderRow = "true">
  <!--- NEW EXCEL READ --->

 <cfset ecoxlsquery  = ecoxlsxData/>
<!--- Looks at top for container no and trims     --->
<cfset _ContainerNo  = RemoveChars(#ecoxlsquery["col_1"][2]#,1,13)/>



<!----Removes first 8 rows of data which is Title and column headers, and then deletes rows with no entry   --->
 <!---  <cfset ecoxlsquery.RemoveRows(0,8)> --->
 <cfloop query="ecoxlsquery" >
      <!----Removes lines which are blank.. then stops if removal is beyond recordcount   --->
      <cfif ecoxlsquery.col_1 is "">
        <cfif ecoxlsquery.CurrentRow lte (ecoxlsquery.RecordCount-2)>
          <cfset ecoxlsquery.RemoveRows((ecoxlsquery.CurrentRow)-1,1)>  
            <!---Test  <cfoutput> #session.qResult.Class#</cfoutput>   ---->
          </cfif>
        </cfif>
      </cfloop>

 <!--- Removes 8 rows  --->
<!---  <cfset ecoxlsquery.RemoveRows(0,8)> --->


<!--- removes any row that doesn't start with 4 in the SKU --->
<!--- loop backwards to prevent index being out of bounds --->
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
 	<cfset str = ecoxlsquery["col_1"][CurrentRow]/>
 	<!--- This is the code that finds if it starts with 4 --->
 	<cfif Not str.startsWith("4")>

	 	<!--- Ensure record not 0--->
<cfif (ecoxlsquery.recordCount NEQ 0)>
<!--- Delete this record. --->
<!--- Works perfect --->
<cfset ecoxlsquery.removeRows(
JavaCast( "int", (currentRow - 1) ),
JavaCast( "int", 1 )
) /> 
	</cfif></cfif>
</cfloop>


                               <cftable query = "ecoxlsquery"  colheaders="yes" htmlTable="true" 
  startRow = "1" colSpacing = "3" > 
<!--- Each cfcol tag sets width of a column in table, and specifies header 
  information and text/CFML with which to fill cell. ---> 
 <!---  <cfcol header = "Item No" 
  align = "Left" 
  width = 6 
  text= "#ecoxlsquery.ITEM NO.#">  --->

  <cfcol header = "SKU"     
  align = "Left" 
  width = 6 
  text= "#ecoxlsquery.col_1#"> 

  <cfcol header = "Description" 
  align = "Left" 
  width = 15 
  text= "#ecoxlsquery.col_2#"> 
  <cfcol header = "Quantity" 
  align = "Left" 
  width = 5
  text= "#ecoxlsquery.col_3#">

</cftable> 
<!--- *************************************** --->
	</div></div></div></section>
</section>