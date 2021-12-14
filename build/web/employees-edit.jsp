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

            <input type=checkbox id="show">
            <label class="show-btn" for="show">Editar Empleado</label>

            <!-- Form to create new employees -->
            <form action="SvEmployeeEdit" method="GET">
                <%
                    HttpSession thisSession = request.getSession();
                    Employee employee = (Employee) thisSession.getAttribute("employee");
                    User user_fk = (User) thisSession.getAttribute("user_fk");

                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                    String birthdate = DATE_FORMAT.format(employee.getBirthdate());
                %>

                <div class="form-group form-personal-info">

                    <input type="hidden" name="id" value="<%= employee.getId()%>">

                    <h2>Informacion personal</h2>                    

                    <label for="first_name_id">Nombre*</label>
                    <input type="text" name="first_name" id="first_name_id" value="<%= employee.getFirst_name()%>" required>

                    <label for="last_name_id">Apellido*</label>
                    <input type="text" name="last_name" id="last_name_id" value="<%= employee.getLast_name()%>" required>

                    <label for="street_id">Dirección*</label>
                    <input type="text" name="street" id="street_id" value="<%= employee.getStreet()%>" required>

                    <label for="dni_id">DNI*</label>
                    <input type="number" name="dni" id="dni_id" value="<%= employee.getDni()%>" required>

                    <label for="birthdate_id">Fecha de nacimiento*</label>
                    <input type="date" name="birthdate" value="<%= birthdate%>" required>

                    <label for="nationality_id">Nacionalidad*</label>
                    <input type="text" name="nationality" id="nationality_" value="<%= employee.getNationality()%>" required>

                    <label for="cellphone_id">Telefono*</label>
                    <input type="text" name="cellphone" id="cellphone_id" value="<%= employee.getCellphone()%>" required>

                    <label for="email_id">Email*</label>
                    <input type="email" name="email" id="email_id" value="<%= employee.getEmail()%>" required>

                </div>

                <div class="form-group form-employee-info">

                    <h2>Informacion laboral</h2>

                    <label for="position_id">Cargo*</label>
                    <input type="text" name="position" id="position_id" value="<%= employee.getPosition()%>" required>

                    <label for="salary_id">Salario*</label>
                    <input type="number" step=".01" name="salary" id="salary_id" value="<%= employee.getSalary()%>" required>

                </div>
                <div class="form-group form-user-info">

                    <h2>Cuenta</h2>

                    <label for="username_id">Nombre de Usuario*</label>
                    <input type="text" name="username" id="username_id" value="<%= user_fk.getUsername()%>" required>

                    <label for="password_id">Contraseña*</label>
                    <input type="text" name="password" id="password_id" value="<%= user_fk.getPassword()%>" required>
                    
                </div>

                <input type="submit" value="Modificar Empleado" class="submit-btn">
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