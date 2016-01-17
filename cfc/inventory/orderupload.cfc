<cfcomponent displayname="excOrderUpload" hint="This is the CFC for my user stuff">  

<cffunction name ="uploaderrors" access="public">
  <cfargument name="userMsg" required="false">
   <cfset arguments.userMsg = "Order Already Exists In Database">
<cfscript>
return arguments;
  </cfscript>
</cffunction>


<cffunction name ="uploadsuccess" access="public">
  <cfargument name="userMsg" required="false">
   <cfset arguments.userMsg = "Order Uploaded Succesfully">
<cfscript>
return arguments;
  </cfscript>
</cffunction>


<cffunction name="saveOrder" access="remote" output="false" returntype="any" hint="">
<cfargument name="SKU" required="true">
<cfargument name="BriefDesc" required="false">
<cfargument name="OrderNo" required="true">
<cfargument name="Name" required="true">
<cfargument name="Address1" required="true">
<cfargument name="Address2" required="false">
<cfargument name="City" required="true">
<cfargument name="State" required="true">
<cfargument name="OZip" required="true">
<cfargument name="email" required="false">
<cfargument name="phone" required="false">
<cfargument name="Qty" required="true">
<cfargument name="Comments" required="false">
<cfargument name="ShipMethod" required="false">
<cfargument name="Bundle" required="false">
<cfargument name="vendor" required="true">
<!--- Set Time of Order to time of post --->
<cfset orderdatetime = createodbcdatetime(now())>
    <cfscript>
      //script version of dump and cfabort
      //writeDump(arguments); // this should have prevQty in it now...then you can have everything you need to write your query in the ARGUMENTS scope
      //abort;
    </cfscript>
    <!--- NOW JUST DO YOUR LOGIC HERE... however it doesn't send over the OLD value... but we can look at stashing the old qty... --->

<!--- checks to see if order is already in database --->
 <cfquery name="ordercheckq" result="ordercheckResult">
      SELECT OrderNo FROM eco_orders
      WHERE   OrderNo = '#arguments.OrderNo#'
 </cfquery>
<!--- Does query return more than 0 results if so stop and reroute --->
<cfif ordercheckResult.Recordcount gt 0>
<cflocation url="/admin/error.cfm" >
<cfabort>
</cfif>


  <cftransaction>
    <cfquery  name="insertData"> <!--- Doesn't Require a name as I'm only inserting not returning --->
      INSERT INTO eco_orders (OrderNo, Name, Address1, Address2, City, State, ODate, OZip, email, phone, OStatus, Comments, ShipMethod, Vendor)
      VALUES(
						<cfqueryparam value = "#arguments.OrderNo#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.Name#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.Address1#" cfsqltype="CF_SQL_VARCHAR"/>,  
						<cfqueryparam value = "#arguments.Address2#" cfsqltype="CF_SQL_VARCHAR"/>,  
						<cfqueryparam value = "#arguments.City#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.State#" cfsqltype="CF_SQL_VARCHAR"/>, 
						<cfqueryparam value = "#orderdatetime#" cfsqltype="CF_SQL_DATE"/>,
						<cfqueryparam value = "#arguments.OZip#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.email#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.phone#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "PICK" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.Comments#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.ShipMethod#" cfsqltype="CF_SQL_VARCHAR"/>,
              <cfqueryparam value = "#arguments.vendor#" cfsqltype="CF_SQL_VARCHAR"/>
                     )  
</cfquery> 

<!--- loop pending number of added fields --->
<!--- Inserts order items, from webpage input, loops over dynamically added rows --->
        <cfquery  name="insertorderItemData"> <!--- Doesn't Require a name as I'm only inserting not returning --->
          INSERT INTO eco_order_items (OrderNo, SKU, BriefDesc, Qty, Bundle, pickStatus )
          VALUES
          <cfloop from="1" to="#listLen(arguments.SKU)#" index="i">
           <cfif i GT 1>
             ,
           </cfif>
           (
            <cfqueryparam value = "#arguments.OrderNo#" cfsqltype="CF_SQL_VARCHAR"/>,
            <cfqueryparam value = "#Trim(listGetAt(arguments.SKU,i))#" cfsqltype="CF_SQL_VARCHAR"/>, <!---this is an values A1,A2--->
            <cfqueryparam value = "#Trim(listGetAt(arguments.BriefDesc,i))#" cfsqltype="CF_SQL_VARCHAR"/>, <!---this is an array values foo1,foo2--->
             <!---this is an array values 1,1--->
             <cfqueryparam value = "#Trim(listGetAt(arguments.Qty,i))#" cfsqltype="CF_SQL_SMALLINT"/>,
            <cfqueryparam value = "#Trim(listGetAt(arguments.Bundle,i))#" cfsqltype="CF_SQL_VARCHAR"/>,
            <cfqueryparam value = "PICK" cfsqltype="CF_SQL_VARCHAR"/> <!---I want this value on every entry--->
            )
         </cfloop>
        </cfquery>
        </cftransaction>
            <cfmail  from = "#application.emailaddress#" 
           subject = "Notice:EcoFlex Order" 
    to = "bdcurtain@gmail.com, fourway@triad.rr.com" 
    password = "#application.emailPassword#" 
    port = "#application.emailPort#"
    replyto = "bdcurtain@gmail.com" 
    server = "#application.emailServer#" 
    username = "ecosrv@fourwaywarehouse.com" >
      
