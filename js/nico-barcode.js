//  <!-- value and TYPE are placed on the div itself and so basically on every page load anything with the class of barcodeDsp will have the value and type parsed and a barcode will be created.. --->
// <h4>ORDER</h4>
// <div class="barcodeDsp" data-barcodeval="xx123245" data-barcodetype="order"></div>

// <h4>SKU</h4>
// <div class="barcodeDsp" data-barcodeval="xx123123212" data-barcodetype="sku"></div>

// <h4>LOCATION</h4>
// <div class="barcodeDsp" data-barcodeval="xx12321321" data-barcodetype="location"></div>


 <script>
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
            el.barcode( ""+barcodeVal+"", ""+barcodeTypes[ type ]+"", {barWidth:2, barHeight:30});
         });
    });
</script>