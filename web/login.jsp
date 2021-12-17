<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/log-in.css">

        <link rel="shortcut icon" href="https://img.icons8.com/external-becris-lineal-color-becris/64/000000/external-analytics-digital-economy-becris-lineal-color-becris-3.png" type="image/x-icon">

        <title>LOG-IN</title>

    </head>

    <body>
        <section class="login-box">

            <h1>LOGIN</h1>
            <form name="loginform" class="login-form" action="SvUserSession" method="POST">
                <div class="user-box">
                    <input type="text" name="username" id="username_id" required>
                    <label for="username_id">Nombre de Usuario</label>
                </div>
                <div class="user-box">
                    <input type="password" name="password" id="password_id" required>
                    <label for="password_id">Contrase&ntilde;a</label>
                </div>            
                <button type="submit" onclick="document.loginform.action = 'SvUserSession'">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    LOGIN
                </button>
                <button type="submit" onclick="document.loginform.action = 'SvUserCreate'">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    REGISTER & LOGIN
                </button>
            </form>

        </section>
    </body>

</html>