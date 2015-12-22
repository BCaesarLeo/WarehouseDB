<!--- Gets last 3 inbound uploads container/date   --->
<cfset exoDisInbound = APPLICATION.inventoryAuditObj.getDistinctInbound()>
<cfset exoData = APPLICATION.inventoryService.getAll()>

<!--main content start-->
<section id="main-content" >
<section class="wrapper">

<!--mini statistics start-->
<div class="row">
    <div class="col-md-3">
        <section class="panel">
            <div class="panel-body">
                <div class="top-stats-panel">
                    <div class="gauge-canvas">
                        <h4 class="widget-h">Inventory Capacity</h4>
                        <canvas width="160" height="100" id="gauge"></canvas>
                    </div>
<!--- Attempt to get value--- doesn't seem to care what number I put in though --->
                    <cfoutput>
                    <ul class="gauge-meta clearfix">
                        <li id="gauge-textfield" class="pull-left gauge-value">#exoData.qty#</li>
                        <li class="pull-right gauge-title">Safe</li>
                    </ul>
                    </cfoutput>
                </div>
            </div>
        </section>
    </div>
    <div class="col-md-3">
        <section class="panel">
            <div class="panel-body">
                <div class="top-stats-panel">
                    <div class="daily-visit">
                        <h4 class="widget-h">Orders</h4>
                        <div id="daily-visit-chart" style="width: 100%; height: 100px; display: block; padding: 0px; position: relative;">

                        <canvas class="flot-base" width="212" height="100" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 212px; height: 100px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; max-width: 39px; top: 89px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 34px; text-align: center;">2</div><div style="position: absolute; max-width: 39px; top: 89px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 76px; text-align: center;">4</div><div style="position: absolute; max-width: 39px; top: 89px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 119px; text-align: center;">6</div><div style="position: absolute; max-width: 39px; top: 89px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 161px; text-align: center;">8</div><div style="position: absolute; max-width: 39px; top: 89px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 201px; text-align: center;">10</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; top: 64px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 11px; text-align: right;">0</div><div style="position: absolute; top: 32px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 6px; text-align: right;">50</div><div style="position: absolute; top: 1px; font-style: normal; font-variant: normal; font-weight: 400; font-stretch: normal; font-size: 10px; line-height: 11.5px; font-family: 'Open Sans', sans-serif; color: rgb(102, 102, 102); left: 0px; text-align: right;">100</div></div></div><canvas class="flot-overlay" width="212" height="100" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 212px; height: 100px;"></canvas></div>
                        <ul class="chart-meta clearfix">
                            <li class="pull-left visit-chart-value">3233</li>
                            <li class="pull-right visit-chart-title"><i class="fa fa-arrow-up"></i> 15%</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="col-md-3">
        <section class="panel">
            <div class="panel-body">
                <div class="top-stats-panel">
                    <h4 class="widget-h">Top Items</h4>
                    <div class="sm-pie" style="padding: 0px; position: relative;">
                    <canvas class="flot-base" width="212" height="100" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 212px; height: 100px;"></canvas><canvas class="flot-overlay" width="212" height="100" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 212px; height: 100px;"></canvas><div class="legend"><div style="position: absolute; width: 64px; height: 54px; top: 5px; right: 5px; opacity: 0.85; background-color: rgb(255, 255, 255);"> </div><table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(255,223,124);overflow:hidden"></div></div></td><td class="legendLabel">Chair</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(178,222,247);overflow:hidden"></div></div></td><td class="legendLabel">Top</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(239,179,230);overflow:hidden"></div></div></td><td class="legendLabel">Bench</td></tr></tbody></table></div></div>
                </div>
            </div>
        </section>
    </div>
    <div class="col-md-3">
        <section class="panel">
            <div class="panel-body">
                <div class="top-stats-panel">
                    <h4 class="widget-h">Daily Sales</h4>
                    <div class="bar-stats">
                        <ul class="progress-stat-bar clearfix">
                            <li data-percent="50%"><span class="progress-stat-percent pink" style="height: 50%;"></span></li>
                            <li data-percent="90%"><span class="progress-stat-percent" style="height: 90%;"></span></li>
                            <li data-percent="70%"><span class="progress-stat-percent yellow-b" style="height: 70%;"></span></li>
                        </ul>
                        <ul class="bar-legend">
                            <li><span class="bar-legend-pointer pink"></span> East</li>
                            <li><span class="bar-legend-pointer green"></span> West </li>
                            <li><span class="bar-legend-pointer yellow-b"></span> North & South</li>
                        </ul>
                        <div class="daily-sales-info">
                            <span class="sales-count">1200 </span> <span class="sales-label">Products Sold</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!--mini statistics end-->
