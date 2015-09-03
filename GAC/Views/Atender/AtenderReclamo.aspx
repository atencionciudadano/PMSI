<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Intranet.Master" Inherits="System.Web.Mvc.ViewPage<Dominio.Core.Entities.Atencion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Municipalidad de San Isidro - Atender Reclamo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%: Styles.Render("~/Content/custom/css/AtencionCiudadano.css") %>

<h2>Atender Queja o Reclamo</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

   <fieldset>
        <legend></legend>
        <table style="width:100%;">
            <!--
            <tr>
                <th colspan="2">Número de Registro:<br /><br /></th>
                <th colspan="2">Datos de Reclamo/Queja:<br /><br /></th>
            </tr>
                -->
            <tr class="NoVisible">
                <td><%:Html.TextBoxFor(m => Model.Reclamo.IdReclamo)%></td>
            </tr>

            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Número de Registro:</p>
                </td>
                <td>
                    <%:Html.TextBoxFor(m => Model.Reclamo.NroReclamo, new { @class = "textboxFormRight" , @readonly = "readonly"})%>
                </td>
                <td class="tdForm">
                    <input type="radio" name="rbtAtencion" value="0" checked="checked" id="rbtCerrar"/> Cerrar Atencion
                </td>
                <td class="tdForm">
                    
                </td>
            </tr>

            <tr>
                <td>
                    <p class="labelFormLeft">Fecha Ingreso:</p> 
                </td>
                <td class="tdForm">
                    <%:Html.TextBoxFor(m =>Model.Reclamo.FecRegistro, new { @class = "textboxFormRight" , @readonly = "readonly"}) %>
                </td>
                <td colspan="2">
                    <input type="radio" name="rbtAtencion" value="1" id="rbtDerivar" /> Derivar Atencion
                </td>
            </tr>
            <tr>
                <td>
                    <p class="labelFormLeft">Hora Ingreso:</p>
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.Reclamo.Hora, new { @class = "textboxFormRight" , @readonly = "readonly"}) %>
                </td>
                <td>
                    <select id="cboAreas" class="comboFormRight" style="visibility:hidden;">
                        <option value="0">-- Seleccionar --</option>
                        <%{
                            if (ViewBag.lstAreas != null)
                            {
                                foreach (var item in ViewBag.lstAreas)
                               {%>
                                    <option value = "<%:@item.Codigo%>"><%:@item.Descripcion%></option>
                             <%}
                            }
                        }%>
                    </select>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="labelFormLeft">
                    <p>Observaciones:</p>
                </td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td><br /><br /><br /></td>
                <td rowspan="3" colspan="2">
                    <%:Html.TextAreaFor(m =>Model.Observacion, new { @class = "textareaFormRight" }) %>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><br /><br /><br /></td>
                <td><br /><br /><br /></td>
            </tr>
            <tr>
                <td><br /><br /><br /></td>
                <td></td>
            </tr>
            <tr>
                <td><br /><br /><br /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <% using (Html.BeginForm("ConsultarReclamo", "Reclamo")) %>
                    <%  {%>
                    <input type="submit" id="btnEnviar" title="Guardar" value="Guardar" class="buttonForm"/>
                   <% }%>
                </td>
                <td colspan="2" style="text-align:center;">
                    <% using(Html.BeginForm("ConsultarReclamo", "Reclamo")) %>
                    <%  {%>
                    <input type="submit" id="btnSalir" title="Salir" value="Salir" class="buttonForm"/>
                    <% }%>
                </td>
            </tr>
        </table>
    </fieldset>
<%  } %>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/jquery") %>

   <script type="text/javascript">

       $(document).ready(function () {
           
       });
       $("#rbtCerrar").click(function () {
           $("#cboAreas").empty();

           $.ajax({
               url: "<%:Url.Action("LlenarAreas", "Reclamo")%>",
               type: "get",
               dataType: 'json',
               success: function (data) {
                   $('#cboAreas').append(new Option("-- Seleccionar --", "0"));
                   $.each(data, function (i, item) {
                       $('#cboAreas').append(new Option(item.Descripcion, item.Codigo));
                   });
               }
           });

           $("#cboAreas").css("visibility", "hidden");
       });
       $("#rbtDerivar").click(function () {
           $("#cboAreas").css("visibility", "visible");
       });
       $("#btnEnviar").click(function () {
           var mensaje = "";

           if ($("#Observacion").val() == "") {
               mensaje = mensaje + "Debe ingresar las Observaciones" + "\n";
           }

           if (mensaje != "") {
               alert(mensaje);
               return false
           }

           var data = {
               idReclamo: $("#Reclamo_IdReclamo").val(),
               NroReclamo: $("#Reclamo_NroReclamo").val(),
               FecRegistro: $("#Reclamo_FecRegistro").val(),
               Hora: $("#Reclamo_Hora").val(),
               idArea: $("#cboAreas option:selected").val(),
               Observacion: $("#Observacion").val()
           }

           $.ajax({
               url: "<%:Url.Action("GrabarAtencion", "Reclamo")%>",
               type: "post",
               data: data,
               datatype: 'text',
               success: function (NroAtencion) {
                   alert("Se Atendió correctamente");
                   window.history.back();
               },
               error: function (error) {
                   alert(error.error + " Error");
               }
           });
           return false
       });
    </script>

</asp:Content>