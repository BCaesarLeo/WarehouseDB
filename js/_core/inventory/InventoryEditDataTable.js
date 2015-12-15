var editor; // use a global for the submit and return data rendering in the examples



        $(document).ready(function() {
            editor = new $.fn.dataTables.Editor( {
                ajax: "/cfc/inventory/inventoryService.cfc?method=getAll&returnAs=datatables&returnFormat=JSON",
                table: "#edit-table",
                fields:  [ { 
                    label:"SKU:",
                    name: "sku" 
                }, {
                    label:"Description:",
                    name: "description" 
                }, {
                    label: "Container:",
                    name: "container"
                }, { 
                    label: "qty:",
                    name: "qty", 
                    className: "rowDataSd" 
                }, { 

                    label: "datercvd",
                    name: "datercvd" }
                    ]

//
                   
                    


                } );

    // Activate an inline edit on click of a table cell
    $('#edit-table').on( 'click', 'tbody td:not(:first-child)', function (e) {
        editor.inline( this );
    } );

    $('#edit-table').DataTable( {
        dom: "Bfrtip",
        ajax:  "/cfc/inventory/inventoryService.cfc?method=getAll&returnAs=datatables&returnFormat=JSON",
                        dataSrc: 'aaData',
        columns: [
        {
            data: null,
            defaultContent: '',
            className: 'select-checkbox',
            orderable: false
        },
        { data: "sku" },
        { data: "description" },
        { data: "container" },
        { data: "qty" },
        { data: "datercvd" }
       // ,{ data: "salary", render: $.fn.dataTable.render.number( ',', '.', 0, '$' ) }
        ],
        select: {
            style:    'os',
            selector: 'td:first-child'
        },
        buttons: [
        { extend: "create", editor: editor },
        { extend: "edit",   editor: editor },
        { extend: "remove", editor: editor }
 
      ]
    } );
} );