<div class="row">
    <div class="col-md-8">
        <!--earning graph start-->
        <section class="panel">
            <header class="panel-heading">
                Shipment Graph <span class="tools pull-right">
            <a href="javascript:;" class="fa fa-chevron-down"></a>
            <a href="javascript:;" class="fa fa-cog"></a>
            <a href="javascript:;" class="fa fa-times"></a>
            </span>
            </header>
            <div class="panel-body">

                <div id="graph-area" class="main-chart" style="position: relative;"><
                <div class="morris-hover morris-default-style" style="left: 181.806px; top: 116px; display: none;"><div class="morris-hover-row-label">2010 Q4</div><div class="morris-hover-point" style="color: #ED5D5D">
  iPhone:
  3,767
</div><div class="morris-hover-point" style="color: #D6D23A">
  iPad:
  3,597
</div><div class="morris-hover-point" style="color: #32D2C9">
  iPod Touch:
  5,689
</div></div><div class="morris-hover morris-default-style" style="left: 0px; top: 148px; display: none;"><div class="morris-hover-row-label">2011 Q2</div><div class="morris-hover-point" style="color: #ED5D5D">
  iPhone:
  5,670
</div><div class="morris-hover-point" style="color: #D6D23A">
  iPad:
  4,293
</div><div class="morris-hover-point" style="color: #32D2C9">
  iPod Touch:
  1,881
</div></div></div>
                <div class="region-stats">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="region-earning-stats">
                                This year total Shipments <span>4545</span>
                            </div>
                            <ul class="clearfix location-earning-stats">
                                <li class="stat-divider">
                                    <cfoutput>
                                    <span class="first-city">#exoData.qty#</span>
                                    </cfoutput>
                                    Rocky Mt,NC </li>
                                <li class="stat-divider">
                                    <span class="second-city">567</span>
                                    Dallas/FW,TX </li>
                                <li>
                                    <span class="third-city">254</span>
                                    Millville,NJ </li>
                            </ul>
                        </div>
                        <div class="col-md-5">
                            <div id="world-map" class="vector-stat">
                          
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--earning graph end-->
    </div>
    <div class="col-md-4">
        <!--widget graph start-->
        <section class="panel">
            <div class="panel-body">
                <div class="monthly-stats pink">
                    <div class="clearfix">
                        <h4 class="pull-left"> January 2013</h4>
                        <!-- Nav tabs -->
                        <div class="btn-group pull-right stat-tab">
                            <a href="#line-chart" class="btn stat-btn active" data-toggle="tab"><i class="ico-stats"></i></a>
                            <a href="#bar-chart" class="btn stat-btn" data-toggle="tab"><i class="ico-bars"></i></a>
                        </div>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="line-chart">
                            <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-min-spot-color="false" data-max-spot-color="false" data-line-color="#ffffff" data-spot-color="#ffffff" data-fill-color="" data-highlight-line-color="#ffffff" data-highlight-spot-color="#e1b8ff" data-spot-radius="3" data-data="[100,200,459,234,600,800,345,987,675,457,765]"><canvas style="display: inline-block; width: 273px; height: 75px; vertical-align: top;" width="273" height="75"></canvas></div>
                        </div>
                        <div class="tab-pane" id="bar-chart">
                            <div class="sparkline" data-type="bar" data-resize="true" data-height="75" data-width="90%" data-bar-color="#d4a7f5" data-bar-width="10" data-data="[300,200,500,700,654,987,457,300,876,454,788,300,200,500,700,654,987,457,300,876,454,788]"><canvas width="241" height="75" style="display: inline-block; width: 241px; height: 75px; vertical-align: top;"></canvas></div>
                        </div>
                    </div>
                </div>
                <div class="circle-sat">
                    <ul>
                        <li class="left-stat-label"><span class="sell-percent">60%</span><span>Inbound</span></li>
                        <li><span class="epie-chart" data-percent="45">
                        <span class="percent">45</span>
                        <canvas height="80" width="80"></canvas><canvas height="80" width="80"></canvas></span></li>
                        <li class="right-stat-label"><span class="sell-percent">40%</span><span>Outbound</span></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--widget graph end-->
        <!--widget graph start-->
        <section class="panel">
            <div class="panel-body">
                <ul class="clearfix prospective-spark-bar">
                    <li class="pull-left spark-bar-label">
                        <span class="bar-label-value"> $18887</span>
                        <span>Prospective Label</span>
                    </li>
                    <li class="pull-right">
                        <div class="sparkline" data-type="bar" data-resize="true" data-height="40" data-width="90%" data-bar-color="#f6b0ae" data-bar-width="5" data-data="[300,200,500,700,654,987,457,300,876,454,788,300,200,500,700,654,987,457,300,876,454,788]"><canvas width="131" height="40" style="display: inline-block; width: 131px; height: 40px; vertical-align: top;"></canvas></div>
                    </li>
                </ul>
            </div>
        </section>
        <!--widget graph end-->
        <!--widget weather start-->
        <section class="weather-widget clearfix">
            <div class="pull-left weather-icon">
                <canvas id="icon1" width="60" height="60"></canvas>
            </div>
            <div>
                <ul class="weather-info">
                    <li class="weather-city">Kernersville, NC <i class="ico-location"></i></li>
                    <li class="weather-cent"><span>18</span></li>
                    <li class="weather-status">Rainy Day</li>
                </ul>
            </div>
        </section>
        <!--widget weather end-->
    </div>
