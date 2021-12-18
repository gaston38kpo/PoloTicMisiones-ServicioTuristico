<%@page import="logica.Sale"%>
<%@page import="logica.Service"%>
<%@page import="java.text.SimpleDateFormat"%>
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

    </head>

    <body>

        <%
            HttpSession thisSession = request.getSession();

            String userSession = (String) thisSession.getAttribute("username");

            if (userSession == null) {
                response.sendRedirect("login.jsp");
            } else if (userSession != null) {
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
            <section class="profits-nav">
                <% Sale saleEarnings = new Sale(); %>
                <span>Promedio de Ganancias Diarias : &dollar;<%= saleEarnings.getDailyEarnings() %></span>
                <span>Promedio de Ganancias Mensuales : &dollar;<%= saleEarnings.getMonthlyEarnings() %></span>
            </section>
            <section class="username-nav">
                <%
                    thisSession = request.getSession();

                    userSession = (String) thisSession.getAttribute("username");

                    if (userSession != null) {
                %>
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
                <form class="container-form" action="SvServiceEdit" method="GET">
                    <%
                        thisSession = request.getSession();
                        Service service = (Service) thisSession.getAttribute("service");

                        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                        String date_service = DATE_FORMAT.format(service.getDate_service());
                    %>

                    <input type="hidden" name="service_code" value="<%= service.getService_code()%>">

                    <h2>Editar Servicio</h2>

                    <br>

                    <h2>Informacion del Servicio</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="name" value="<%= service.getName()%>" required>
                                <span class="text">Nombre*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="destination" value="<%= service.getDestination()%>" required>
                                <span class="text">Destino*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="number" step="0.01" name="cost_service" value="<%= service.getCost_service()%>" required>
                                <span class="text">Costo*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="date" name="date_service" value="<%= date_service%>"required>
                                <span class="text">Fecha*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box textarea">
                                <textarea name="description" required><%= service.getDescription()%></textarea>
                                <span class="text">Descripci&oacute;n*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>


                    <div class="row100">
                        <div class="col">
                            <input type="submit" value="Editar" class="submit-btn">
                        </div>
                    </div>

                </form>

            </section>


        </main>
        <footer class="box-size">
            <p>
                Hecho con &hearts; por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
            </p>
        </footer>

        <% }%>
        <script src="assets/js/global.js"></script>
    </body>

</html>