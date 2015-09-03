<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Intranet.Master" Inherits="System.Web.Mvc.ViewPage<Dominio.Core.Entities.Reclamo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reclamo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%: Styles.Render("~/Content/custom/css/AtencionCiudadano.css") %>
    <%: Styles.Render("~/Content/themes/base/jquery.ui.datepicker.css") %>
    <%: Styles.Render("~/Content/themes/base/jquery.ui.theme.css") %>

<h2>Consulta de Quejas / Reclamos</h2>

    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

   <fieldset>
        <legend></legend>
        <table style="width:100%;">
            <tr>
                <th colspan="4">Criterios de búsqueda:<br /><br /></th>
            </tr>
            
            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Numero de Registro:</p> 
                </td>
                <td class="tdForm">
                    <%:Html.TextBoxFor(m =>Model.NroReclamo, new { @class = "textboxFormRight" }) %>
                </td>

                <td class="tdForm">
                    
                </td>
                <td class="tdForm">
                   
                </td>
            </tr>
            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Estado:</p>
                </td>
                <td class="tdForm">
                    <select id="cboEstado" class="comboFormRight">
                        <option value="0">-- Seleccionar --</option>
                        <%{
                              if (ViewBag.lstEstadoQuejaReclamo != null)
                            {
                                foreach (var item in ViewBag.lstEstadoQuejaReclamo)
                                {%>
                                    <option value = "<%:@item.Codigo%>"><%:@item.Descripcion%></option>
                                 <%}
                            }
                        } %>
                    </select>
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
                <td class="labelFormLeft">
                    <p>Fecha de Ingreso desde:</p>
                </td>
                <td>
                    <%: Html.TextBox("input_a", "01/06/2015" , new { id = "dtFechaDesde", @readonly = "true", @class = "textFechaFormRight" }) %>
                </td>
                
                <td class="labelFormLeft">
                    
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="labelFormLeft">
                    <p>hasta:</p>
                </td>
                <td>
                    <%: Html.TextBox("input_a", DateTime.Today.ToString().Substring(0,10) , new { id = "dtFechaHasta", @readonly = "true", @class = "textFechaFormRight" }) %>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><br /></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <input type="button" id="btnBuscar" title="Buscar" value="Buscar" class="buttonForm"/>
                </td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
        
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/jquery") %>
    <%--<%: Scripts.Render("~/bundles/jqueryui") %>--%>
    <%: Scripts.Render("~/Scripts/jquery-ui-1.8.20.js") %>

   <script type="text/javascript">

       $(document).ready(function () {
           var f = new Date();

           $("#dtFechaDesde").prop("readonly", true).css("color", "black");
           $('input').filter("#dtFechaDesde").datepicker({
               dateFormat: "dd/mm/yy",
               showOn: "button",
               buttonImage: "../../Images/calendar.gif"
           });

           $("#dtFechaHasta").prop("readonly", true).css("color", "black");
           $('input').filter("#dtFechaHasta").datepicker({
               dateFormat: "dd/mm/yy",
               showOn: "button",
               buttonImage: "../../Images/calendar.gif"
           });

           mostrarListado();
       });

       $("#btnBuscar").click(function () {
           mostrarListado(); 
       });

       function mostrarListado() {

           var data = {
               pNroReclamo: $("#NroReclamo").val(),
               pEstado: $("#cboEstado option:selected").val(),
               pFecDesde: $("#dtFechaDesde").val(),
               pFecHasta: $("#dtFechaHasta").val()
           };

           $.ajax({
               url: "<%:Url.Action("_listarReclamos", "Reclamo")%>",
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

    </Script>

</asp:Content>