</div>
<!--mini statistics start-->
<div class="row">
    <div class="col-md-3">
        <div class="mini-stat clearfix">
            <span class="mini-stat-icon orange"><i class="fa fa-gavel"></i></span>
            <div class="mini-stat-info">
                <span>320</span>
                New Order Received
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="mini-stat clearfix">
            <span class="mini-stat-icon tar"><i class="fa fa-tag"></i></span>
            <div class="mini-stat-info">
                <span>22,450</span>
                Unique Inventory Items
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="mini-stat clearfix">
            <span class="mini-stat-icon pink"><i class="fa fa-barcode"></i></span>
            <div class="mini-stat-info">
                <span>34,320</span>
                Total Inbound Scans
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="mini-stat clearfix">
            <span class="mini-stat-icon green"><i class="fa fa-truck"></i></span>
            <div class="mini-stat-info">
                <span>32720</span>
                Total Outbound Scans
            </div>
        </div>
    </div>
</div>
<!--mini statistics end-->


<div class="row">
    <div class="col-md-8">
        
    </div>
    
</div>
<div class="row">
    <div class="col-md-8">
        <section class="panel">
            <div class="wdgt-row">
                
                
                <div class="country-select">
                    <select class="styled hasCustomSelect" style="-webkit-appearance: menulist-button; width: 89px; position: absolute; opacity: 0; height: 31px; font-size: 12px;">
                        <option>New York </option>
                        <option>London </option>
                        <option>Australia </option>
                        <option>China </option>
                        <option>Canada </option>
                    </select>
                </div>
            </div>

            

        </section>
    </div>

    
