<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">


<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'inventory'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">
<script src="/js/jquery-barcode.js"></script>
<script>
$( document ).ready(function() {
    console.log( "ready!" );

    jQuery(function($) {
        // lookup object so I can pass data from the target barcode div to render the right kind of barcode easily..
        var barcodeTypes = {
            'location' : 'code39',
            'order' : 'code93',
            'sku' : 'code128'
        };

        $("div.barcodeDsp").each(function(){
            var el = $(this)
                ,barcodeVal = el.data('barcodeval')
                ,type = el.data('barcodetype')
            ;
            //build the bardcode based on the data that was placed on the barcode display div..
            el.barcode( ""+barcodeVal+"", ""+barcodeTypes[ type ]+"", {barWidth:2, barHeight:50});
        });

        //fetch the content after the LOOP above creates the HTML..
        var theContent = $("##theOrder").html();

        //set the literal html into the content textarea of the hidden form... then submit it..
        // $("##content").val( theContent );
        // $("##downloadOrderForm").submit();
        //  console.log("hit bottom of this");

    });
});
</script>
<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<section>
    <div id="theOrder">
    <!--- value and TYPE are placed on the div itself and so basically on every page load anything with the class of barcodeDsp will have the value and type parsed and a barcode will be created.. --->
    <h4>ORDER</h4>
    <div class="barcodeDsp" data-barcodeval="xx123245" data-barcodetype="order"></div>

    <h4>SKU</h4>
    <div class="barcodeDsp" data-barcodeval="xx123123212" data-barcodetype="sku"></div>

    <h4>LOCATION</h4>
    <div class="barcodeDsp" data-barcodeval="xx12321321" data-barcodetype="location"></div>
</div>


    </section>
<section>
    <div>
<form id="downloadOrderForm" name="downloadOrderForm" action="_OrderPrint.cfm" method="post" target="_blank" style="display:none;">
    <input name="orderID" type="hidden" value="12345" />
    <input id="content" name="content" type="hidden" value="" />

</form>
    </div>
    </section>

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->




<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>