You have been requested to ship #arguments.OrderNo# 
http://ecoflex.fourwaywarehouse.com/admin/orders/pick/
</cfmail>
      <cflocation url="/admin/success.cfm" >
  </cffunction>
            


<!--- NEW FUNCTION THAT GETS UPLOAD FILE, PARSES IT FOR THE DATA  performs a few loops to extract add data and then saves to query --->
<!--- ************************************* --->
<cffunction name="getUploadedData" access="remote" output="false" returntype="any" hint="Gets Data from upload an parses the data into custom format">
  <cfargument name="returnAs" default="query">
  <!--- define temp filelocation --->
<cfset strDir=GetDirectoryFromPath(ExpandPath("*.*")) & "uploads">
  <cfset strInExcel=strDir>
<!--- <cftry> --->
  
    <!--- upload file --->
    <cffile action="Upload"
    filefield="ecoDataFile"
    destination="#strInExcel#"
    nameconflict="Overwrite" >  <!---  nameconflict="Error" >  --->

    <!--- Error Page that outputs cfcache message --->
<!---   <cfcatch>
<cfinclude template="/includes/_error.cfm">

<cfabort>
</cfcatch>
  </cftry> --->

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
<!--- Looks at top for Order No no and trims     --->
<cfset _OrderNo  = #ecoxlsxData["col_6"][4]#/>
<!--- Set date of Registration --->
<cfset _OrderRegDate = "#now()#" />
<!--- Set Name --->
<cfset _OrderDate = #ecoxlsxData["col_7"][4]#/>
<!--- Set Name --->
<cfset _OrderName  = #ecoxlsxData["col_2"][7]#/>
<!--- Set Address--->
<cfset _OrderAddress  = #ecoxlsxData["col_2"][8]#/>
<!--- Set date of Registration --->
<cfset _OrderAddress2  = #ecoxlsxData["col_2"][9]#/>
<!--- Set date of Registration --->
<cfset _OrderShipMethod  = #ecoxlsxData["col_7"][7]#/>
<!--- Set date of Registration --->
<cfset _OrderRandom = #ecoxlsxData["col_5"][8]#/>

<Cfset _OrderZip = Right(#_OrderAddress2#, 5)>

<!----Removes first 8 rows of data which is Title and column headers, and then deletes rows with no entry   --->
 <!---  <cfset ecoxlsquery.RemoveRows(0,8)> --->
 <cfloop query="ecoxlsquery" >
      <!----Removes lines which are blank.. then stops if removal is beyond recordcount   --->
      <cfif ecoxlsquery.col_5 is "">
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
  <cfset str = ecoxlsquery["col_5"][CurrentRow]/>
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


<!--- Make an array which has the Order as the Data --->
<cfset OrderArray = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderArray[CurrentRow] = "#_OrderNo#"> 
</cfloop>


<!--- Add the Container No to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderNo",
    "cf_sql_varchar",
    OrderArray )
     />

<!--- Make an array which has the Date as the Data --->
<cfset OrderRegDateArray = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderRegDateArray[CurrentRow] = "#_OrderRegDate#"> 
</cfloop>



<!--- Add the Date to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderRegDate",
    "CF_SQL_DATE",
    OrderRegDateArray )
     />



     <!--- Make an array which has the Customer Name  --->
<cfset OrderNameArray = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderNameArray[CurrentRow] = "#_OrderName#"> 
</cfloop>



<!--- Add the Customer Name  to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderName",
    "cf_sql_varchar",
    OrderNameArray )
     />

   <!--- Make an array which has the Customer Address  --->
<cfset OrderNameAddress = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderNameAddress[CurrentRow] = "#_OrderAddress#"> 
</cfloop>


<!--- Add the Customer Address  to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderAddress",
    "cf_sql_varchar",
    OrderNameAddress )
     />

      <!--- Make an array which has the Customer Address2  --->
<cfset OrderNameAddress2 = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderNameAddress2[CurrentRow] = "#_OrderAddress2#"> 
</cfloop>


<!--- Add the Customer Address2  to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderAddress2",
    "cf_sql_varchar",
    OrderNameAddress2 )
     />

 <!--- Make an array which has the Shipment Method  --->
<cfset OrderShipMethod = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderShipMethod[CurrentRow] = "#_OrderShipMethod#"> 
</cfloop>


<!--- Add the Shipment Method  to Table. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderShipMethod",
    "cf_sql_varchar",
    OrderShipMethod )
     />

 <!--- Make an array which has the Customer Zip  --->
<cfset OrderZip = ArrayNew(1)> 
 <cfloop  index="CurrentRow" from="#ecoxlsquery.recordCount#" to ="1" step ="-1">
  <cfset OrderZip[CurrentRow] = "#_OrderZip#"> 
</cfloop>


<!--- Add the Customer Zip. --->
<cfset queryAddColumn(
    ecoxlsquery,
    "OrderZip",
    "cf_sql_varchar",
    OrderZip )
     />

<cfreturn ecoxlsquery>


</cffunction>
</cfcomponent>
	 
