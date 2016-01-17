 <cfsetting requesttimeout="4600"></cfsetting>
<cfset exoDisInbound = APPLICATION.inventoryAuditObj.getDistinctInbound()>

<cfparam name="ecoDataFile" default=""></cfparam>

 							<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
              <li><a href="../../"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="/admin/orders/">Orders</a></li>
              <li class="active">Order Upload</li>
          </ul>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Upload an Order </h3>
                    </div>
                    <div class="panel-body">
                        <h2 class="lead">Upload an Order  for Shipment</h2>
                        <!-- The file upload form used as target for the file upload widget -->
                       <form action="index.cfm" method="POST" enctype="multipart/form-data">
                            <!-- Redirect browsers with JavaScript disabled to the origin page -->
                            <noscript>
                                <input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/">
                            </noscript>
                            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                            <div class="row fileupload-buttonbar">
                                <div class="col-lg-7">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <span class="btn btn-success fileinput-button">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <span>Add files...</span>
                                     <input type="file" name="ecoDataFile" required accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" >
                              
                                    </span>
                                    <button type="submit" name="ecoSubmit1" class="btn btn-primary start">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>Start upload</span>
                                    </button>
                                  
                                    <!-- The global file processing state -->
                                    <span class="fileupload-process"></span>
                                </div>
                                <!-- The global progress state -->
                                <div class="col-lg-5 fileupload-progress fade">
                                    <!-- The global progress bar -->
                                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <div class="progress-bar progress-bar-success" style="width:0%;">
                                        </div>
                                    </div>
                                    <!-- The extended global progress state -->
                                    <div class="progress-extended">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <!-- The table listing the files available for upload/download -->
                            <table role="presentation" class="table table-striped">
                                <tbody class="files">
                                </tbody>
                            </table>
                        </form>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Notes</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li>The File must be an Excel<strong> .XLSX</strong> </li>
                                    <li>Row 2 Should Include the  (<strong>Container No.</strong>) </li>
                                    <li>Headers need to be Item/ Description/ Quantity <strong></strong> </li>
                                    
                                </ul>
                            </div>
                        </div>
                     

                    </div>
                </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Order Upload History </h3>
                    </div>
                    <div class="panel-body">
                        <h2 class="lead">Recently added Order Upload History</h2>
                        <ul class="list-inline">
                                          <cfloop query="exoDisInbound"><cfoutput>            
                                            <li>
                                               
                                            <a href="downloadItems.cfm?container_No=#URLEncodedFormat(ContainerNo)#"> #ContainerNo#</a>
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
                                    <li>Click on Inbound Shipment Names to View</li>
                                    <li>Row 2 Should Include the  (<strong>Container No.</strong>) </li>
                                    <li>Headers need to be Item/ Description/ Quantity <strong></strong> </li>
                                    
                                </ul>
                            </div>
                        </div>
                     

                    </div>
                
                </div>
            </div>

        </div>
    </section>
</section>
<!--main content end-->
 							