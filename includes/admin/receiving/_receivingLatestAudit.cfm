    <cfinvoke component="cfc.inventory.inventoryaudit" method="getInboundData" returnvariable="exoinbound">
    <cfinvoke component="cfc.inventory.inventoryaudit" method="getDistinctInbound" returnvariable="exoDisInbound">
<cfinvoke component="cfc.inventory.inventoryaudit" method="getAuditData" returnvariable="exoAudit">
<cfinvoke component="cfc.inventory.inventoryaudit" method="getDistinctAudit" returnvariable="exoDisAudit">

<script>
$(document).ready(function () {
  //your code here
$("#button1").click(function(event){
  alert($(this).prop("value"));
 });
  //your code here
});
  </script>


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
                        <form class="form-horizontal" action="#">
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">Select Container</label>
                                <div class="col-lg-6">

                                    <select class="form-control" style="width: 300px" id="selContainer">
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
                              Warehouse Inventory
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-cog"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>
                          </header>
                       <div class="panel-body">
                        <form class="form-horizontal" action="#">
                            <div class="form-group">
                               <label class="col-lg-2 col-sm-2 control-label">Select Audit Date</label>
                                <div class="col-lg-6">
                                       <select class="form-control" style="width: 300px" id="selDate">
                                 <cfloop query="exoDisAudit"><cfoutput>
                                       <option value="#exoDisAudit.DateRcvd#">#DateTimeFormat(exoDisAudit.DateRcvd, "full")#</option></cfoutput>
                                 </cfloop>
                                            
                               </form>

                                    </select>
                                </div>
                            </div>
                      </section>
                  </div>
              </div>



  <div class="row">
             <div class="  col-lg-12"> 
  <section class="panel">
 <button type="button" id="button1" class="btn btn-success btn-lg btn-block">Audit Shipment</button>
  </section>

             </div>  

              </div>
              <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Notes</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                  <li><strong>Shipping Dock to Stock Audit:</strong> Allows the Comparison of a <strong>Packing List</strong> to a paticular day of <strong>Scan Data </strong></li>
                                    <li>In the event Incorrect Inventory is sent on the packing list, we recommend updating and uploading the spreedsheet using a psudo container no. in the file. </li>
                                   <li>Select the Container, and Scan Date to compare, and click "AUDIT SHIPMENT" </li>
                                   
                                    
                                </ul>
                            </div>
                        </div>


            
              <!-- page end-->
          </section>
      </section>
<cfinclude template="/includes/_debug.cfm">
