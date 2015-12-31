

    
    <!--main content start-->
    <section id="main-content">
    <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-md-12">
                <!--breadcrumbs start -->
                <ul class="breadcrumb">
                    <li><a href="/admin/"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="/admin/orders/">Orders</a></li>
                    <li class="active">Order Entry</li>
                </ul>
                <!--breadcrumbs end -->
            </div>

            <!-- Order Wizard-->
   <!--- I cannot get javascript to pass from these tabs to the mock invoice on this page so I'll worry about it later --->
        <<!--- div class="row">
            <div class="col-sm-12">
               
                <section class="panel">
                    <header class="panel-heading">
                        Order Wizard
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                    </header>
                    <div class="panel-body">
                        <div id="wizard-vertical">
                            <h2>First Step</h2>
                            <section>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut nulla nunc. Maecenas arcu sem, hendrerit a tempor quis,
                                    sagittis accumsan tellus. In hac habitasse platea dictumst. Donec a semper dui. Nunc eget quam libero. Nam at felis metus.
                                    Nam tellus dolor, tristique ac tempus nec, iaculis quis nisi.</p>
                            </section>

                            <h2>Second Step</h2>
                            <section>
                                <p>Donec mi sapien, hendrerit nec egestas a, rutrum vitae dolor. Nullam venenatis diam ac ligula elementum pellentesque.
                                    In lobortis sollicitudin felis non eleifend. Morbi tristique tellus est, sed tempor elit. Morbi varius, nulla quis condimentum
                                    dictum, nisi elit condimentum magna, nec venenatis urna quam in nisi. Integer hendrerit sapien a diam adipiscing consectetur.
                                    In euismod augue ullamcorper leo dignissim quis elementum arcu porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Vestibulum leo velit, blandit ac tempor nec, ultrices id diam. Donec metus lacus, rhoncus sagittis iaculis nec, malesuada a diam.
                                    Donec non pulvinar urna. Aliquam id velit lacus.</p>
                            </section>

                            <h2>Third Step</h2>
                            <section>
                                <p>Morbi ornare tellus at elit ultrices id dignissim lorem elementum. Sed eget nisl at justo condimentum dapibus. Fusce eros justo,
                                    pellentesque non euismod ac, rutrum sed quam. Ut non mi tortor. Vestibulum eleifend varius ullamcorper. Aliquam erat volutpat.
                                    Donec diam massa, porta vel dictum sit amet, iaculis ac massa. Sed elementum dui commodo lectus sollicitudin in auctor mauris
                                    venenatis.</p>
                            </section>

                            <h2>Forth Step</h2>
                            <section>
                                <p><input type="email" id="fEmail" class="form-control" placeholder="info@envato.com"></p>
                            </section>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        --->
        <!-- End Order Wizard-->


                <section class="panel">
                    <div class="panel-body invoice">
                        <div class="invoice-header">
                            <div class="invoice-title col-md-3 col-xs-2">
                                <h1>Order # <span id="displayfOrder"></span></h1> 
                              
                                
                            </div>
                             
                            <div class="invoice-info col-md-9 col-xs-10">

                                <div class="pull-right">
                                    <div class="col-md-6 col-sm-6 pull-left">
                                      <p>
                                       <br>
                                         <span id="displayfName">Name:</span><br>
                                        <span id="displayfPhone">Phone:</span><br>
                                       <span id="displayfEmail">Email:</span><br>
                                     
                                      </p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 pull-right">
                                       <p>
                                       </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row invoice-to">
                            <div class="col-md-4 col-sm-4 pull-left">
                                <h4>Order Information:</h4>
                                Order No<input type="text"  id="fOrder" class="form-control" placeholder="OrderNo"> 
Customer Name<input type="text"  id="fName" class="form-control" placeholder="Name"> 
Address Line 1: <input type="text" id="fAddress1" class="form-control" placeholder="Street Address">
Address Line 2: <input type="text" id="fAddress2" class="form-control" placeholder="">
    City:           <input type="text" id="fCity" class="form-control" placeholder="Input Zip First for Auto Calculation">
    State:          <input type="text" id="fState" class="form-control" placeholder="">
    Zip:            <input type="text" id="fZip" class="form-control" placeholder="">
    Phone:          <input type="text" id="fPhone" class="form-control" placeholder="">
    Email           <input type="email" id="fEmail" class="form-control" placeholder="">
                                </p>
                            </div>
                            <div class="col-md-4 col-sm-5 pull-right">
                                <div class="row">
                                    <div class="col-md-4 col-sm-5 inv-label">Order No  <!--- barcode div --->
                                <div class="invoice-info col-md-9 col-xs-10" id="bcTarget"></div> </div>
                               
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-4 col-sm-5 inv-label">Date #</div>
                                    <div class="col-md-8 col-sm-7">21 December 2013</div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12 inv-label">
                                        <h3>TOTAL DUE</h3>
                                    </div>
                                    <div class="col-md-12">
                                        <h1 class="amnt-value">$ 3120.00</h1>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <table class="table table-invoice" >
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Item Description</th>
                                <th class="text-center">Unit Cost</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Total</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <h4>Service One</h4>
                                    <p>Service Four Description Lorem ipsum dolor sit amet.</p>
                                </td>
                                <td class="text-center">1</td>
                                <td class="text-center">4</td>
                                <td class="text-center">$1300.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <h4>Service Two</h4>
                                    <p>Service Four Description Lorem ipsum dolor sit amet.</p>
                                </td>
                                <td class="text-center">2</td>
                                <td class="text-center">5</td>
                                <td class="text-center">$1300.00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <h4>Service Three</h4>
                                    <p>Service Four Description Lorem ipsum dolor sit amet.</p>
                                </td>
                                <td class="text-center">1</td>
                                <td class="text-center">9</td>
                                <td class="text-center">$1300.00</td>
                            </tr>

                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-8 col-xs-7 payment-method">
                                <h4>Payment Method</h4>
                                <p>1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                <p>2. Pellentesque tincidunt pulvinar magna quis rhoncus.</p>
                                <p>3. Cras rhoncus risus vitae congue commodo.</p>
                                <br>
                                <h3 class="inv-label itatic">Thank you for your business</h3>
                            </div>
                            <div class="col-md-4 col-xs-5 invoice-block pull-right">
                                <ul class="unstyled amounts">
                                    <li>Sub - Total amount : $3820</li>
                                    <li>Discount : 10% </li>
                                    <li>TAX (15%) ----- </li>
                                    <li class="grand-total">Grand Total : $7145</li>
                                </ul>
                            </div>
                        </div>

                        <div class="text-center invoice-btn">
                            <a class="btn btn-success btn-lg"><i class="fa fa-check"></i> Submit Order </a>
                            <a href="invoice_print.html" target="_blank" class="btn btn-primary btn-lg"><i class="fa fa-print"></i> Print </a>
                        </div>

                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
    <!--main content end-->