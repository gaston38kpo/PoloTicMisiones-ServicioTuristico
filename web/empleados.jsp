<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/empleados.css">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="form-section">
        <form action="SvEmployee" method="POST">
            <fieldset>
                <legend>Formulario de registro de empleados</legend>

                <label for="first_name_id">Nombre*</label>
                <input type="text" name="first_name" id="first_name_id" placeholder="Tony" required>

                <label for="last_name_id">Apellido*</label>
                <input type="text" name="last_name" id="last_name_id" placeholder="Stark" required>
                
                <label for="street_id">Dirección*</label>
                <input type="text" name="street" id="street_id" placeholder="Calle 123" required>

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

                <label for="position_id">Cargo*</label>
                <input type="text" name="position" id="position_id" placeholder="Vendedor, Administrator, etc" required>

                <label for="salary_id">Salario*</label>
                <input type="number" name="salary" id="salary_id" placeholder="50000" required>

                <label for="username_id">Nombre de Usuario*</label>
                <input type="text" name="username" id="username_id" placeholder="TonyStark" required>

                <label for="password_id">Contraseña*</label>
                <input type="password" name="password" id="password_id" placeholder="********" required>

                
                <input type="submit" value="Entrar">
            </fieldset>
        </form>
    </section>
    </body>
</html>
