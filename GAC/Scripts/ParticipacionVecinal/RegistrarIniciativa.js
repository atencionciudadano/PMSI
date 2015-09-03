
$(document).ready(function () {

    fn_CargaEstados();
    $("#txtFeIni01").kendoDatePicker({ format: "dd/MM/yyyy" });
    $("#txtFeFin01").kendoDatePicker({ format: "dd/MM/yyyy" });
    fn_CargaSubSector();


    var dsIV = new kendo.data.DataSource({
        serverFiltering: true,
        serverPaging: true,
        type: 'odata',
        serverSorting: true,
        pageSize: 10,
        transport: {
            read: {
                url: path + "JuntaVecinal/ListaBusquedaIV",
                dataType: "json"
            },
            parameterMap: function (options, type) {
                var Paginacion = options.pageSize;
                var Pagina = options.page;
                var paramMap = kendo.data.transports.odata.parameterMap(options);
                paramMap.Pagina = Pagina;
                paramMap.Paginacion = Paginacion;
                paramMap.feini = $('#txtFeIni01').val();
                paramMap.fefin = $('#txtFeFin01').val();
                paramMap.codest = $('#cboEstado01').val();

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
        dataSource: dsIV,
        pageable: { refresh: true, pageSizes: [5, 10, 20], pageSize: 10, buttonCount: 3 },
        //filterable: { mode: "row" }, 
        filterable: { extra: false },
        editable: false,
        //height: 543,
        columns: [
           // { field: "ID", hidden: true },
            { field: "C", title: "Código", width: 100, filterable: true },
            { field: "R", title: "Delegado Vecinal", width: 100, filterable: false },
            { field: "E", title: "Estado", width: 100, filterable: false },
            { field: "S", title: "Subsector", width: 100, filterable: false },
            { command: [{ name: "Registrar", template: "<div class='k-grid-historico k-button' onclick='fn_SeleccionarIV(this);' ><span class='k-icon k-i-maximize'></span>&nbsp;&nbsp;Seleccionar</div>" }], title: " ", width: 150 },
            //{ command: [{ name: "Registrar", template: "<div class='k-grid-historico k-button' onclick='fn_Click(this);' ><span class='k-icon k-i-maximize'></span>&nbsp;&nbsp;Ver Detalle</div>" }], title: " ", width: 150 } 

        ]
    };

    /***********************************************************************************************/

    /***********************************************************************************************/
    var grid = $("#gridIniciativa").kendoGrid(_params);
    /***********************************************************************************************/

});


function fnGuardarIniciativa() {

}

function fn_CargaBusquedaIniciativa(e) {
    e.preventDefault();

    $('#ModalIniciativa').modal('show');

}


function fn_SeleccionarIV(vItem) {
    var Codigo = $(vItem).parent().parent().children().html();
    $('#txtIniciativa').val(Codigo);
    $('#ModalIniciativa').modal('toggle');
}


function fn_VerIniciativa() {
    var strUrl = path + "JuntaVecinal/IniciativaVecinal?IdIni=" + 0;
    window.location = strUrl;

}

function fn_CargaSubSector() {
    var lst = '';
    $.get(path + "Maestro/ListaSector", function (data) {
        console.log(data);
        var lstEnt = data;
        var strItems = '';
        $('#cboJuntaVecinal').find('option').remove();
        var strItems = '<option value="0">Seleccione</option>';
        if (lstEnt.length) {
            for (var i = 0; i < lstEnt.length; i++) {
                //{ID: 8, N: "ESTILOS (LIMA)"}
                strItems += '<option value=' + lstEnt[i].V + '>' + lstEnt[i].N + '</option>';
            }
        }
        $('#cboJuntaVecinal').append(strItems);

    });
}

function fn_CargaEstados() {
    var lst = '';
    $.get(path + "Maestro/ListaEstado", function (data) {
        
        console.log(data);
        var lstEnt = data;
        var strItems = '';
        $('#cboEstado01').find('option').remove();
        var strItems = '<option value="0">Seleccione</option>';
        if (lstEnt.length) {
            for (var i = 0; i < lstEnt.length; i++) {
                //{ID: 8, N: "ESTILOS (LIMA)"}
                strItems += '<option value=' + lstEnt[i].V + '>' + lstEnt[i].N + '</option>';
            }
        }
        $('#cboEstado01').append(strItems);

    }); 

}


function fn_BuscarIniciativa() {
    $("#gridIniciativa").data("kendoGrid").dataSource.read();
}


