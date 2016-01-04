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
      INSERT INTO eco_orders (OrderNo, Name, Address1, Address2, City, State, ODate, OZip, email, phone, OStatus, Comments, ShipMethod)
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
						<cfqueryparam value = "PENDING" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.Comments#" cfsqltype="CF_SQL_VARCHAR"/>,
						<cfqueryparam value = "#arguments.ShipMethod#" cfsqltype="CF_SQL_VARCHAR"/>
                     )  
</cfquery> 

<!--- loop pending number of added fields --->
<!--- Inserts order items, from webpage input, loops over dynamically added rows --->
        <cfquery  name="insertorderItemData"> <!--- Doesn't Require a name as I'm only inserting not returning --->
          INSERT INTO eco_order_items (OrderNo, SKU, BriefDesc, Qty, pickStatus)
          VALUES
          <cfloop from="1" to="#listLen(arguments.SKU)#" index="i">
           <cfif i GT 1>
             ,
           </cfif>
           (
            <cfqueryparam value = "#arguments.OrderNo#" cfsqltype="CF_SQL_VARCHAR"/>,
            <cfqueryparam value = "#Trim(listGetAt(arguments.SKU,i))#" cfsqltype="CF_SQL_VARCHAR"/>, <!---this is an values A1,A2--->
            <cfqueryparam value = "#Trim(listGetAt(arguments.BriefDesc,i))#" cfsqltype="CF_SQL_VARCHAR"/>, <!---this is an array values foo1,foo2--->
            <cfqueryparam value = "#Trim(listGetAt(arguments.Qty,i))#" cfsqltype="CF_SQL_SMALLINT"/>,  <!---this is an array values 1,1--->
            <cfqueryparam value = "PICK" cfsqltype="CF_SQL_VARCHAR"/> <!---I want this value on every entry--->
            )
         </cfloop>
        </cfquery>
        </cftransaction>

      <cflocation url="/admin/success.cfm" >
  </cffunction>
</cfcomponent>
	 
