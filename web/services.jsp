<%@page import="logica.Service"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="logica.Employee" %>
<%@page import="java.util.List" %>
<%@page import="logica.Controladora" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/log-manager.css">
        <link rel="stylesheet" href="assets/css/form.css">

        <title>index</title>
    </head>

    <body>         

        <div class="logobar-default box-size">
            <a href="index.jsp">
                <h1>Agencia de Turismo UwU</h1>
            </a>
        </div>

    <navbar class="navbar-default box-size">
        <ul class="links">
            <li><a href="https://youtu.be/dQw4w9WgXcQ">
                    SOY UN LINK :D
                </a></li>
            <li><a href="#">
                    GITHUB
                </a></li>
            <li><a href="#">
                    SOBRE MI
                </a></li>
        </ul>
    </navbar>

    <main class="container-default box-size">
        <section class="form-section">

            <!-- Hide/Show Form -->

            <input type="checkbox" id="show">
            <label class="show-btn" for="show">Registrar nuevo servicio</label>

            <!-- Form to create new services -->

            <form id="content" action="SvServiceCreate" method="POST">

                <div class="form-group">

                    <h2>Informacion del Servicio</h2>

                    <label for="name_id">Nombre*</label>
                    <input type="text" name="name" id="name_id" placeholder="Pasajes de avión" required>

                    <label for="description_id">Descripcion*</label>
                    <input type="text-area" name="description" id="description_id" placeholder="Pasaje de ida y vuelta asegurado" required>

                    <label for="destination_id">Destino*</label>
                    <input type="text" name="destination" id="destination_id" placeholder="Noruega" required>

                    <label for="cost_service_id">Costo*</label>
                    <input type="number" name="cost_service" id="cost_service_id" placeholder="50000" required>

                    <label for="date_service_id">Fecha*</label>
                    <input type="date" name="date_service" id="date_service_id" required>                    

                </div>

                <input type="submit" value="Crear Servicio" class="submit-btn">

            </form>

        </section>


        <!-- List all services on database -->

        <section class="log-section">

            <h2>Lista de Servicios</h2>

            <div class="table-wrapper">
                <table class="fl-table">

                    <thead class="log-header">
                        <tr>

                            <th></th>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Destino</th>
                            <th>Costo</th>
                            <th>Fecha del servicio</th>
                            <th></th>

                        </tr>
                    </thead>

                    <tbody class="log-body">
                        <%
                            Controladora control = new Controladora();

                            List<Service> serviceList = control.getAllServices();

                            for (Service service : serviceList) {

                                SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

                                int service_code = service.getService_code();
                                String date_service = DATE_FORMAT.format(service.getDate_service());
                        %>
                        <tr>

                            <td>
                                <form class="form-edit" action="SvServiceEdit" method="POST" name="formEditEmployee">
                                    <input type="hidden" name="service_code" value="<%= service_code%>">
                                    <button type="submit" class="edit-btn">Editar</button>
                                </form>
                            </td>
                            <td><%= service.getService_code()%></td>
                            <td><%= service.getName()%></td>
                            <td><%= service.getDescription()%></td>
                            <td><%= service.getDestination()%></td>
                            <td>&dollar;<%= service.getCost_service()%></td>
                            <td><%= date_service%></td>
                            <td>
                                <form class="form-delete" action="SvServiceDelete" method="POST" name="formDeleteEmployee">
                                    <input type="hidden" name="service_code" value="<%= service_code%>">
                                    <button type="submit" class="delete-btn">Eliminar</button>
                                </form>
                            </td>

                        </tr>
                        <% }%>
                    </tbody>

                </table>
            </div>
        </section>
    </main>

    <footer class="box-size">
        <p>
            Hecho con ♥ por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
        </p>
    </footer>

</body>
</html>