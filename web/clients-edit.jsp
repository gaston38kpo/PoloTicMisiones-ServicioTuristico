<%@page import="logica.Client"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
            <label class="show-btn" for="show">Editar Cliente</label>

            <!-- Form to create new employees -->
            <form action="SvClientEdit" method="GET">
                <%
                    HttpSession thisSession = request.getSession();
                    Client client = (Client) thisSession.getAttribute("client");

                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                    String birthdate = DATE_FORMAT.format(client.getBirthdate());
                %>

                <div class="form-group form-personal-info">

                    <input type="hidden" name="id" value="<%= client.getId()%>">

                    <h2>Informacion personal</h2>                    

                    <label for="first_name_id">Nombre*</label>
                    <input type="text" name="first_name" id="first_name_id" value="<%= client.getFirst_name()%>" required>

                    <label for="last_name_id">Apellido*</label>
                    <input type="text" name="last_name" id="last_name_id" value="<%= client.getLast_name()%>" required>

                    <label for="street_id">Dirección*</label>
                    <input type="text" name="street" id="street_id" value="<%= client.getStreet()%>" required>

                    <label for="dni_id">DNI*</label>
                    <input type="number" name="dni" id="dni_id" value="<%= client.getDni()%>" required>

                    <label for="birthdate_id">Fecha de nacimiento*</label>
                    <input type="date" name="birthdate" value="<%= birthdate%>" required>

                    <label for="nationality_id">Nacionalidad*</label>
                    <input type="text" name="nationality" id="nationality_" value="<%= client.getNationality()%>" required>

                    <label for="cellphone_id">Telefono*</label>
                    <input type="text" name="cellphone" id="cellphone_id" value="<%= client.getCellphone()%>" required>

                    <label for="email_id">Email*</label>
                    <input type="email" name="email" id="email_id" value="<%= client.getEmail()%>" required>

                </div>                  

                <input type="submit" value="Modificar Cliente" class="submit-btn">
                
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