<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Intranet.Master" Inherits="System.Web.Mvc.ViewPage<Dominio.Core.Entities.Reclamo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Historial de Atencion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Styles.Render("~/Content/custom/css/AtencionCiudadano.css") %>

<h2>Historial de Atencion</h2>

    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

   <fieldset>
        <legend></legend>
        <table style="width:100%;">
            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Número de Registro:</p>
                </td>
                <td>
                    <%:Html.TextBoxFor(m => Model.NroReclamo, new { @class = "textboxFormRight" , @readonly = "readonly"})%>
                </td>
                <td class="tdForm">
                    
                </td>
                <td class="tdForm">
                    
                </td>
            </tr>
            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Estado</p>
                </td>
                <td>
                    <%:Html.TextBoxFor(m => Model.EstadoQuejaReclamo, new { @class = "textboxFormRight" , @readonly = "readonly"})%>
                </td>
                <td class="tdForm">
                    
                </td>
                <td class="tdForm">
                    
                </td>
            </tr>
            <tr>
                <td><br /></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;">
                    <input type="submit" id="btnSalir" title="Salir" value="Salir" class="buttonForm" onclick='javascript: history.go(-1)'/>
                </td>
            </tr>
        </table>

       <br />
       <br />

       <div id="div_tbl_Reclamo">
        </div>
       <br />
       <br />
    </fieldset>
<%  } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeader" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/jquery") %>

    <script type="text/javascript">

        $(document).ready(function () {
            mostrarListado();
        });
        
        function mostrarListado() {

            var data = {
                pNroReclamo: $("#NroReclamo").val()
            };

            $.ajax({
                url: "<%:Url.Action("_HistorialReclamos", "Reclamo")%>",
               data: data,
               contentType: "application/json; charset=utf-8",
               success: function (datax) {
                   if (datax == null) {
                       alert("No se encuentran registros");
                   } else {
                       $('#div_tbl_Reclamo').html(datax);
                   }
               },
               error: function (error) {
                   alert(error.error + " Error, Consulte con Sistemas");
               }
           });
        };

    </script>
</asp:Content>
