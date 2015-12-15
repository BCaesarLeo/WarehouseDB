<!--main content start-->
<section id="main-content" >
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="/admin/dashboard"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="/admin/inventory/">Inventory</a></li>
					<li class="active">Search</li>
				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		
		<!--- INVENTORY TABLE--->
		<div class="row">
	    <div class="col-sm-12">
	      <section class="panel">
	        <header class="panel-heading">
	            Inventory Search <div class="pull-right"><strong>Total Qty On Hand</strong> (<span id="inventoryTotal" class="alert-success"></span> )</div>
	        </header>
	        <div class="panel-body">
	          <div class="adv-table">
	            <table  class="display table table-bordered table-striped" id="dynamic-table">
	            	<thead>
			            <tr>
			                <th>SKU No.</th>
							<th>Description</th>
							<th>Container</th>
							<th class="hidden-phone">Quantity</th>
							<th class="hidden-phone">Date Recvd</th>
			            </tr>
	            	</thead>
		            <tfoot>
			            <tr>
			                <th>SKU No.</th>
						    <th>Description</th>
						    <th>Container</th>
						     <th colspan="" style="text-align:right">Qty:</th>
						    <th colspan="" ></th>
			            </tr>
		            </tfoot>
	            </table>
	          </div>
	        </div>
	      </section>
	    </div>
	</div>
	</section>
</section>
<!--- *********************** _DebugScript ***********************--->
<!--- <cfinclude template="/includes/_debug.cfm"> --->