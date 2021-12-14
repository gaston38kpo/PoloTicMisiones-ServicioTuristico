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

            <input type=checkbox id="show">
            <label class="show-btn" for="show">Editar Servicio</label>

            <!-- Form to create new employees -->
            <form action="SvServiceEdit" method="GET">
                <%
                    HttpSession thisSession = request.getSession();
                    Service service = (Service) thisSession.getAttribute("service");

                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                    String date_service = DATE_FORMAT.format(service.getDate_service());
                %>

                <div class="form-group">

                    <input type="hidden" name="service_code" value="<%= service.getService_code()%>">

                    <h2>Informacion del Servicio</h2>

                    <label for="name_id">Nombre*</label>
                    <input type="text" name="name" id="name_id" value="<%= service.getName()%>" required>

                    <label for="description_id">Descripcion*</label>
                    <input type="text-area" name="description" id="description_id" value="<%= service.getDescription()%>" required>

                    <label for="destination_id">Destino*</label>
                    <input type="text" name="destination" id="destination_id" value="<%= service.getDestination()%>" required>

                    <label for="cost_service_id">Costo*</label>
                    <input type="number" step=".01" name="cost_service" id="cost_service_id" value="<%= service.getCost_service()%>" required>

                    <label for="date_service_id">Fecha*</label>
                    <input type="date" name="date_service" id="date_service_id" value="<%= date_service%>"required>                    

                </div>                

                <input type="submit" value="Modificar Servicio" class="submit-btn">
            </form>
        </section>

    </main>

    <footer class="box-size">
        <p>
            Hecho con ♥ por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
        </p>
    </footer>

</body>
</html>