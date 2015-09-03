
$(document).ready(function () {

    var dsVecino = new kendo.data.DataSource({
        serverFiltering: true,
        serverPaging: true,
        type: 'odata',
        serverSorting: true,
        pageSize: 10,
        transport: {
            read: {
                url: path + "JuntaVecinal/ListaVecinoIV",
                dataType: "json"
            },
            parameterMap: function (options, type) {
                var Paginacion = options.pageSize;
                var Pagina = options.page;
                var paramMap = kendo.data.transports.odata.parameterMap(options);
                paramMap.Pagina = Pagina;
                paramMap.Paginacion = Paginacion;
                paramMap.idIniciativa = $('#hidId').val();
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

    var dsDocumento = new kendo.data.DataSource({
        serverFiltering: true,
        serverPaging: true,
        type: 'odata',
        serverSorting: true,
        pageSize: 10,
        transport: {
            read: {
                url: path + "JuntaVecinal/ListaDocumentoIV",
                dataType: "json"
            },
            parameterMap: function (options, type) {
                var Paginacion = options.pageSize;
                var Pagina = options.page;
                var paramMap = kendo.data.transports.odata.parameterMap(options);
                paramMap.Pagina = Pagina;
                paramMap.Paginacion = Paginacion;
                paramMap.idIniciativa = $('#hidId').val();
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

    var _paramsVecino = {
        dataSource: dsVecino,
        pageable: false,//{ refresh: true, pageSizes: [5, 10, 20], pageSize: 10, buttonCount: 3 },
        //filterable: { mode: "row" }, 
        filterable:false,
        editable: false,
       // height: 543,
        columns: [
            { field: "D", title: "DNI", width: 100, filterable: true },
            { field: "N", title: "Nombre", width: 100, filterable: true },
            { field: "A", title: "Dirección", width: 100, filterable: false }
           // { command: [{ name: "Registrar", template: "<div class='k-grid-historico k-button' onclick='fn_Click(this);' ><span class='k-icon k-i-maximize'></span>&nbsp;&nbsp;Registrar Requerimiento</div>" }], title: " ", width: 150 },

        ]
    };

    var _paramsDocs = {
        dataSource: dsDocumento,
        pageable:false,// { refresh: true, pageSizes: [5, 10, 20], pageSize: 10, buttonCount: 3 },
        //filterable: { mode: "row" }, 
        filterable:false,// { extra: false },
        editable: false,
      //  height: 543,
        columns: [ 
            { field: "C", title: "Código", width: 100, filterable: true },
            { field: "N", title: "Nombre", width: 100, filterable: false }, 
            { field: "F", title: "Fecha Registro", width: 100, filterable: false }
            //{ command: [{ name: "Registrar", template: "<div class='k-grid-historico k-button' onclick='fn_Click(this);' ><span class='k-icon k-i-maximize'></span>&nbsp;&nbsp;Registrar Requerimiento</div>" }], title: " ", width: 150 },

        ]
    };

    /***********************************************************************************************/

    /***********************************************************************************************/
    var gridVecino = $("#gridVecinos").kendoGrid(_paramsVecino);
    var gridDocumento = $("#gridDocumento").kendoGrid(_paramsDocs);
    /***********************************************************************************************/


});


function fn_Retornar() {
    var strUrl = path + "JuntaVecinal/RegistrarIniciativa?Id=" + 0;
    window.location = strUrl;
}
