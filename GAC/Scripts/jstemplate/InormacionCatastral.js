$(document).ready(function () {
    
});

function ObtenerSolicitud()
{
       $.get(
            '../../solicitudcatastro/getsolicitudes', //Action method del controller Expediente
            function (jsonResult) {
                $.each(jsonResult, function () {
                    $("#tblSolicitudPendiente > tbody").append("<tr><td>" + this.var_NroSolicitud + "</td><td>" + this.dtm_FechaEmision + "</td><td>" + this.var_TipoSolicitud + "</td><td>" + this.var_Descripcion + "</td></tr>");
                });
            }
        );

}
