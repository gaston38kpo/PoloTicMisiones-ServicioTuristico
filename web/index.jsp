<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/css/style.css">

    <title>index</title>
</head>

<body>
    <%        
    HttpSession thisSession = request.getSession();
    String user = (String) thisSession.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {
    %>    

    <div class="logobar-default box-size">
        <a href="index.jsp">
            <h1>Agencia de Turismo UwU</h1>
        </a>
        <p>Konnichiwa <%= request.getSession().getAttribute("username")%>!</p>
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
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/bmo.png" />
            <a class="users-link main-link" href="users.jsp">
                <h3>USUARIOS</h3>
            </a>
            <p>Administre todos los usuarios nuevos con los que contamos! Para crear usuarios nuevos por favor hagalo creando un empleado nuevo! </p>
        </article>
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/finn.png" />
            <a class="employees-link main-link" href="employees.jsp">
                <h3>EMPLEADOS</h3>
            </a>
            <p>Aqui puede manejar todos los empleados, cuidadito aqui. </p>
        </article>
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/ice-king.png" />
            <a class="clients-link main-link" href="clients.jsp">
                <h3>CLIENTES</h3>
            </a>
            <p>Aqui se listaran y manejaran todos los clientes</p>
        </article>
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/lumpy-space-princess.png" />
            <a class="services-link main-link" href="services.jsp">
                <h3>SERVICIOS</h3>
            </a>
            <p>Queres saber que servicios hay? pues no esperes mas y pincha el boton!</p>
        </article>
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/princess-bubblegum.png" />
            <a class="packages-link main-link" href="packages.jsp">
                <h3>PAQUETES DE SERVICIOS</h3>
            </a>
            <p>Paquetes ! A todos nos gustan los empaques con cosas dentro, animate y revisalos !</p>
        </article>
        <article>
            <img src="https://img.icons8.com/fluency/144/000000/jake.png" />
            <a class="sales-link main-link" href="sales.jsp">
                <h3>VENTAS</h3>
            </a>
            <p>Desde esta zona podra ver todas las ventas !</p>
        </article>
    </main>


    <footer class="box-size">
        <p>
            Hecho con ♥ por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
        </p>
    </footer>

    <% } %>
</body>
</html>
