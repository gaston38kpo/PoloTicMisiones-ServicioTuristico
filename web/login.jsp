<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/css/log-in.css">
    <title>LOG-IN</title>
</head>

<body>
    <section class="login-box">

        <h1>LOGIN</h1>
        <form action="SvUserSession" method="POST">
            <div class="user-box">
                <input type="text" name="username" id="username_id" required>
                <label for="username_id">Nombre de Usuario</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" id="password_id" required>
                <label for="password_id">Contrase&ntilde;a</label>
            </div>            
            <button type="submit">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                LOGIN
            </button>
            <a href="users.jsp">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                REGISTRARSE
            </a>
        </form>

    </section>
</body>

</html>