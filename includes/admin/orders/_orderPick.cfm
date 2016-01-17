  <cfinvoke component="cfc.inventory.orders" method="getPickOrders" returnvariable="ecopick">
<!--main content start-->
<section id="main-content" >
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="/admin/dashboard"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="/admin/inventory/">Inventory</a></li>
					<li class="active">Dashboard</li>
				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		
		<!--- INVENTORY NOTIFICATIONS --->
		<!--- <cfhtmltopdf> --->
			<!--- <cfloop index="CurrentRow" from ="#ecopick.recordCount#" to ="1" step ="-1">
				
						<cfoutput>
		
                                        Order #CurrentRow#
                                <span class="tools pull-right">
                                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                                    <a class="fa fa-cog" href="javascript:;"></a>
                                    <a class="fa fa-times" href="javascript:;"></a>
                                </span>
                                    </div>
                                    <div class="panel-body">
                                    	<h3> Order No. #ecopick.orderno[CurrentRow]#</h3>
                                    	<div id="theOrder" style="">
                                        <div class="barcodeDsp" data-barcodeval="#ecopick.orderno[CurrentRow]#" data-barcodetype="order"></div>
                                    </div></div>
                                    <div class="well well-large">
                                    <h4>SKU</h4>
                                    #ecopick.sku[CurrentRow]#  #ecopick.Description[CurrentRow]#
                                </div>
</div>
                                    </div>
                               

                            </div>
<!--- end portlet --->
</cfoutput>
<!--- <cfhtmltopdfitem type="pagebreak" />  --->
	</cfloop> --->
	<!--- 	</cfhtmltopdf> --->
	
		    </section>
		         <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Order History </h3>
                    </div>
                    <div class="panel-body">
                        <h2 class="lead">Order History</h2>
                        <ul class="list-inline">
                                          <cfloop query="ecoPick"><cfoutput>            
                                            <li>
                                               
                                            <a href="_orderPrint.cfm?Order_No=#URLEncodedFormat(OrderNo)#"><i class="fa fa-external-link"></i> #OrderNo#</a>
                                            </li>
                                            </cfoutput>    </cfloop>
                        </ul>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Notes</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li>Click on Order Name to View</li>
                                    <li>Row 2 Should Include the  (<strong>Container No.</strong>) </li>
                                    <li>Headers need to be Item/ Description/ Quantity <strong></strong> </li>
                                    
                                </ul>
                            </div>
                        </div>
                     

                    </div>
                
                </div>
		    <!--notification end-->
			</div>
		</div>
	</section>
</section>