
<!--- THIS IS THE SAME AS CFINVOKE BELOW --->
<cfset exoinbound = APPLICATION.inventoryAuditObj.getInboundData()>
<cfset exoDisInbound = APPLICATION.inventoryAuditObj.getDistinctInbound()>
<!--- <cfset exoinboundcontainer = APPLICATION.inventoryAuditObj.getInboundDatabyContainer()> --->

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
              <li><a href="/admin/receiving/archive/">Inbound Archive</a></li>
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
                    <label class="col-lg-12 col-sm-2 control-label">Select Container</label>
                    <div class="col-lg-12">

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
      
  </div>



<div class="row">
         <div class="  col-lg-12"> 
<section class="panel">
<button type="submit" name="ecoSubmit1" class="btn btn-success btn-lg btn-block">Inbound Data</button>
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
