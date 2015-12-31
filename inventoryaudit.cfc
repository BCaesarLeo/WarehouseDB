<cfcomponent>
	<!--- INIT constructor function --->
	
<!--- method that gets containers inbound and Data --->
<!--- ************************************* --->
<cffunction name="getInboundData" access="remote" output="false" returntype="any" hint="Gets Data from Inbound Spreadsheets">
	<cfargument name="returnAs" default="query">

<!--- Scope variables  --->
<cfset var qInboundData = "">
<!--- cfquery =name "qInboundData" datasource="db10" - Doesn't need datasource as it's defined in application --->
<cfquery name="qInboundData">

       SELECT SKU, description, containerno, sum(Quantity) as qty, ContainerRegDate 
       FROM Inbound_D8TA
       group by containerno, SKU, description, ContainerRegDate 
     </cfquery>

<cfreturn qInboundData>


</cffunction>

<!--- method that gets distinct containers Name inbound --->
<cffunction name="getDistinctInbound" access="remote" output="false" returntype="any" hint="Gets Distinct Container">
  <cfargument name="returnAs" default="query">
  <!--- Scope variables  --->
<cfset var qInboundDistinct = "">
<cfquery name="qInboundDistinct">
       SELECT  containerno, CONTAINERREGDATE
       FROM Inbound_D8TA
       group by containerno, CONTAINERREGDATE
       ORDER BY CONTAINERREGDATE DESC
     </cfquery>


<cfreturn qInboundDistinct>
 </cffunction>


<!--- method that gets Audit scan Data  --->
<cffunction name="getAuditData" access="remote" output="false" returntype="any" hint="Gets Data from Audit Scan">
  <cfargument name="returnAs" default="query">
    <!--- Scope variables  --->
<cfset var qAuditD8TA = "">
<cfquery name="qAuditD8TA">
       SELECT  Scanned_SKU,  MaxDescription, containerno, Inbound_Qty, QtyAudit
       FROM Audit_D8TA_Qry
     
     </cfquery>


<cfreturn qAuditD8TA>
 </cffunction>



<!--- method that gets Audit scan Data  --->
<cffunction name="getDistinctAudit" access="remote" output="false" returntype="any" hint="Gets Distinct Audit Date">
  <cfargument name="returnAs" default="query">
 <!--- Scope variables  --->
<cfset var qAuditDistinct= "">
<!--- Only show 3 results as It's just html --->
<cfquery name="qAuditDistinct" maxrows="3">
       SELECT  Distinct DateRcvd, containerno
       FROM Scanned_D8TA_Qry
   ORDER BY DateRcvd DESC
     </cfquery>


<cfreturn qAuditDistinct>
 </cffunction>







<cffunction name="getcompareAudit" access="remote" output="false" returntype="any" hint="Compares Upload to Scanned">
 
    <cfargument name="returnAs" default="query">
    <cfargument name="mode" default="search">
    <cfargument name="selContainer" required="true" />

    <cfscript>
      var qInventory = "";
      var rs = {};
    </cfscript>

 

  <cfquery name="qInventory">
      SELECT  Scanned_SKU, MaxDESCRIPTION, CONTAINERNO, QtyAudit, Inbound_Qty, DateRcvd
      FROM Audit_D8TA_Qry
      WHERE QtyAudit <> 0 
      AND  CONTAINERNO = <cfqueryparam value="#trim(ARGUMENTS.selContainer)#" cfsqltype="cf_sql_varchar" />
   </cfquery>


<!---   A REMOVE <cfif ARGUMENTS.mode eq 'edit' AND SESSION.auth.isAdmin> <cfoutput>,EditDate,Notes</cfoutput><cfif> --->
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


  <cffunction name="getInbound" access="remote" output="false" returntype="any" hint="Get Container">
  <cfargument name="returnAs" default="query">
  <!--- Scope variables  --->
<cfset var qInbound = "">
<cfquery name="qInbound">
       SELECT  SKU, containerno, CONTAINERREGDATE, Quantity, Description
       FROM Inbound_D8TA
       group by SKU, containerno, CONTAINERREGDATE, Description
       ORDER BY SKU DESC
     </cfquery>


<cfreturn qInbound>
 </cffunction>


<!--- Method that gets Data where argument passed in matches Containerno --->
<cffunction name="getInboundDatabyContainer" access="remote" output="false" returntype="any" hint="Gets Data from Inbound Spreadsheets">
  <cfargument name="returnAs" default="query">
<cfargument name="finputcontainer" required="false" default="containerno">
<!--- Scope variables  --->
<cfset var qInboundDataContainer = "">
<!--- cfquery =name "qInboundData" datasource="db10" - Doesn't need datasource as it's defined in application --->
<cfquery name="qInboundDataContainer">

       SELECT SKU, description, containerno, sum(Quantity) as qty, ContainerRegDate 
       FROM Inbound_D8TA
       group by containerno, SKU, description, ContainerRegDate 
       WHERE #arguments.finputcontainer# = Containerno
     </cfquery>

<cfreturn qInboundDataContainer>


</cffunction>
</cfcomponent>