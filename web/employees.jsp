<%@page import="logica.User"%>
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

            <input type=checkbox id="show">
            <label class="show-btn" for="show">Registrar nuevo empleado</label>

            <!-- Form to create new employees -->

            <form id="content" action="SvEmployeeCreate" method="POST">
                <div class="form-group form-personal-info">
                    <h2>Informacion personal</h2>
                    <label for="first_name_id">Nombre*</label>
                    <input type="text" name="first_name" id="first_name_id" placeholder="Tony"
                           required>

                    <label for="last_name_id">Apellido*</label>
                    <input type="text" name="last_name" id="last_name_id" placeholder="Stark"
                           required>

                    <label for="street_id">Dirección*</label>
                    <input type="text" name="street" id="street_id" placeholder="Calle 123"
                           required>

                    <label for="dni_id">DNI*</label>
                    <input type="number" name="dni" id="dni_id" placeholder="12345678" required>

                    <label for="birthdate_id">Fecha de nacimiento*</label>
                    <input type="date" name="birthdate" id="birthdate_id" required>

                    <label for="nationality_id">Nacionalidad*</label>
                    <input type="text" name="nationality" id="nationality_" placeholder="Argentina" required>

                    <label for="cellphone_id">Telefono*</label>
                    <input type="text" name="cellphone" id="cellphone_id" placeholder="+54115551122" required>

                    <label for="email_id">Email*</label>
                    <input type="email" name="email" id="email_id" placeholder="email@example.com" required>

                </div>

                <div class="form-group form-employee-info">

                    <h2>Informacion laboral</h2>

                    <label for="position_id">Cargo*</label>
                    <input type="text" name="position" id="position_id" placeholder="Vendedor, Administrator, etc" required>

                    <label for="salary_id">Salario*</label>
                    <input type="number" step=".01" name="salary" id="salary_id" placeholder="50000" required>
                </div>
                <div class="form-group form-user-info">

                    <h2>Cuenta</h2>

                    <label for="username_id">Nombre de Usuario*</label>
                    <input type="text" name="username" id="username_id" placeholder="TonyStark" required>

                    <label for="password_id">Contraseña*</label>
                    <input type="password" name="password" id="password_id" placeholder="********" required>

                </div>

                <input type="submit" value="Crear Empleado" class="submit-btn">

            </form>

        </section>


        <!-- List all employees on database -->

        <section class="log-section">

            <h2>Lista de Empleados</h2>

            <div class="table-wrapper">
                <table class="fl-table">

                    <thead class="log-header">
                        <tr>

                            <th></th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Direccion</th>
                            <th>DNI</th>
                            <th>F. de Nac</th>
                            <th>Nacionalidad</th>
                            <th>Celular</th>
                            <th>Email</th>
                            <th>Cargo</th>
                            <th>Salario</th>
                            <th>Usuario</th>
                            <th>Contrase&ntilde;a</th>
                            <th></th>

                        </tr>
                    </thead>

                    <tbody class="log-body">
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

                            <td>
                                <form class="form-edit" action="SvEmployeeEdit" method="POST">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <button type="submit" class="edit-btn">Editar</button>
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
                            <td>&dollar; <%= emp.getSalary()%></td>
                            <td><%= user.getUsername()%></td>
                            <td><%= user.getPassword()%></td>
                            <td>
                                <form class="form-delete" action="SvEmployeeDelete" method="POST">
                                    <input type="hidden" name="id" value="<%= id%>">
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