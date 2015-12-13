<cfoutput>
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->            
        <div class="leftside-navigation">
	        <ul class="sidebar-menu" id="nav-accordion">
	        	<!--- DASHBOARD --->
	        	<li >
	            <a href="/admin/dashboard/" class="#(activeNav eq 'mainDashboard') ? 'active' : ''#">
	              <i class="fa fa-dashboard"></i>
	              <span>Dashboard</span>
	            </a>
		        </li>

		        <!--- RECEIVING AUDIT --->
		        <cfset arReceivingSections = ['receiving', 'register-inbound','receiving-archive', 'audit-inbound']>
		        <li class="sub-menu">
	            <a href="javascript:;" class="#( arrayFind(arReceivingSections, activeNav) ) ? 'active' : ''#">
	              <i class="fa fa-copy"></i>
	              <span>Receiving Audits</span>
	            </a>
	            <ul class="sub">
	              <li class="#(activeNav eq 'receiving') ? 'active' : ''#">
	              	<a href="/admin/receiving/" >Audit Dashboard</a>
	              </li>
	              <li class="#(activeNav eq 'register-inbound') ? 'active' : ''#">
	              	<a href="/admin/receiving/register-inbound" >Register Inbound</a>
	              </li>
	              <li class="#(activeNav eq 'audit-inbound') ? 'active' : ''#">
	              	<a href="/admin/receiving/audit-inbound" >Audit Inbound</a>
	              </li>
	              <li class="#(activeNav eq 'receiving-archive') ? 'active' : ''#">
	              	<a href="/admin/receiving/" >Inbound Archive</a>
	              </li>
	        		</ul>
	    			</li>

	    			<!--- INVENTORY --->
	    			<cfset arInventorySections = ['inventory', 'inventory-search', 'edit-inventory']>
	    			<li class="sub-menu">

							<a href="javascript:;" class="#( arrayFind(arInventorySections, activeNav) ) ? 'active' : ''#">
							    <i class="fa fa-barcode"></i>
							    <span>Inventory</span>
							</a>
							<ul class="sub">
								<li class="#(activeNav eq 'inventory') ? 'active' : ''#">
									<a href="/admin/inventory/">Dashboard</a>
								</li>
								<li class="#(activeNav eq 'inventory-search') ? 'active' : ''#">
									<a href="/admin/inventory/search">Search</a>
								</li>
								<li class="#(activeNav eq 'edit-inventory') ? 'active' : ''#">
									<a href="/admin/inventory/edit">Edit</a>
								</li>
							</ul>
						</li>
	        </ul>
        </div>        
        <!-- sidebar menu end-->
    </div>
</aside>
</cfoutput>