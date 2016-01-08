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

    var x = $('#order-table').dataTable( {
        "aaSorting": [[ 4, "desc" ]],
        "columns" : [
            { data: "odate" },
            { data: "orderno" },
            { data: "ostatus" },
            { data: "name" },
            { data: "address1" },
            { data: "city", className: "rowDataSd" },
            { data: "state" },
            { data: "ozip" },
            { data: "email" },
            { data: "phone" }

            

        ],
        ajax: {
            url: '/cfc/inventory/orders.cfc?method=getorderstable&returnAs=datatables&returnFormat=JSON',
            dataSrc: 'aaData'
        }
        
    } );

   
} );

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

    var x = $('#order-items-table').dataTable( {
        "aaSorting": [[ 4, "desc" ]],
        "columns" : [
            { data: "orderno" },
            { data: "sku" },
            { data: "briefdesc" },
            { data: "qty", className: "rowDataSd" },
            { data: "pickstatus" },
            { data: "picktime" }
        

          

        ],
        ajax: {
            url: '/cfc/inventory/orders.cfc?method=getorderitemstable&returnAs=datatables&returnFormat=JSON',
            dataSrc: 'aaData'
        }
        
    } );

   
} );