function fnFormatDetails ( oTable, nTr )
{
    var aData = oTable.fnGetData( nTr );
    var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    sOut += '<tr><td>Rendering engine:</td><td>'+aData[1]+' '+aData[4]+'</td></tr>';
    sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
    sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
    sOut += '</table>';

    return sOut;
}

$(document).ready(function() {
    var selContainer = $("#audit-table").data('selcontainer');
    console.log(selContainer);
    var x = $('#audit-table').dataTable( {
        "aaSorting": [[ 4, "desc" ]],
        "columns" : [
            { data: "scanned_sku" },
            { data: "maxdescription" },
            { data: "containerno" },
            { data: "qtyaudit", className: "rowDataSd" },
            { data: "datercvd" }
        ],
        ajax: {
            url: '/cfc/inventory/inventoryaudit.cfc?method=getcompareAudit&returnAs=datatables&returnFormat=JSON&selContainer='+selContainer,
            dataSrc: 'aaData'
        },
        "footerCallback": function(row, data, start, end, display) {
            console.log('in footerCallback');
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            // Total over all pages
            var total = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Total over this page
            pageTotal = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Update footer
            $( api.column( 3 ).footer() ).html(
                'Qty Audit: ' + pageTotal + " (this page)"
            );
                
            $("#inventoryTotal").html(total);
        }
    } );

   
} );