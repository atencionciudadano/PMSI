<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Inicio.Master" Inherits="System.Web.Mvc.ViewPage<Dominio.Core.Entities.Reclamo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Municipalidad de San Isidro
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%: Styles.Render("~/Content/custom/css/AtencionCiudadano.css") %>

<h2>Ingreso al sistema</h2>

    <fieldset>
        <legend></legend>
        <table style="width:100%;">
            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Usuario:</p> 
                </td>
                <td class="tdForm">
                    <input type="text" name="mypass" id="txtUsuario" class="textboxFormRight"> 
                </td>
                <td colspan="2">
                    
                </td>
            </tr>
            <tr>
                <td>
                    <p class="labelFormLeft">Contraseña:</p> 
                </td>
                <td>
                    <input type="password" name="mypass" id="txtPassword" class="textboxFormRight"> 
                </td>
                <td colspan="2">
                    
                </td>
            </tr>
            <tr>
                <td><br /></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:Center;">
                    <% using (Html.BeginForm("Index", "Reclamo")) %>
                    <%  {%>
                    <input type="submit" id="btnIngresar" title="Ingresar" value="Ingresar" class="buttonForm"/>&nbsp
                   <% }%>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </fieldset>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeader" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">

</asp:Content>
