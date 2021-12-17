<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/index.css">
        
        <link rel="shortcut icon" href="https://img.icons8.com/external-becris-lineal-color-becris/64/000000/external-analytics-digital-economy-becris-lineal-color-becris-3.png" type="image/x-icon">
        
        <title>Agencia de Turismo</title>

    </head>

    <body>

        <%
            HttpSession thisSession = request.getSession();
            String user = (String) thisSession.getAttribute("username");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
        %> 

        <nav class="navbar">
            <section class="buttons">
                <div class="outer button">
                    <a href="index.jsp">
                        HOME
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button" title="ola ke mira">
                    <a target="_blank" href="https://youtu.be/dQw4w9WgXcQ">
                        easter-egg
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button">
                    <a href="https://github.com/gaston38kpo/servicio-turistico">
                        GITHUB
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button">
                    <a href="https://www.linkedin.com/in/gaston-giacobini/">
                        SOBRE MI
                    </a>
                    <span></span>
                    <span></span>
                </div>
            </section>
            <section class="username-nav">
                <p>Bienvenido <strong><%= request.getSession().getAttribute("username")%></strong> !</p>
            </section>
        </nav>

        <section class="container-index">
            <div class="left-box">
                <div class="btn"><a href="users.jsp">USUARIOS</a></div>
                <div class="btn"><a href="employees.jsp">EMPLEADOS</a></div>
                <div class="btn"><a href="clients.jsp">CLIENTES</a></div>
            </div>
            <div class="right-box">
                <div class="btn"><a href="services.jsp">SERVICIOS</a></div>
                <div class="btn"><a href="packages.jsp">PAQUETES</a></div>
                <div class="btn"><a href="sales.jsp">VENTAS</a></div>
            </div>

        </section>
        <footer class="box-size">
            <p>
                Hecho con &hearts; por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
            </p>
        </footer>

        <% }%>

    </body>

</html>