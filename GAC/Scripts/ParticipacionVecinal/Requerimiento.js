
$(document).ready(function () {
     
    $("#txtFecIni").kendoDatePicker({ format: "dd/MM/yyyy" }); 
    $("#txtFecFin").kendoDatePicker({ format: "dd/MM/yyyy" }); 
    var dsRequerimiento = new kendo.data.DataSource({
        serverFiltering: true,
        serverPaging: true,
        type: 'odata',
        serverSorting: true,
        pageSize: 10,
        transport: {
            read: {
                url: path + "JuntaVecinal/ListaBusquedaRequerimiento",
                dataType: "json"
            },
            parameterMap: function (options, type) {
                var Paginacion = options.pageSize;
                var Pagina = options.page;
                var paramMap = kendo.data.transports.odata.parameterMap(options);
                paramMap.Pagina = Pagina;
                paramMap.Paginacion = Paginacion;
                paramMap.nro = $('#txtNroRequerimiento').val();
                paramMap.fnIni = $('#txtFecIni').val();
                paramMap.fnFin = $('#txtFecFin').val();
                paramMap.subsector = $('#cboJuntaVecinal').val();

                delete paramMap.$inlinecount;
                delete paramMap.$format;
                delete paramMap.$filter;
                return paramMap;
            }
        },
        schema: {
            data: "data",
            total: "total"
        }
    });
    /***********************************************************************************************/

    var _params = {
        dataSource: dsRequerimiento,
        pageable: { refresh: true, pageSizes: [5, 10, 20], pageSize: 10, buttonCount: 3 },
        //filterable: { mode: "row" }, 
        filterable: { extra: false },
        editable: false,
        //height: 543,
        columns: [
            { field: "ID", hidden: true },
            { field: "C", title: "Código", width: 100, filterable: true },
            { field: "R", title: "Responsable", width: 100, filterable: false },
            { command: [{ name: "Registrar", template: "<div class='k-grid-historico k-button' onclick='fn_Click(this);' ><span class='k-icon k-i-maximize'></span>&nbsp;&nbsp;Ver Detalle</div>" }], title: " ", width: 150 },

        ]
    };

    /***********************************************************************************************/

    /***********************************************************************************************/
    var grid = $("#grid").kendoGrid(_params);
    /***********************************************************************************************/

});


function fn_Click(vitem) {
    var id = $(vitem).parent().parent().children().html();
    id = parseInt(id);

    if (id > 0) {
        var strUrl = path + "JuntaVecinal/RegistrarIniciativa?Id=" + id;
        window.location = strUrl;
    }
}



function fn_Buscar() {

    $("#grid").data("kendoGrid").dataSource.read();

}

function fn_CrearNuevo() {

    //var idIni = $('#hidIni').val();
    var strUrl = path + "JuntaVecinal/RegistrarIniciativa?Id=" + 0;
    window.location = strUrl;

}



