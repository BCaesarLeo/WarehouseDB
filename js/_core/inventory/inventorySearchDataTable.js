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

    var x = $('#dynamic-table').DataTable( {
        "aaSorting": [[ 4, "desc" ]],
        "columns" : [
            { data: "sku" },
            { data: "description" },
            { data: "container" },
            { data: "qty", className: "rowDataSd" },
            { data: "datercvd" }
        ],
        "sAjaxSource" : '/cfc/inventory/inventoryService.cfc?method=getAll&returnas=datatables&returnFormat=JSON',
        "fnFooterCallback": function( nFoot, aaData, iStart, iEnd, aiDisplay ) {
            var iTotal = 0;
            var qtyColPos = 3;
            for ( var i=0 ; i<aaData.length ; i++ ){
                iTotal += aaData[i][ qtyColPos ]*1;
            }
             
            /* Calculate the  share for browsers on this page */
            var iPage = 0;
            for ( var i=iStart ; i<iEnd ; i++ )
            {
                iPage += aaData[ aiDisplay[i] ][ qtyColPos ]*1;
            }
             
            /* Modify the footer row to match what we want */
            var nCells = nFoot.getElementsByTagName('th');

            nCells[ qtyColPos ].innerHTML = "Page Qty: " + iPage;

            $("#inventoryTotal").text(iTotal);
        }
    } );

   
} );