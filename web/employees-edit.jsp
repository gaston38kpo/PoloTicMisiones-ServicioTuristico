<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.User"%>
<%@page import="logica.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <section class="username-nav">
                <p>Bienvenido <strong>
                        <%= request.getSession().getAttribute("username")%>
                    </strong> !</p>
            </section>
        </nav>

        <main class="main-crud">

            <section class="section-form">

                <!-- Formulario de creacion -->
                <form class="container-form" action="SvEmployeeEdit" method="GET">

                    <%
                        thisSession = request.getSession();
                        Employee employee = (Employee) thisSession.getAttribute("employee");
                        User user_fk = (User) thisSession.getAttribute("user_fk");

                        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                        String birthdate = DATE_FORMAT.format(employee.getBirthdate());
                    %>

                    <input type="hidden" name="id" value="<%= employee.getId()%>">

                    <h2>Editar Empleado</h2>
                    
                    <br>
                    
                    <h2>Informacion personal</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="first_name" value="<%= employee.getFirst_name()%>" required>
                                <span class="text">Nombre*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="last_name" value="<%= employee.getLast_name()%>" required>
                                <span class="text">Apellido*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="street" value="<%= employee.getStreet()%>" required>
                                <span class="text">Direcci&oacute;n*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="number" name="dni" value="<%= employee.getDni()%>" required>
                                <span class="text">DNI*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="date" name="birthdate" value="<%= birthdate%>" required>
                                <span class="text">Fecha de nacimiento*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="nationality" value="<%= employee.getNationality()%>" required>
                                <span class="text">Nacionalidad*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="cellphone" value="<%= employee.getCellphone()%>" required>
                                <span class="text">Telefono*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="email" name="email" value="<%= employee.getEmail()%>" required>
                                <span class="text">Email*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <h2>Informacion laboral</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="position" value="<%= employee.getPosition()%>" required>
                                <span class="text">Cargo*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="number" name="salary" step="0.01" value="<%= employee.getSalary()%>" required>
                                <span class="text">Salario*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="username" value="<%= user_fk.getUsername()%>" required>
                                <span class="text">Nombre de Usuario*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="password" value="<%= user_fk.getPassword()%>" required>
                                <span class="text">Contrase&ntilde;a*</span>
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
    </body>

</html>