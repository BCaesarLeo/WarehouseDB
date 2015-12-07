<cfcomponent>
	<!--- INIT constructor function --->
	<cffunction name="init" access="public" output="false" returntype="inventoryService">

  	<cfreturn this>

  </cffunction>

  <cffunction name="getAll" access="remote" output="false" returntype="any" hint="">
		<cfargument name="returnAs" default="query">

  	<cfscript>
	  	var qInventory = "";
	  	var rs = {};
  	</cfscript>

		<cfquery name="qInventory" datasource="db10">
			SELECT SKU, description, container, sum(Quantity) as qty, dateRcvd
			FROM D8Ta 
			group by container, SKU, description, dateRcvd
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


</cfcomponent>