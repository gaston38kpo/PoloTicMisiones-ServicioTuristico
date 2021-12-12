<%@page import="logica.User"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="logica.Employee" %>
<%@page import="java.util.List" %>
<%@page import="logica.Controladora" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/log-manager.css">
        <link rel="stylesheet" href="assets/css/form.css">

        <title>index</title>
        <style>
            .table-wrapper{
                max-width: 60%;
                margin: 0 auto;
            }
            .box-size {
                max-width: 60%;
                min-width: 825px;
            }
        </style>
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
            <label class="show-btn" for="show">Registrar nuevo usuario</label>

            <!-- Form to create new users -->
            <form id="content" action="SvUserCreate" method="POST">                
                <div class="form-group form-user-info">

                    <h2>Cuenta</h2>

                    <p style="text-align: center">La cuenta se crea en la seccion empleados, crear una aqui generará una cuenta huerfana!!<br><br> Usted queda avisado! </p>

                    <label for="username_id">Nombre de Usuario*</label>
                    <input type="text" name="username" id="username_id" placeholder="TonyStark" required>

                    <label for="password_id">Contraseña*</label>
                    <input type="password" name="password" id="password_id" placeholder="********" required>
                    
                </div>
                <input type="submit" value="Crear Usuario" class="submit-btn">
            </form>
        </section>

        
        <!-- List all employees on database -->

        <section class="log-section">
            <h2>Lista insegura de Usuarios</h2>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead class="log-header">
                        <tr>
                            <th></th>
                            <th>USUARIO</th>
                            <th>PASSWORD</th>                                                    
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="log-body">
                        <% Controladora control = new Controladora();
                            List<User> userList = control.getAllUsers();
                            for (User user : userList) {
                        %>                                                   
                        <tr>
                            <td>
                                <form class="form-edit" action="SvUserEdit" method="POST" name="formEditUser">
                                        <input type="hidden" name="id" value="<%= user.getId()%>">
                                        <button type="submit" class="edit-btn">Editar</button>
                                </form>
                            </td>
                            <td>
                                <%=user.getUsername()%>
                            </td>
                            <td>
                                <%=user.getPassword()%>
                            </td>                            
                            <td>
                                <form class="form-delete" action="SvUserDelete" method="POST" name="formDeleteUser">
                                    <input type="hidden" name="id" value="<%= user.getId()%>">
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