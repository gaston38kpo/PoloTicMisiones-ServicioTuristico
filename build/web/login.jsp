<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/login.css" />
    <link rel="shortcut icon" type="image/jpg" href="https://img.icons8.com/fluent/30/000000/doge.png"/>
    <title>Login Screen</title>
  </head>
  <body>

    <main>

      <section class="login-zone">

        <i class="fab fa-keycdn fa-7x"></i>
        <h1>Cuenta Turismo</h1>

        <form action="SvUserSession" method="POST">
          <input type="text" name="username" class="userInput" placeholder="Nombre usuario" />
          <br />
          <div>
            <input type="password" name="password" class="passInput" placeholder="Contrase&ntilde;a" />
            <input type="submit" class="btnSubmit" title="GO!" value="&RightTriangle;">
          </div>
        </form>

      </section>

      <section class="login-options">
        <a href="users.jsp" >Registro Solo Usuario</a>
        <a href="employees.jsp" >Registro Empleado + Usuario</a>        
      </section>

      <div>Imagen de <a href="https://pixabay.com/es/users/umutizgi-11024074/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=5552482">Umut İzgi</a> en <a href="https://pixabay.com/es/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=5552482">Pixabay</a></div>
    
    </main>

  </body>
</html>
