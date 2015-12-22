
<!--- THIS IS THE SAME AS CFINVOKE BELOW --->
<cfset exoinbound = APPLICATION.inventoryAuditObj.getInboundData()>
<cfset exoDisInbound = APPLICATION.inventoryAuditObj.getDistinctInbound()>
<cfset exoAudit = APPLICATION.inventoryAuditObj.getAuditData()>
<cfset exoDisAudit = APPLICATION.inventoryAuditObj.getDistinctAudit()>

<!--- <cfinvoke component="#APPLICATION.inventoryAuditObj#" method="getInboundData" returnvariable="exoinbound">
<cfinvoke component="#APPLICATION.inventoryAuditObj#" method="getDistinctInbound" returnvariable="exoDisInbound">

<cfinvoke component="#APPLICATION.inventoryAuditObj#" method="getAuditData" returnvariable="exoAudit">

<cfinvoke component="#APPLICATION.inventoryAuditObj#" method="getDistinctAudit" returnvariable="exoDisAudit"> --->


<section id="main-content">
      <section class="wrapper">
          <!-- page start-->




  <!------>
  <div class="row">
      <div class="col-lg-12">
          <!--breadcrumbs start -->
          <ul class="breadcrumb">
              <li><a href="../../"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="/admin/receiving/">Receiving Audits</a></li>
              <li class="active">Audit Inbound</li>
          </ul>
          <!--breadcrumbs end -->
      </div>
  </div>
  <div class="row">
      
  </div>
  <div class="row">
      <div class="col-sm-6">
          <section class="panel">
              <header class="panel-heading">
                  Container
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-cog"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                 </span>
              </header>
            <div class="panel-body">
           <form action="index.cfm" method="POST" enctype="multipart/form-data">
          
                <div class="form-group">
                    <label class="col-lg-2 col-sm-2 control-label">Select Container</label>
                    <div class="col-lg-6">

                        <select class="form-control" style="width: 300px"  name="selContainer">
                     <cfloop query="exoDisinbound"><cfoutput>
                     <optgroup label="#DateTimeFormat(exoDisinbound.ContainerRegDate, "full")#">
                           <option value="#exoDisinbound.ContainerNo#">#exoDisinbound.ContainerNo#</option></cfoutput>
                           </optgroup>
                     </cfloop>
                                
                        

                        </select>

                       <!---  Save for later because it has top label over options
                         <select class="form-control" style="width: 300px" id="source">
                            <optgroup label="Alaskan/Hawaiian Time Zone">
                                <option value="AK">Alaska</option>
                                <option value="HI">Hawaii</option>
                            </optgroup>
                            
                        </select> --->
                    </div>
                </div>

          </section>
      </div>
      <div class="col-sm-6">
          <section class="panel">
              <header class="panel-heading">
                  Warehouse Recent Inventory Scans
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-cog"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                 </span>
              </header>
           <div class="panel-body">
          <cfloop query="exoDisAudit">
 <div class="alert alert-info fade in">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i> 
                                </button>
                                 <i class="fa fa-barcode"></i> <strong>Scan</strong><cfoutput>  #DateTimeFormat(exoDisAudit.DateRcvd, "full")# <br> <div id="bcTarget#currentrow#"></div>  #exoDisAudit.containerno#</cfoutput>

                            </div>
         </cfloop>
         <!--- Select Audit Date  --->
               <!---  <div class="form-group">
                   <label class="col-lg-2 col-sm-2 control-label">Select Audit Date</label>
                    <div class="col-lg-6">
                           <select class="form-control" style="width: 300px" name="selDate">
                     <cfloop query="exoDisAudit"><cfoutput>
                           <option value="#exoDisAudit.DateRcvd#">#DateTimeFormat(exoDisAudit.DateRcvd, "full")#</option></cfoutput>
                     </cfloop> --->
                                
                   

                        </select>
                    </div>
                </div>
          </section>
      </div>
  </div>



<div class="row">
         <div class="  col-lg-12"> 
<section class="panel">
<button type="submit" name="ecoSubmit1" class="btn btn-success btn-lg btn-block">Audit Shipment</button>
</section>
</form>
         </div>  

          </div>
          <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Notes</h3>
                        </div>
                        <div class="panel-body">
                            <ul>
                              <li><strong>Shipping Dock to Stock Audit:</strong> Allows the Comparison of a <strong>Packing List</strong>  <strong>Scan Data </strong></li>
                                <li>This report should only be ran once the warehouse has recieved a shipment </li>
                               <li>Select the Container, and Scan Date to compare, and click "AUDIT SHIPMENT" </li>
                               
                                
                            </ul>
                        </div>
                    </div>


        
          <!-- page end-->
      </section>
  </section>
