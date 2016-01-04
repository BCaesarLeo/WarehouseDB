<cfinvoke component="cfc.inventory.orderupload" method="uploadsuccess" returnvariable="e"/>
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
		        	<h1 class="text-success">  ORDER UPLOAD SUCCESS </h1><span class="tools pull-right">
		            <a href="javascript:;" class="fa fa-chevron-down"></a>
		            <a href="javascript:;" class="fa fa-cog"></a>
		            <a href="javascript:;" class="fa fa-times"></a>
		            </span>
		        </header>
		        <div class="panel-body">
		        <cfif isDefined("arguments.SKU")>List Length
		         	<cfdump var="#ListLen(arguments.SKU)#">
		         	</cfif>
		         
		           <div class="alert alert-success ">
                <span class="alert-icon"><i class="fa fa-comments-o"></i></span>
                <div class="notification-info">
                    <ul class="clearfix notification-meta">
                        <li class="pull-left notification-sender"> <h1>	<cfif isDefined("e.userMsg")>
		                    	 	<cfdump var="#e.userMsg#">
		                    	 	</cfif></h1></li>
                        <li class="pull-right notification-time">1 min ago</li>
                    </ul>
                    <p>
                       
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