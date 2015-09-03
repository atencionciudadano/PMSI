<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Dominio.Core.Entities.Reclamo>>" %>


<%: Styles.Render("~/Content/custom/css/Tabla.css") %>

    <table id="tabla" class="grid" style="text-align:center;">
        <thead>
            <tr>
                <th>Nro.</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Estado</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>

        <tbody>

            <% 
                foreach (var item in Model)
               {
                 %>
                <tr>
                    <td style="text-align:center;"><%: item.NroReclamo %></td>
                    <td style="text-align:center;"><%: item.FecRegistro %></td>
                    <td style="text-align:center;"><%: item.Hora %></td>
                    <td style="text-align:center;"><%: item.EstadoQuejaReclamo %></td>
                    <td class="clsRevisar" title="Revisar" style="text-align:center;">Revisar</td>
                    <td style="text-align:center;"><%:Html.ActionLink("Historial", "HistorialReclamo", "Reclamo", new {NroRegistro = item.NroReclamo, Estado = item.EstadoQuejaReclamo}, new { @class = "clsVer", title ="Historial" })%></td>
                    
                    <%if (item.EstadoQuejaReclamo == "FINALIZADA")
                      {%>
                          <td></td>
                     <% } else
                        {%>
                          <td style="text-align:center;"><%:Html.ActionLink("Atender", "AtenderReclamo", "Atender", new { id = item.IdReclamo, NroRegistro = item.NroReclamo, FechaRegistro = item.FecRegistro, Hora = item.Hora }, new { @class = "clsAtender", title ="Atender" })%></td>
                      <% }%>
                </tr>
            <%
            }%>
        </tbody>
        
        
    </table>