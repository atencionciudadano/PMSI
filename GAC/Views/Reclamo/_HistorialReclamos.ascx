<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Dominio.Core.Entities.Evento>>" %>


<%: Styles.Render("~/Content/custom/css/Tabla.css") %>

    <table id="tabla" class="grid" style="text-align:center;">
        <thead>
            <tr>
                <th>Gestor</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Operacion</th>
                <th>Observacion</th>
            </tr>
        </thead>

        <tbody>

            <% 
                foreach (var item in Model)
               {
                 %>
                <tr>
                    <td style="text-align:center;"><%: item.Area %></td>
                    <td style="text-align:center;"><%: item.FecRegistra %></td>
                    <td style="text-align:center;"><%: item.HoraRegistra %></td>
                    <td style="text-align:center;"><%: item.DescEvento %></td>
                    <td style="text-align:center;"><%: item.Observacion %></td>
                </tr>
            <%
            }%>
        </tbody>
        
        
    </table>