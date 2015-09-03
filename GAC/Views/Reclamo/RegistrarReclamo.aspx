<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Dominio.Core.Entities.Reclamo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Municipalidad de San Isidro - Registro de Quejas y Reclamos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%: Styles.Render("~/Content/custom/css/AtencionCiudadano.css") %>

<h2>Registro de Quejas / Reclamos</h2>
    <p style="color:red; font-size:11px;">*Si usted ha presentado un Reclamo/queja, puede consultar su estado en: <a href="#" style="font-style:oblique;">ESTADO DE MI REGISTRO</a> </p>
<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

   <fieldset>
        <legend></legend>
        <table style="width:100%;">
            <tr>
                <th colspan="2">Datos de la persona:<br /><br /></th>
                <th colspan="2">Datos de Reclamo/Queja:<br /><br /></th>
            </tr>

            <tr class="NoVisible">
                <td><%:Html.TextBoxFor(m =>Model.IdPersona) %></td>
                <td><%:Html.TextBoxFor(m =>Model.codProvincia) %></td>
                <td><%:Html.TextBoxFor(m =>Model.CodDistrito)%></td>
            </tr>

            <tr>
                <td class="tdForm">
                    <p class="labelFormLeft">Tipo Documento:</p>
                </td>
                <td class="tdForm">
                    <select id="cboTipoDocumento" class="comboFormRight">
                        <option value="0">-- Seleccionar --</option>
                        <%{
                            if (ViewBag.lstTipoDocumento != null)
                            {
                                foreach (var item in ViewBag.lstTipoDocumento)
                                {%>
                                    <option value = "<%:@item.Codigo%>"><%: @item.Descripcion %></option>
                                <%}
                            }
                        } %>
                    </select>
                </td>
                <td class="tdForm">
                    <p class="labelFormRight">Asunto:</p> 
                </td>
                <td class="tdForm">
                    
                </td>
            </tr>

            <tr>
                <td>
                    <p class="labelFormLeft">Num.Documento:</p> 
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.NroDocumento, new { @class = "textboxFormRight" }) %>
                </td>
                <td colspan="2">
                    <%:Html.TextBoxFor(m => Model.Asunto, new { @class = "textboxFormRight" })%>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="labelFormLeft">Nombres y Ape./Raz.Social:</p>
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.RazSocial, new { @class = "textboxFormRight" }) %>
                </td>
                <td>
                    <p class="labelFormRight">Mensaje:</p>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="labelFormLeft">
                    <p>Departamento:</p>
                </td>
                <td>
                    <select id="cboDepartamento" class="comboFormRight">
                        <option value="0">-- Seleccionar --</option>
                        <%{
                            if (ViewBag.lstDepartamentos != null)
                            {
                                foreach (var item in ViewBag.lstDepartamentos)
                                {%>
                                    <option value = "<%:@item.Codigo%>"><%:@item.Descripcion%></option>
                                 <%}
                            }
                        } %>
                    </select>
                </td>
                <td rowspan="6" colspan="2">
                    <%:Html.TextAreaFor(m =>Model.Mensaje, new { @class = "textareaFormRight" }) %>
                </td>
            </tr>
            <tr>
                <td class="labelFormLeft">
                    <p>Provincia:</p>
                </td>
                <td>
                    <select id="cboProvincia" class="comboFormRight">
                        <option value="0">-- Seleccionar --</option>
                        <%{
                            if (ViewBag.lstProvincias != null)
                            {
                                foreach (var item in ViewBag.lstProvincias)
                               {%>
                                    <option value = "<%:@item.Codigo%>"><%:@item.Descripcion%></option>
                             <%}
                            }
                        }%>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td class="labelFormLeft">
                    <p>Distrito:</p>
                </td>
                <td>
                    <select id="cboDistrito" class="comboFormRight">
                        <option value="0">-- Seleccionar --</option>
                        <% {
                            if (ViewBag.lstDistritos != null)
                            {
                                foreach (var item in ViewBag.lstDistritos)
                                {%>
                                    <option value = "<%:@item.Codigo%>"><%:@item.Descripcion%></option>
                             <%}
                            }
                        }%>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="labelFormLeft">
                    <p>Direccion:</p> 
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.Direccion, new { @class = "textboxFormRight" }) %>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="labelFormLeft">
                    <p>Correo:</p> 
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.Correo, new { @class = "textboxFormRight" }) %>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="labelFormLeft">
                    <p>Tel.Fijo/Celular:</p> 
                </td>
                <td>
                    <%:Html.TextBoxFor(m =>Model.Telefono, new { @class = "textboxFormRight" }) %>
                </td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td class="labelFormRight" colspan="2">
                    <%:Html.TextBoxFor(m =>Model.Archivo, new {@type="file"}) %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
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
                <td colspan="2" style="text-align:center;">
                    <% using(Html.BeginForm("Registrar", "Reclamo")) %>
                    <%  {%>
                    <input type="submit" id="btnEnviar" title="Enviar" value="Enviar" class="buttonForm"/>
                   <% }%>
                </td>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" id="btnSalir" title="Salir" value="Salir" class="buttonForm"/>
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

   <script type="text/javascript">

       $(document).ready(function () {
           alert("HOLA");
       });
       $('#btnSalir').click(function () {
           $("#cboTipoDocumento option:selected").text() == "-- Seleccionar --";
           $("#NroDocumento").val() == "";
           $("#RazSocial").val() == "";
           $("#cboDepartamento option:selected").text() == "-- Seleccionar --";
           $("#cboProvincia option:selected").text() == "-- Seleccionar --";
           $("#cboDistrito option:selected").text() == "-- Seleccionar --";
           $("#Direccion").val() == "";
           $("#Correo").val() == "";
           $("#Telefono").val() == "";
           $("#Archivo").val() == "";
           $("#Asunto").val() == "";
           $("#Mensaje").val() == "";

           alert("Se ha cancelado el registro");
       });

       //--------------------- Grabar Reclamo ---------------------
       $('#btnEnviar').click(function () {
           var mensaje = "";

           if ($("#cboTipoDocumento option:selected").text() == "-- Seleccionar --") {
               mensaje = mensaje + "Debe seleccionar el tipo de documento" + "\n";
           }
           if ($("#NroDocumento").val() == "") {
               mensaje = mensaje + "Debe ingresar el numero de documento" + "\n";
           }
           if ($("#RazSocial").val() == "") {
               mensaje = mensaje + "Debe ingresar el nombre / raz.social" + "\n";
           }
           if ($("#cboDepartamento option:selected").text() == "-- Seleccionar --") {
               mensaje = mensaje + "Debe seleccionar un departamento" + "\n";
           }
           if ($("#cboProvincia option:selected").text() == "-- Seleccionar --") {
               mensaje = mensaje + "Debe seleccionar una provincia" + "\n";
           }
           if ($("#cboDistrito option:selected").text() == "-- Seleccionar --") {
               mensaje = mensaje + "Debe seleccionar un distrito" + "\n";
           }
           if ($("#Direccion").val() == "") {
               mensaje = mensaje + "Debe ingresar la dirección" + "\n";
           }
           if ($("#Correo").val() == "") {
               mensaje = mensaje + "Debe ingresar el correo" + "\n";
           }
           if ($("#Telefono").val() == "") {
               mensaje = mensaje + "Debe ingresar un numero de telefono" + "\n";
           }
           if ($("#Archivo").val() == "") {
               mensaje = mensaje + "Debe ingresar un numero de telefono" + "\n";
           }
           if ($("#Asunto").val() == "") {
               mensaje = mensaje + "Debe ingresar el asunto" + "\n";
           }
           if ($("#Mensaje").val() == "") {
               mensaje = mensaje + "Debe ingresar el mensaje" + "\n";
           }

           if (mensaje != "") {
               alert(mensaje);
               return false
           }

           var data = {
               idPersona: 0, //$("#IdPersona").val(),
               TipDocumento: $("#cboTipoDocumento option:selected").val(),
               NroDocumento: $("#NroDocumento").val(),
               RazSocial: $("#RazSocial").val(),
               //Serie: $("#cboDepartamento option:selected").text(),
               //Serie: $("#cboProvincia option:selected").text(),
               CodDistrito: $("#cboDistrito option:selected").val(),
               Direccion: $("#Direccion").val(),
               Correo: $("#Correo").val(),
               Telefono: $("#Telefono").val(),
               Asunto: $("#Asunto").val(),
               Mensaje: $("#Mensaje").val(),
               Archivo: $("#Archivo").val()
           };
           
           $.ajax({
               url: "<%:Url.Action("GrabarReclamo", "Reclamo")%>",
               type: "post",
               data: data,
               datatype: 'text',
               success: function (NroRegistro) {
                   alert("Reclamo registrado correctamente con el Nro: " + NroRegistro);
                   $("#Archivo").val("");
                   $("#Asunto").val("");
                   $("#Mensaje").val("");
               },
               error: function (error) {
                   alert(error.error + " Error");
               }
           });

           return false
       });

       // --------------------- Llenar combo provincia ---------------------
       $("#cboDepartamento").change(function () {
           $('#cboProvincia').empty();
           $('#cboDistrito').empty();
           
           var data = {
               pCodDepartamento: $("#cboDepartamento option:selected").val()
           };
           
           $.ajax({
               url: "<%:Url.Action("LlenarProvincia", "Reclamo")%>",
               type: "get",
               data: data,
               dataType: 'json',
               success: function (data) {
                   $('#cboProvincia').append(new Option("-- Seleccionar --", "0"));
                   $.each(data, function (i, item) {
                       $('#cboProvincia').append(new Option(item.Descripcion, item.Codigo));
                   });
               }
           });
           $('#cboDistrito').append(new Option("-- Seleccionar --", "0"));
       });

       // --------------------- Llenar combo distrito ---------------------
       $("#cboProvincia").change(function () {
           $('#cboDistrito').empty();

           var data = {
               pCodProvincia: $("#cboProvincia option:selected").val()
           };
           $.ajax({
               url: "<%:Url.Action("LlenarDistrito", "Reclamo")%>",
               type: "get",
               data: data,
               dataType: 'json',
               success: function (data) {
                   $('#cboDistrito').append(new Option("-- Seleccionar --", "0"));
                   $.each(data, function (i, item) {
                       $('#cboDistrito').append(new Option(item.Descripcion, item.Codigo));
                   });
               }
           });
       });

       // --------------------- Seleccionar combo  ---------------------
       $("#cboTipoDocumento").change(function () {
           $("#NroDocumento").val("");
           $("#RazSocial").val("");

           // DNI
           if ($("#cboTipoDocumento option:selected").val() == 0) {
               $("#NroDocumento").attr('maxlength', '8');
           }
           else {
               $("#NroDocumento").attr('maxlength', '11');
           }
       });

       $("#NroDocumento").change(function () {

           if (($("#cboTipoDocumento option:selected").val() == 1 && $("#NroDocumento").val().length >= 8) ||
               ($("#cboTipoDocumento option:selected").val() == 2 && $("#NroDocumento").val().length >= 11) ||
               ($("#cboTipoDocumento option:selected").val() == 3 && $("#NroDocumento").val().length >= 8) ||
               ($("#cboTipoDocumento option:selected").val() == 4 && $("#NroDocumento").val().length >= 8)) {

               var data = {
                   tipoDocumento: $("#cboTipoDocumento option:selected").val(),
                   NroDocumento: $("#NroDocumento").val()
               };
               $.ajax({
                   url: "<%:Url.Action("CargarPersona", "Reclamo")%>",
                   type: "get",
                   data: data,
                   dataType: 'json',
                   success: function (objReclamo) {
                       if (objReclamo.RazSocial == null) {
                           alert("El documento ingresado no se encuentra registrado en la base de datos, este será registrado al momento de generar el registro");
                       }

                       $('#RazSocial').val(objReclamo.RazSocial);
                       $("#cboDepartamento").val(objReclamo.codDepartamento);
                       $("#Direccion").val(objReclamo.Direccion);
                       $("#Correo").val(objReclamo.Correo);
                       $("#Telefono").val(objReclamo.Telefono);
                       //--------------------
                       var data2 = {
                           pCodDepartamento: $("#cboDepartamento").val()
                       };
                       $.ajax({
                           url: "<%:Url.Action("LlenarProvincia", "Reclamo")%>",
                           type: "get",
                           data: data2,
                           dataType: 'json',
                           success: function (data3) {
                               $.each(data3, function (i, item) {
                                   $('#cboProvincia').append(new Option(item.Descripcion, item.Codigo));
                               });

                               $("#cboProvincia").val(objReclamo.codProvincia);
                               //------------------
                               var data4 = {
                                   pCodProvincia: $("#cboProvincia").val()
                               };

                               $.ajax({
                                   url: "<%:Url.Action("LlenarDistrito", "Reclamo")%>",
                                   type: "get",
                                   data: data4,
                                   dataType: 'json',
                                   success: function (data5) {
                                       $.each(data5, function (i, item) {
                                           $('#cboDistrito').append(new Option(item.Descripcion, item.Codigo));
                                       });
                                       $('#cboDistrito').val(objReclamo.CodDistrito);
                                   }
                               });
                           }
                       });
                   }
               });
           }

       });

       // ------------------------ Campo numérico -----------------------
       $(document).on("keypress", "#NroDocumento", function (e) {
           if (e.keyCode < 48 || e.keyCode > 57) {
               return false
           }
       });

    </script>

</asp:Content>
