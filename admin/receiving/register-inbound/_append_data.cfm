<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Shipment Manifest Upload- Step 3 </h3>
          </div>
          <div class="panel-body">
    
<cftry>
  <!--- attempt to catch any errors--->
  <cfloop query="session.ecoflexspreadsheetupload">
    <cfquery datasource="db10" name="insertData">
      INSERT INTO Inbound_D8TA (SKU, Description, Quantity, ContainerNo, ContainerRegDate   )
      VALUES('#session.ecoflexspreadsheetupload.Col_1#','#session.ecoflexspreadsheetupload.Col_2#', '#session.ecoflexspreadsheetupload.Col_3#','#session.ecoflexspreadsheetupload.CONTAINERNO#', <cfqueryparam value = "#session.ecoflexspreadsheetupload.CONTAINERREGDATE#" cfsqltype="CF_SQL_DATE"/>
     
              )
            </cfquery>
          </cfloop>

          <!--- attempt to catch any errors continued--->
          <cfcatch type="any">
            <cfoutput>
              <h3>You've Thrown a #cfcatch.Type# Upload <b>Error</b></h3> <br>
              Message : #cfcatch.Message#<br>
              Detail : #cfcatch.Detail#<br>
              Please contact website admin if problem persist
            </cfoutput>
          </cfcatch>
        </cftry>
        <!--- *************************************** --->
  </div></div></div></section>
</section>
