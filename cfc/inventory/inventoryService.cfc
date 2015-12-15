<cfcomponent>
	<!--- INIT constructor function --->
	<cffunction name="init" access="public" output="false" returntype="inventoryService">

  	<cfreturn this>

  </cffunction>

  <cffunction name="getAll" access="remote" output="false" returntype="any" hint="">
    <cfargument name="returnAs" default="query">
		<cfargument name="mode" default="search">

  	<cfscript>
	  	var qInventory = "";
	  	var rs = {};
  	</cfscript>

    <cfset var colList = "SKU, MAXDESCRIPTION as Description, CONTAINERNO as Container, sum(INVQTY) as qty, dateRcvd">

    <!--- IF EDIT MODE AND they are an Admin give them extra columns --->
    <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin>
      <cfset colList &= ",edtQty,iisEdited">
    </cfif>

    <!--- IF EDIT MODE give them the buttons was limiting to admin need to give it to all. --->
    <cfif ARGUMENTS.mode eq 'edit'>
      <cfset colList &= ",'<a class=""edit"" href=""##"">Edit</a>' as xEdit, '' as otherActions"> 
    </cfif>


    <cfquery name="qInventory">
      SELECT #preserveSingleQuotes(colList)#
      FROM D8TA 
      group by CONTAINERNO, SKU, MAXDESCRIPTION, dateRcvd,edtQty,iisEdited
    </cfquery>


		<cfscript>
			if ( arguments.returnAs == 'datatables') {
				rs.dt = new cfc.json.DataTables();
				rs.dt.setDataKeys( true );
				rs.dt.setData( qInventory );

				return rs.dt.$renderData();
			} else {
				return qInventory;
			}
		</cfscript>

  </cffunction>

  <cffunction name="saveEdits" access="remote" output="false" returntype="any" hint="">

    <cfscript>
      //script version of dump and cfabort
      writeDump(arguments);  //this should have prevQty in it now...then you can have everything you need to write your query in the ARGUMENTS scope
      abort;
    </cfscript>

    <!--- NOW JUST DO YOUR LOGIC HERE... however it doesn't send over the OLD value... but we can look at stashing the old qty... --->

    <!--- <cfquery>
      INSERT INTO STUFF HERE
    </cfquery> --->


    <cfscript>
      return true;
    </cfscript>

  </cffunction>


<!--- NEW FUNCTION THAT GETS UPLOAD FILE, PARSES IT FOR THE DATA  performs a few loops to extract add data and then saves to query --->
<!--- ************************************* --->
<cffunction name="getUploadedData" access="remote" output="false" returntype="any" hint="Gets Data from upload an parses the data into custom format">
	<cfargument name="returnAs" default="query">
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




 <cfset ecoxlsquery  = ecoxlsxData/>
<!--- Looks at top for container no and trims     --->
<cfset _ContainerNo  = RemoveChars(#ecoxlsquery["col_1"][2]#,1,13)/>
<!--- Set date of Registration --->
<cfset _ContainerRegDate = "#now()#" />



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

<!--- Delete this record when conditions met --->
<cfset ecoxlsquery.removeRows(
JavaCast( "int", (currentRow - 1) ),
JavaCast( "int", 1 )
) /> 
	</cfif></cfif>
</cfloop>


<!--- Make an array which has the containerNo as the Data --->
<cfset ContainerNoArray = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
	<cfset ContainerNoArray[CurrentRow] = "#_ContainerNo#"> 
</cfloop>


<!--- Add the Container No to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "ContainerNo",
    "cf_sql_varchar",
    ContainerNoArray )
     />

<!--- Make an array which has the Date as the Data --->
<cfset ContainerRegDateArray = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
	<cfset ContainerRegDateArray[CurrentRow] = "#_ContainerRegDate#"> 
</cfloop>



<!--- Add the Date to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "ContainerRegDate",
    "CF_SQL_DATE",
    ContainerRegDateArray )
     />


<cfreturn ecoxlsquery>
</cffunction>


</cfcomponent>