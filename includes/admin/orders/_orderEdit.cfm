    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        Editable Table
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                    </header>
                    <div class="panel-body">
                        <div class="adv-table editable-table">
                            <div class="clearfix">
                                <div class="btn-group">
                                    
                                </div>
                                <div class="btn-group pull-right">
                                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="#">Print</a></li>
                                        <li><a href="#">Save as PDF</a></li>
                                        <li><a href="#">Export to Excel</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="space15"></div>
                            <!--- We'll put some JQUERY data on the table as meta data to pass it along to the javascript.. then super easy to get it inside JS to do an IF... --->


                            <table id="edit-table" class="table table-striped table-hover table-bordered" cellspacing="0" width="100%" data-isadmin="<cfoutput>#SESSION.auth.isAdmin#</cfoutput>"> <!--- lowercase is important here...--->
                                <thead>
                                    <tr>
                                        <!--- two blank columns to the table easier at front to add admin ones at end and not mess up positioning in js code --->
                                        <th><i class="fa fa-edit"></i></th>
                                        <th></th>
                                        <th>Sku</th>
                                        <th>Description</th>
                                        <th>Container</th>
                                        <th>Quantity</th>
                                        <th >Date Received</th>
                                            <th>Location</th>
                                            <th>Modified On</th>
                                        
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--- *********************** _DebugScript ***********************--->
<!--- <cfinclude template="/includes/_debug.cfm"> --->