<%@page import="logica.User" %>
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
            <label class="show-btn" for="show">Editar Usuario</label>

            <!-- Form to create new employees -->
            <form action="SvUserEdit" method="GET">
                <%
                    HttpSession thisSession = request.getSession();
                    User user = (User) thisSession.getAttribute("user");
                %>                

                <div class="form-group form-user-info">

                    <input type="hidden" name="id" value="<%= user.getId()%>">
                    
                    <h2>Cuenta</h2>                   

                    <label for="username_id">Nombre de Usuario*</label>
                    <input type="text" name="username" id="username_id" value="<%= user.getUsername()%>" required>

                    <label for="password_id">Contraseña*</label>
                    <input type="text" name="password" id="password_id" value="<%= user.getPassword()%>" required>

                </div>                    

                <input type="submit" value="Modificar Usuario" class="submit-btn">

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