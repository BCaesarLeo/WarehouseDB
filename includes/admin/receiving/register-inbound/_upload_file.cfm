 <cfsetting requesttimeout="4600"></cfsetting>


<cfparam name="ecoDataFile" default=""></cfparam>

 							<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Register Inbound Shipment </h3>
                    </div>
                    <div class="panel-body">
                        <h2 class="lead">Register an Inbound Shipment</h2>
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
                                     <input type="file" name="ecoDataFile">
                              
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
            </div>

        </div>
    </section>
</section>
<!--main content end-->
 							<cfinclude template="/includes/_debug.cfm">