</div>
<div class="row">
<div class="col-md-6">
    <!--notification start-->
    <section class="panel">
        <header class="panel-heading">
            Messages <span class="tools pull-right">
            <a href="javascript:;" class="fa fa-chevron-down"></a>
            <a href="javascript:;" class="fa fa-cog"></a>
            <a href="javascript:;" class="fa fa-times"></a>
            </span>
        </header>
        <div class="panel-body">
            <div class="alert alert-info clearfix">
                <span class="alert-icon"><i class="fa fa-envelope-o"></i></span>
                <div class="notification-info">
                    <ul class="clearfix notification-meta">
                        <li class="pull-left notification-sender"><span><a href="#">Fourway Warehouse</a></span> send you a mail </li>
                        <li class="pull-right notification-time">1 min ago</li>
                    </ul>
                    <p>
                        Urgent meeting for next proposal
                    </p>
                </div>
            </div>
            <div class="alert alert-danger">
                <span class="alert-icon"><i class="fa fa-envelope-o"></i></span>
                <div class="notification-info">
                    <ul class="clearfix notification-meta">
                        <li class="pull-left notification-sender"><span><a href="#">Fourway Warhouse</a></span> performed an Inventory Scan </li>
                        <li class="pull-right notification-time">7 Hours Ago</li>
                    </ul>
                    <p>
                        Updated Inventory
                    </p>
                </div>
            </div>
            <div class="alert alert-success ">
                <span class="alert-icon"><i class="fa fa-envelope-o"></i></span>
                <div class="notification-info">
                    <ul class="clearfix notification-meta">
                        <li class="pull-left notification-sender">You have 5 message unread</li>
                        <li class="pull-right notification-time">1 min ago</li>
                    </ul>
                    <p>
                        <a href="#"></a> and <a href="#">3 others</a>
                    </p>
                </div>
            </div>
            <cfoutput>
            <div class="alert alert-warning ">
                <span class="alert-icon"><i class="fa fa-bell-o"></i></span>
                <div class="notification-info">
                    <ul class="clearfix notification-meta">
                        <li class="pull-left notification-sender">New Container</li>
                        <!--- Calculates the difference between today and the latest inbound registration  --->
                        <li class="pull-right notification-time">#Abs(DateDiff("d", Now(), exoDisInbound.CONTAINERREGDATE[1]))# Day(s) ago</li>
                    </ul>
                    <p>
                       Latest Container #exoDisInbound.CONTAINERNO[1]# Inbound 
                    </p>
                </div>
            </div>
            </cfoutput>
        </div>
    </section>
    <!--notification end-->
</div>
<div class="col-md-6">
    <!--todolist start-->
    <section class="panel">
        <header class="panel-heading">
            To Do List <span class="tools pull-right">
            <a href="javascript:;" class="fa fa-chevron-down"></a>
            <a href="javascript:;" class="fa fa-cog"></a>
            <a href="javascript:;" class="fa fa-times"></a>
            </span>
        </header>
        <div class="panel-body">
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 300px;"><ul class="to-do-list ui-sortable" id="sortable-todo" style="overflow: hidden; width: auto; height: 300px;">
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check">
                        <label for="todo-check"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check1">
                        <label for="todo-check1"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check2">
                        <label for="todo-check2"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check3">
                        <label for="todo-check3"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check4">
                        <label for="todo-check4"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check5">
                        <label for="todo-check5"></label>
                    </div>
                    <p class="todo-title">
                        Upload Inbound Manifest
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
                <li class="clearfix">
                    <span class="drag-marker">
                    <i></i>
                    </span>
                    <div class="todo-check pull-left">
                        <input type="checkbox" value="None" id="todo-check6">
                        <label for="todo-check6"></label>
                    </div>
                    <p class="todo-title">
                        Donec quam libero, rutrum non gravida ut
                    </p>
                    <div class="todo-actionlist pull-right clearfix">
                        <a href="#" class="todo-done"><i class="fa fa-check"></i></a>
                        <a href="#" class="todo-edit"><i class="ico-pencil"></i></a>
                        <a href="#" class="todo-remove"><i class="ico-close"></i></a>
                    </div>
                </li>
            </ul><div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 247.253px; background: rgb(0, 0, 0);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div></div>
            <div class="todo-action-bar">
                <div class="row">
                    <div class="col-xs-4 btn-todo-select">
                        <button type="submit" class="btn btn-default"><i class="fa fa-check"></i> Select All</button>
                    </div>
                    <div class="col-xs-4 todo-search-wrap">
                        <input type="text" class="form-control search todo-search pull-right" placeholder=" Search">
                    </div>
                    <div class="col-xs-4 btn-add-task">
                        <button type="submit" class="btn btn-default btn-primary"><i class="fa fa-plus"></i> Add Task</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--todolist end-->
</div>
</div>
</section>
</section>