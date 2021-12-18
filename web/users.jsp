<%@page import="logica.Sale"%>
<%@page import="logica.User"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/index.css">
        <link rel="stylesheet" href="assets/css/form-neon.css">
        <link rel="stylesheet" href="assets/css/log-neon.css">

        <link rel="shortcut icon"
              href="https://img.icons8.com/external-becris-lineal-color-becris/64/000000/external-analytics-digital-economy-becris-lineal-color-becris-3.png"
              type="image/x-icon">

        <title>Agencia de Turismo</title>

        <style>
            .section-log {
                width: 50%;
            }
        </style>

    </head>

    <body>

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
            <section class="profits-nav">
                <%
                    HttpSession thisSession = request.getSession();

                    String userSession = (String) thisSession.getAttribute("username");

                    Sale saleEarnings = new Sale();
                    if (userSession != null) {
                %>
                <span>Promedio de Ganancias Diarias : &dollar;<%= saleEarnings.getDailyEarnings()%></span>
                <span>Promedio de Ganancias Mensuales : &dollar;<%= saleEarnings.getMonthlyEarnings()%></span>

                <%}%>
            </section>
            <section class="username-nav">
                <%
                    if (userSession != null) {%>
                <p>Bienvenido 
                    <strong>
                        <%= request.getSession().getAttribute("username")%>
                    </strong> !
                </p>
                <form id="form-logout" action="SvUserLogout" method="POST">
                    <input type="hidden" name="logout" value="true">
                    <button type="submit">
                        <img src="https://img.icons8.com/ios-glyphs/30/ffffff/logout-rounded-left.png"/>
                    </button>
                </form>

                <%}%>

            </section>
        </nav>

        <main class="main-crud">

            <section class="section-form">

                <!-- Formulario de creacion -->
                <form class="container-form" action="SvUserCreate" method="POST">
                    <h2>Nuevo Usuario</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="username" required>
                                <span class="text">Nombre de Usuario*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="password" name="password" required>
                                <span class="text">Contrase&ntilde;a*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <input type="submit" value="Crear" class="submit-btn">
                        </div>
                    </div>

                </form>

            </section>

            <%
                thisSession = request.getSession();

                userSession = (String) thisSession.getAttribute("username");

                if (userSession != null) { %>

            <!-- Tabla con todos los datos listados -->        
            <section class="section-log">

                <h1 contenteditable="true" class="title-log"><span>List&lt;&gt; Usuarios</span></h1>

                <table class="container">
                    <thead>
                        <tr>
                            <th><h1></h1></th>
                            <th><h1>Usuario</h1></th>
                            <th><h1>Password</h1></th>
                            <th><h1></h1></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Controladora control = new Controladora();

                            List<User> userList = control.getAllUsers();

                            for (User user : userList) {
                                int id = user.getId();
                        %>

                        <tr>
                            <td class="td-edit-btn">
                                <form class="form-edit" action="SvUserEdit" method="POST">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <button type="submit" class="edit-btn"><span>EDITAR</span></button>
                                </form>
                            </td>
                            <td><%=user.getUsername()%></td>
                            <td><%=user.getPassword()%></td>
                            <td class="td-delete-btn">
                                <form class="form-delete" action="SvUserDelete" method="POST">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <button type="submit" class="delete-btn"><span>ELIMINAR</span></button>
                                </form>
                            </td>
                        </tr>
                        <% }%>

                    </tbody>
                </table>

            </section>

        </main>
        <footer class="box-size">
            <p>
                Hecho con &hearts; por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
            </p>
        </footer>

        <% }%>
    </body>

</html>