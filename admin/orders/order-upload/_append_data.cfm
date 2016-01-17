<!---  attempt to take javascript from index and set it in cfc--- not working
  <cfinvoke component="cfc.inventory.barcode" method="genbarcode" returnvariable="exbar">
 --->
<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <ul class="breadcrumb">
              <li><a href="../../"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="/admin/orders/">Orders</a></li>
              <li class="active">Upload Orders</li>
          </ul>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Order Upload- Step 3 </h3>
          </div>
          <div class="panel-body">

    
<cftry>


  <!--- attempt to catch any errors--->
  <cfloop query="session.ecoflexspreadsheetupload">
    <cfquery name="insertData">
      INSERT INTO  eco_orders (OrderNo, Name, Address1, Address2, Ozip, ODate , OStatus  )
      VALUES('#session.ecoflexspreadsheetupload.OrderNo#','#session.ecoflexspreadsheetupload.OrderName#', '#session.ecoflexspreadsheetupload.OrderAddress#','#session.ecoflexspreadsheetupload.OrderAddress2#','#session.ecoflexspreadsheetupload.OrderZip#', <cfqueryparam value = "#session.ecoflexspreadsheetupload.ORDERREGDATE#" cfsqltype="CF_SQL_DATE"/>, "PICK"
     
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
       <h1 class="color-terques"> Successful Upload - Order <cfoutput>#session.ecoflexspreadsheetupload.OrderNo[1]#</cfoutput> </h1>
       <div class="panel">
        
  <div id="bcTarget"></div> 

  
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
