<!--- <cfinvoke component="cfc.inventory.inventoryaudit" method="getcompareAudit" returnvariable="AuditD8TA" >
	<cfinvokeargument name="selContainer" value="#FORM.selContainer#" />
	</cfinvoke> --->
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
			<div class="  col-lg-12"> 
				<section class="panel">
					<header class="panel-heading">
						Audit Data
						<span class="tools pull-right">
							<a href="javascript:;" class="fa fa-chevron-down"></a>
							<a href="javascript:;" class="fa fa-cog"></a>
							<a href="javascript:;" class="fa fa-times"></a>
						</span>
					</header>
					<div class="panel-body">

						<div class="form-group">
							<label class="col-lg-2 col-sm-2 control-label">Report</label>
							<div class="col-lg-6">
								
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="  col-lg-12"> 
				<section class="panel">
				<!--- INVENTORY TABLE--->
		<div class="row">
	    <div class="col-sm-12">
	      <section class="panel">
	        <header class="panel-heading">
	           Audit Data <div class="pull-right"><strong>Total Qty On Hand</strong> (<span id="inventoryTotal" class="alert-success"></span> )</div>
	        </header>
	        <div class="panel-body">
	          <div class="adv-table">
	            <table  class="display table table-bordered table-hover table-striped " id="audit-table" 
	            		<cfoutput>data-selcontainer="#FORM.selContainer#"</cfoutput>>
	            	<thead>
			            <tr>
			                <th>SKU No.</th>
							<th>Description</th>
							<th>Container</th>
							<th class="hidden-phone">Over/Under Amount</th>
							<th class="hidden-phone">Date Scanned</th>
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
			</div>  
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Notes</h3>
			</div>
			<div class="panel-body">
				<ul>
					<li><strong>Shipping Dock to Stock Audit:</strong> Allows the Comparison of a <strong>Packing List</strong> to stock scanned in with corresponding  <strong>Container </strong></li>
					
					<li>Select the Container and click "AUDIT SHIPMENT" </li>


				</ul>
			</div>
		</div>
<!-- page end-->
	</section>
</section>
