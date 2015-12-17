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
  <script>
 $('#btn1').click(function(){
      $('#barcode1').JsBarcode("test");
}); 

  </script>
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
              <h3>You've Thrown an #cfcatch.Type# <b>Error</b></h3> <br>
              Message : #cfcatch.Message#<br>
              Detail : #cfcatch.Detail#<br>
              Please contact website admin if problem persist
            </cfoutput>
            <cfabort>
          </cfcatch>
        </cftry>
       <h1 class="color-terques"> Successful Upload - Container <cfoutput>#session.ecoflexspreadsheetupload.ContainerNo[1]#</cfoutput> </h1>
       <div class="panel">
       <input type="button" id="btn1" value="Bar1" />
<img id="barcode1"/>
       </div>
        <div class="panel-body">
                        <table class="table  table-hover general-table">
                            <thead>
                            <tr>
                                <th>SKU</th>
                                <th class="hidden-phone">Description</th>
                                <th>Quantity</th>
                              
                            </tr>
                            </thead>
                            <tbody>
                           

<cfloop query ="session.ecoflexspreadsheetupload">
  <cfoutput>

                            <tr>
                                <td><a href="">#session.ecoflexspreadsheetupload.Col_1# </a></td>
                                <td class="hidden-phone">#session.ecoflexspreadsheetupload.Col_2#</td>
                                <td><span class="label label-info label-mini">#session.ecoflexspreadsheetupload.Col_3#</span></td>
                              
                                
                           </tr>
                           </cfoutput>

</cfloop>
  
                          

                            </tbody>
                        </table>
                    </div>
        <!--- *************************************** --->
  </div></div></div></section>
</section>
<cfset exists= structdelete(session, 'ecoflexspreadsheetupload', true)/>
<!--- <cfinclude template="/includes/_debug.cfm"> --->
