<%@page import="logica.Sale"%>
<%@page import="logica.Employee"%>
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
                <form class="container-form" action="SvEmployeeCreate" method="POST">

                    <h2>Nuevo Empleado</h2>

                    <br>

                    <h2>Informacion personal</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="first_name" required>
                                <span class="text">Nombre*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="last_name" required>
                                <span class="text">Apellido*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="street" required>
                                <span class="text">Direcci&oacute;n*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="number" name="dni" required>
                                <span class="text">DNI*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="date" name="birthdate" required>
                                <span class="text">Fecha de nacimiento*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="nationality" required>
                                <span class="text">Nacionalidad*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="cellphone" required>
                                <span class="text">Telefono*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="email" name="email" required>
                                <span class="text">Email*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

                    <h2>Informacion laboral</h2>

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="text" name="position" required>
                                <span class="text">Cargo*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-box">
                                <input type="number" name="salary" step="0.01" required>
                                <span class="text">Salario*</span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>

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


            <!-- Tabla con todos los datos listados -->        
            <section class="section-log">

                <h1 contenteditable="true" class="title-log"><span>List&lt;&gt; Empleados</span></h1>

                <table class="container">
                    <thead>
                        <tr>
                            <th><h1></h1></th>
                            <th><h1>Nombre</h1></th>
                            <th><h1>Apellido</h1></th>
                            <th><h1>Direccion</h1></th>
                            <th><h1>DNI</h1></th>
                            <th><h1>F. de Nac</h1></th>
                            <th><h1>Nacionalidad</h1></th>
                            <th><h1>Celular</h1></th>
                            <th><h1>Email</h1></th>
                            <th><h1>Cargo</h1></th>
                            <th><h1>Salario</h1></th>
                            <th><h1>Usuario</h1></th>
                            <th><h1>Contrase&ntilde;a</h1></th>
                            <th><h1></h1></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Controladora control = new Controladora();
                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

                            List<Employee> employeeList = control.getAllEmployees();

                            for (Employee emp : employeeList) {
                                int id = emp.getId();
                                String birthdate = DATE_FORMAT.format(emp.getBirthdate());
                                User user = emp.getUser_fk();
                        %>

                        <tr>
                            <td class="td-edit-btn">
                                <form class="form-edit" action="SvEmployeeEdit" method="POST">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <button type="submit" class="edit-btn"><span>EDITAR</span></button>
                                </form>
                            </td>
                            <td><%= emp.getFirst_name()%></td>
                            <td><%= emp.getLast_name()%></td>
                            <td><%= emp.getStreet()%></td>
                            <td><%= emp.getDni()%></td>
                            <td><%= birthdate%></td>
                            <td><%= emp.getNationality()%></td>
                            <td><%= emp.getCellphone()%></td>
                            <td><%= emp.getEmail()%></td>
                            <td><%= emp.getPosition()%></td>
                            <td>&dollar;<%= emp.getSalary()%></td>
                            <td><%= user.getUsername()%></td>
                            <td><%= user.getPassword()%></td>
                            <td class="td-delete-btn">
                                <form class="form-delete" action="SvEmployeeDelete" method="POST" >
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