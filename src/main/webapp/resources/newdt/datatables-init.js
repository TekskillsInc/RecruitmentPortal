(function ($) {
    //    "use strict";
    /*  Data Table
    -------------  chistory*/
    $('#chistory1').DataTable({
        lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
    });

   $('#closeTableId').DataTable({
        lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
    });
   $('#closeTables').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   $('#taskTable').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   
   $('#taskTable1').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   $('#taskTable3').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   $('#executiveTable').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   $('#dnrTables').DataTable({
       lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
   });
   $('#clarificationTable,#DNRTable').DataTable({ });
})(jQuery);