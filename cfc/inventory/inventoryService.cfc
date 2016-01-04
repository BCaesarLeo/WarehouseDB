<cfcomponent>
	<!--- INIT constructor function --->
	<cffunction name="init" access="public" output="false" returntype="inventoryService">

  	<cfreturn this>

  </cffunction>

  <cffunction name="getAll" access="remote" output="false" returntype="any" hint="Data for Inventory Datatable">
    <cfargument name="returnAs" default="query">
		<cfargument name="mode" default="search">

  	<cfscript>
	  	var qInventory = "";
	  	var rs = {};
  	</cfscript>

    <cfset var colList = "SKU, DESCRIPTION, CONTAINERNO as Container,eLocID, sum(Quantity) as qty, dateRcvd">

    <!--- IF EDIT MODE AND they are an Admin give them extra columns This isn't working correctly so named it 1234 cause it won't work--->
    <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin>
      <cfset colList &= ",Max(MostRcntEdit) as mEditDate">
      <!-- A Remove ,EditDate,Notes   removed from "" above--->
    </cfif>

    <!--- IF EDIT MODE give them the buttons was limiting to admin need to give it to all. --->
    <cfif ARGUMENTS.mode eq 'edit'>
      <cfset colList &= ",'<a class=""edit"" href=""##"">Edit</a>' as xEdit, '' as otherActions"> 
    </cfif>

<!--- I had to wrap the query and do this method  http://stackoverflow.com/questions/8370114/ to get where clause to work --->
    <cfquery name="qInventory">
    SELECT
   *
FROM
(
      SELECT #preserveSingleQuotes(colList)#
      FROM HOUSE_D8TA_Q
      <!--- WHERE  SKU LIKE 4151  ---> 
      <!--- WHERE (Sum(Quantity) = 0)--->
      group by CONTAINERNO, SKU, DESCRIPTION, dateRcvd, eLocID
)
as Innertable
WHERE qty <> 0
   </cfquery>


<!---   A REMOVE <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin> <cfoutput>,EditDate,eLocID</cfoutput><cfif> --->
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


<cffunction name="getAllw0" access="remote" output="false" returntype="any" hint="Data for Edit Datatable">
    <cfargument name="returnAs" default="query">
    <cfargument name="mode" default="search">

    <cfscript>
      var qInventory = "";
      var rs = {};
    </cfscript>

    <cfset var colList = "SKU, DESCRIPTION, CONTAINERNO as Container, sum(Quantity) as qty, dateRcvd">

    <!--- IF EDIT MODE AND they are an Admin give them extra columns This isn't working correctly so named it 1234 cause it won't work--->
    <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin>
      <cfset colList &= ",Max(MostRcntEdit) as mEditDate,eLocID">
      <!-- A Remove ,EditDate,Notes   removed from "" above--->
    </cfif>

    <!--- IF EDIT MODE give them the buttons was limiting to admin need to give it to all. --->
    <cfif ARGUMENTS.mode eq 'edit'>
      <cfset colList &= ",'<a class=""edit"" href=""##"">Edit</a>' as xEdit, '' as otherActions"> 
    </cfif>

<!--- I had to wrap the query and do this method  http://stackoverflow.com/questions/8370114/ to get where clause to work --->
    <cfquery name="qInventory">
      SELECT #preserveSingleQuotes(colList)#
      FROM HOUSE_D8TA_Q
      <!--- WHERE  SKU LIKE 4151  ---> 
      <!--- WHERE (Sum(Quantity) = 0)--->
      group by CONTAINERNO, SKU, DESCRIPTION, dateRcvd, eLocID
   </cfquery>


<!---   A REMOVE <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin> <cfoutput>,EditDate,eLocID</cfoutput><cfif> --->
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
      writeDump(arguments); // this should have prevQty in it now...then you can have everything you need to write your query in the ARGUMENTS scope
      //abort;
    </cfscript>
    <!--- NOW JUST DO YOUR LOGIC HERE... however it doesn't send over the OLD value... but we can look at stashing the old qty... --->
<cftry>
  

    <cfquery  name="insertData"> <!--- Doesn't Require a name as I'm only inserting not returning --->
      INSERT INTO House_D8TA (SKU, ContainerNo,  dateRcvd, Quantity, PREVQTY, EditDate, NueQty, eLocID)
      VALUES(<cfqueryparam value = "#arguments.SKU#" cfsqltype="CF_SQL_VARCHAR"/>,
        <cfqueryparam value = "#arguments.Container#" cfsqltype="CF_SQL_VARCHAR"/>,
        <cfqueryparam value = "#arguments.DATERCVD#" cfsqltype="CF_SQL_DATE"/>,  
        <cfqueryparam value = "#arguments.diffnQty#" cfsqltype="CF_SQL_SMALLINT"/>,  
           <cfqueryparam value = "#arguments.PREVQTY#" cfsqltype="CF_SQL_SMALLINT"/>,
         <cfqueryparam value = "#Now()#" cfsqltype="CF_SQL_DATE"/>,
         <cfqueryparam value = "#arguments.Qty#" cfsqltype="CF_SQL_SMALLINT"/>,
         <cfqueryparam value = "#arguments.eLocID#" cfsqltype="CF_SQL_VARCHAR"/>
                     )  </cfquery> 
<cfcatch>
  <cflocation url="/admin/error.cfm" >
</cfcatch>
</cftry>

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
<cftry>
  
    <!--- upload file --->
    <cffile action="Upload"
    filefield="ecoDataFile"
    destination="#strInExcel#"
    nameconflict="Error" > 

    <!--- Error Page that outputs cfcache message --->
  <cfcatch>
<cfinclude template="/includes/_error.cfm">

<cfabort>
</cfcatch>
  </cftry>

    <cfset upFileDir=file.ServerDirectory>
      <cfset upNSFile=file.ServerFile>
        <cfset prodThumbExt=file.serverfileext>
          <cfif (prodThumbExt neq "xlsx")>
         
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
  <!--- added checks to see if also E is first or 3 --->
 	<cfif Not str.startsWith("4") and Not str.startsWith("E4") and Not str.startsWith("E5") and Not str.startsWith("E6") and Not str.startsWith("E7") and  Not str.startsWith("3")>

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


<!--- Testing function --->

<cffunction name="getInnbound" access="remote" output="false" returntype="any" hint="">
   <cfargument name="searchPhrase" />
   <!--- Scope Define variables  --->
<cfset var getInq = "">
<cfset var getInquArray = arrayNew(1) />

  <cfquery name="getInq" maxrows="5">
    SELECT SKU, MaxDescription
    FROM masterinventory
    WHERE     LOWER(SKU) LIKE <cfqueryparam cfsqltype='cf_sql_varchar' value="%#LCASE(arguments.searchPhrase)#%" />
    ORDER BY  SKU
  </cfquery>




<!--- Build result array --->
<cfloop query="getInq">
<cfset returnStruct = StructNew() />
<cfset returnStruct["label"] = SKU/>
<cfset returnStruct["value"] = MaxDescription />

<cfset ArrayAppend(getInquArray,returnStruct) />
</cfloop>
       
   <cfreturn serializeJSON(getInquArray) />
     
</cffunction>
</cfcomponent>