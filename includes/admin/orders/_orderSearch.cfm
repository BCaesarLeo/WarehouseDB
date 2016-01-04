<!--- <cfinvoke component="cfc.inventory.orders" method="getOrders" returnvariable="ecoOrders">
 --->


<!--main content start-->
<section id="main-content" >
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="/admin/dashboard"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="/admin/Orders/">Orders</a></li>
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
	            Order Search <div class="pull-right"><strong></strong> (<span id="inventoryTotal1" class="alert-success"></span> )</div>
	        </header>
	        <div class="panel-body">
	          <div class="adv-table">
	            <table  class="display table table-bordered table-hover table-striped " id="dynamic-table">
	            	<thead>
			            <tr>
			            	<th>Order Date</th>
			                <th>Order No.</th>
			                <th>Status</th>
							<th>Name</th>
							<th>Address</th>
							<th class="hidden-phone">City</th>
							<th class="hidden-phone">State</th>
							<th class="hidden-phone">Zip</th>
							<th class="hidden-phone">Email</th>
							<th class="hidden-phone">Phone</th>
			            </tr>
	            	</thead>
		            <tfoot>
			            <tr>
			                <th>Order Date</th>
			                <th>Order No.</th>
			                <th>Status</th>
							<th>Name</th>
							<th>Address</th>
							<th class="hidden-phone">City</th>
							<th class="hidden-phone">State</th>
							<th class="hidden-phone">Zip</th>
							<th class="hidden-phone">Email</th>
							<th class="hidden-phone">Phone</th>
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