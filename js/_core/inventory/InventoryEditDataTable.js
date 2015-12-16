$(document).ready(function() {
//Ensure Latest File  12/15 12:33
    var EditableTable = function() {

        return {

            //main function to initiate the module
            init: function () {
                function restoreRow(oTable, nRow) {
                    console.log('restoreRow');
                    var aData = oTable.fnGetData(nRow);
                    
                    var jqTds = $('>td', nRow);

                    // for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    //     oTable.fnUpdate(aData[i], nRow, i, false);
                    // }
                    oTable.fnUpdate(aData.otheractions, nRow, 1, false);
                    oTable.fnUpdate(aData.sku, nRow, 2, false);
                    oTable.fnUpdate(aData.description, nRow, 3, false);
                    oTable.fnUpdate(aData.container, nRow, 4, false);
                    oTable.fnUpdate(aData.qty, nRow, 5, false);

                    oTable.fnDraw(); 
                }


                function editRow(oTable, nRow) {
                    var aData = oTable.fnGetData(nRow);

                    var jqTds = $('>td', nRow);
                    //take the dom element access it with jquery then find the "a" tag in the table cell
                    //change the text from cancel to save... 
                    //this way the click event doesn't get wiped out
                    $(jqTds[0]).find('a').text('Save'); 

                    jqTds[1].innerHTML = '<a class="cancel" href="#">Cancel</a>';
                    //uncomment to edit other columns 2-4 eg: 3-5 because js is 0 based...vs CF
                    //jqTds[2].innerHTML = '<input type="text" class="form-control small" value="' + aData['sku'] + '">';
                    //jqTds[3].innerHTML = '<input type="text" class="form-control small" value="' + aData['description'] + '">';
                    //jqTds[4].innerHTML = '<input type="text" class="form-control small" value="' + aData['container'] + '">';
                    jqTds[5].innerHTML = '<input type="text" class="form-control small" value="' + aData['qty'] + '">';

                    //register the cancel click once the item is created
                    $('#edit-table a.cancel').on('click', function (e) {
                        e.preventDefault();

                        if ($(this).attr("data-mode") == "new") {
                            var nRow = $(this).parents('tr')[0];
                            oTable.fnDeleteRow(nRow);
                        } else {
                            restoreRow(oTable, nEditing);
                            nEditing = null;
                        }
                    });
                }

                function saveRow(oTable, nRow) {
                    var jqInputs = $('input', nRow);
                    var rowDataBeforeSave = oTable.fnGetData(nRow);
                    var rowDataBeforeSave = oTable.fnGetData(nRow);
                    var x = rowDataBeforeSave.qty;

                    oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 0, false);
                    //make a delete button if they are admin or nothing if they aren't. might not be perfect but should work unless they are hackers..
                    var deleteBtn = (isAdmin) ? '<a class="delete" href="#">Delete</a>' : ''; //short hand way to write an if.. else 
                    oTable.fnUpdate(deleteBtn, nRow, 1, false);

                    //oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                    //oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                    //oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);

                    //qty field.. position matters in this code..
                    //since we only have one editable field at the moment this is input 0 .. if you added others you would adjust the indexes accordingly...
                    oTable.fnUpdate(jqInputs[0].value, nRow, 5, false); 

                    oTable.fnDraw();

                    //lets return the old qty here so we can pass it along with the data...
                    return x;
                }

                function cancelEditRow(oTable, nRow) {
                    var jqInputs = $('input', nRow);
                    oTable.fnUpdate('<a class="edit" href="#">Edit</a>', nRow, 0, false);
                    //oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                    //oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                    //oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
                    oTable.fnUpdate(jqInputs[0].value, nRow, 5, false);
                    oTable.fnDraw();
                }

                //lets make the datatable here... with columns and data source from the cfc
                var isAdmin = $('#edit-table').data('isadmin');
                //base columns... for grid in a variable so we can add admin columns conditionally later
                var arColumns = [
                    { data: "xedit" },
                    { data: "otheractions" },
                    { data: "sku" },
                    { data: "description" },
                    { data: "container" },
                    { data: "qty", className: "rowDataSd" },
                    { data: "datercvd" }
                ];

                //if admin give them 2 extra columns.. easier if they are on the end since stuff is positional based..
                //lets scrap this for now.. too late to see what's wrong...
                // if (isAdmin == true) {
                //     arColumns.push( { data: "edtqty" } );
                //     arColumns.push( { data: "iisedited" } );
                // }

               var nEditing = null;

                var oTable = $('#edit-table').dataTable({
                    "aaSorting": [[ 6, "desc" ]],
                    "columns" : arColumns,
                    "ajax" : {
                        url: '/cfc/inventory/inventoryService.cfc?method=getAll&mode=edit&returnAs=datatables&returnFormat=JSON', 
                        dataSrc: 'aaData'
                    },
                    "initComplete": function(settings, json) {
                        //gotta do the on click stuff here because the click event is registered before the ajax call is loaded thus clicking
                        //does nothing because the item wasn't there yet...
                        

                        $('#edit-table_new').click(function (e) {
                            e.preventDefault();
                            var aiNew = oTable.fnAddData(['', '', '', '',
                                    '<a class="edit" href="">Edit</a>'
                            ]);
                            var nRow = oTable.fnGetNodes(aiNew[0]);
                            editRow(oTable, nRow);
                            nEditing = nRow;
                        });

                        $('#edit-table a.delete').on('click', function (e) {
                            e.preventDefault();

                            if (confirm("Are you sure to delete this row ?") == false) {
                                return;
                            }

                            var nRow = $(this).parents('tr')[0];
                            oTable.fnDeleteRow(nRow);
                            alert("Deleted! Do not forget to do some ajax to sync with backend :)");
                        });

                        

                        $('#edit-table a.edit').on('click', function (e) {
                            e.preventDefault();

                            /* Get the row as a parent of the link that was clicked on */
                            var nRow = $(this).parents('tr')[0];

                            

                            if (nEditing !== null && nEditing != nRow) {
                                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                                restoreRow(oTable, nEditing);
                                editRow(oTable, nRow);
                                nEditing = nRow;
                            } else if (nEditing == nRow && this.innerHTML == "Save") {
                                /* Editing this row and want to save it */
                                var prevQty = saveRow(oTable, nEditing);
                                console.log('prevQty');
                                console.log(prevQty);
                                nEditing = null;
                                //get the data from the row...
                                var aData = oTable.fnGetData(nRow);
                //My attempt at making a difference var
                var diffnQty = (prevQty-aData.qty)*-1;
                                //now that we sent old qty back above lets add it to the data of the ajax call..
                                aData.prevQty = prevQty;
                                aData.diffnQty = diffnQty;   
                                console.log(aData);

                                $.ajax({
                                  url: "/cfc/inventory/inventoryService.cfc?method=saveEdits",
                                  data : aData,
                                  dataType : 'JSON',
                                  method : 'POST'
                                }).done(function( result ) {
                                    //obviously do something different like show a nice message or something...
                                    if( result ) {
                                        alert('SAVED... do something else');
                                    } else {
                                        alert('NOT SAVED: ');

                                    }
                                });

                            } else {
                                /* No edit in progress - let's start one */
                                editRow(oTable, nRow);
                                nEditing = nRow;
                            }
                        });
                    }
               });


                jQuery('#edit-table_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
                jQuery('#edit-table_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown

                
            }

        };

    }();


    // this calls the function below...
    EditableTable.init();
});