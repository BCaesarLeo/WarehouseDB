<cfinvoke component="cfc.inventory.orderupload" method="uploaderrors" returnvariable="e"/>
<!--main content start-->
<section id="main-content" >
	<section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="/admin/dashboard"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="/admin/orders/">Orders</a></li>
					<li class="active">Dashboard</li>
				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		
		<!--- INVENTORY NOTIFICATIONS --->
		<div class="row">
			<div class="col-md-12">
		    <!--notification start-->
		    <section class="panel">
		        <header class="panel-heading">
		        	<h1 class="text-danger">  ORDER UPLOAD FAILURE </h1><span class="tools pull-right">
		            <a href="javascript:;" class="fa fa-chevron-down"></a>
		            <a href="javascript:;" class="fa fa-cog"></a>
		            <a href="javascript:;" class="fa fa-times"></a>
		            </span>
		        </header>
		        <div class="panel-body">
		         
		            <div class="alert alert-danger">
		                <span class="alert-icon"><i class="fa fa-bell-o"></i></span>
		                <div class="notification-info">
		                    <ul class="clearfix notification-meta">
		                    
		                    </ul>
		                    <p>
		                    	<h3>
<cfif isDefined("cfcatch")>
	

		                    	 <cfdump var="#cfcatch.message#"><br></h3>
		                    	 </cfif>

		                    	 <cfif isDefined("e.userMsg")>
		                    	 	<cfdump var="#e.userMsg#">
		                    	 	</cfif>

		                    </p>
		                </div>
		            </div>
		     
		         
		        </div>
		    </section>
		    <!--notification end-->
			</div>
		</div>
	</section>
</section>