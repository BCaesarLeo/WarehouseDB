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
            el.barcode( ""+barcodeVal+"", ""+barcodeTypes[ type ]+"", {barWidth:2, barHeight:50});
        });

        //fetch the content after the LOOP above creates the HTML..
        var theContent = $("##theOrder").html();

    });
</script>