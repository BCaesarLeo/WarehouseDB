<cfcomponent>

<cffunction name="getOrders" access="remote" output="false" returntype="any" hint="Gets Orders from Database">
  <!--- Scope variables  --->
<cfset var qOrders = "">
<cfquery name="qOrders">
       SELECT   OrderNo, Name, Address1, Address2, City, State, ODate, OZip, email, phone, OStatus, Comments, ShipMethod
       FROM eco_orders
       group by OrderNo
       ORDER BY ODate DESC
     </cfquery>

<cfreturn qOrders>
 </cffunction>


 <cffunction name="getorderstable" access="remote" output="false" returntype="any" hint="">
    <cfargument name="returnAs" default="query">
		<cfargument name="mode" default="search">

  	<cfscript>
	  	var qInventory = "";
	  	var rs = {};
  	</cfscript>

    <cfset var colList = "OrderNo, Name, Address1, Address2, City, State, ODate, OZip, email, phone, OStatus, Comments, ShipMethod">

    <!--- IF EDIT MODE AND they are an Admin give them extra columns This isn't working correctly so named it 1234 cause it won't work--->
    <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin>
      <cfset colList &= ",Max(MostRcntEdit) as mEditDate">
      <!-- A Remove ,EditDate,Notes   removed from "" above--->
    </cfif>

    <!--- IF EDIT MODE give them the buttons was limiting to admin need to give it to all. --->
    <cfif ARGUMENTS.mode eq 'edit'>
      <cfset colList &= ",'<a class=""edit"" href=""##"">Edit</a>' as xEdit, '' as otherActions"> 
    </cfif>


    <cfquery name="qInventory">
      SELECT #preserveSingleQuotes(colList)#
      FROM order_d8ta

         group by OrderNo
        
        
   
    </cfquery>


<!---   A REMOVE <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin> <cfoutput>,EditDate,elocid</cfoutput><cfif> --->
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



<cffunction name="getorderitemstable" access="remote" output="false" returntype="any" hint="">
    <cfargument name="returnAs" default="query">
    <cfargument name="mode" default="search">

    <cfscript>
      var qInventory = "";
      var rs = {};
    </cfscript>

    <cfset var colList = "OrderNo, SKU, BriefDesc, Qty, pickstatus, picktime">

    <!--- IF EDIT MODE AND they are an Admin give them extra columns This isn't working correctly so named it 1234 cause it won't work--->
    <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin>
      <cfset colList &= ",Max(MostRcntEdit) as mEditDate">
      <!-- A Remove ,EditDate,Notes   removed from "" above--->
    </cfif>

    <!--- IF EDIT MODE give them the buttons was limiting to admin need to give it to all. --->
    <cfif ARGUMENTS.mode eq 'edit'>
      <cfset colList &= ",'<a class=""edit"" href=""##"">Edit</a>' as xEdit, '' as otherActions"> 
    </cfif>



    <cfquery name="qInventory">
      SELECT #preserveSingleQuotes(colList)#
      FROM order_d8ta

         group by OrderNo
        
        
   
    </cfquery>


<!---   A REMOVE <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin> <cfoutput>,EditDate,elocid</cfoutput><cfif> --->
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
	</cfcomponent>