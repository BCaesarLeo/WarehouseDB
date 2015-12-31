<cfset exoinboundcontainer = APPLICATION.inventoryAuditObj.getInboundDatabyContainer()>
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
         
          <cfdump var ="#exoinboundcontainer#">

          </section>
      </div>
      
  </div>



<div class="row">
         <div class="  col-lg-12"> 
<section class="panel">
<button type="submit" name="ecoSubmit1" class="btn btn-success btn-lg btn-block">Inbound Data</button>
</section>

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
