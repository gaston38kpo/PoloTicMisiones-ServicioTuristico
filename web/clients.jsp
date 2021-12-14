<%@page import="logica.Client"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
    </head>

    <body>
        <%
            HttpSession thisSession = request.getSession();
            String user = (String) thisSession.getAttribute("username");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>   
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
            <label class="show-btn" for="show">Registrar nuevo Cliente</label>

            <!-- Form to create new clientloyees -->
            <form id="content" action="SvClientCreate" method="POST">
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
                    <input type="text" name="nationality" id="nationality_"
                           placeholder="Argentina" required>

                    <label for="cellphone_id">Telefono*</label>
                    <input type="text" name="cellphone" id="cellphone_id"
                           placeholder="+54115551122" required>

                    <label for="email_id">Email*</label>
                    <input type="email" name="email" id="email_id"
                           placeholder="email@example.com" required>

                </div>

                <input type="submit" value="Crear Cliente" class="submit-btn">

            </form>

        </section>


        <!-- List all clientloyees on database -->

        <section class="log-section">
            <h2>Lista de Clientes</h2>
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
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="log-body">
                        <% Controladora control = new Controladora();
                        
                            List<Client> clientList = control.getAllClients();
                            
                            for (Client client : clientList) {
                                
                                SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                                String birthdate = DATE_FORMAT.format(client.getBirthdate());
                        %>
                        <tr>
                            <td>
                                <form class="form-edit" action="SvClientEdit" method="POST">
                                    <input type="hidden" name="id" value="<%=client.getId()%>">
                                    <button type="submit" class="edit-btn">Editar</button>
                                </form>
                            </td>
                            <td>
                                <%=client.getFirst_name()%>
                            </td>
                            <td>
                                <%=client.getLast_name()%>
                            </td>
                            <td>
                                <%=client.getStreet()%>
                            </td>
                            <td>
                                <%=client.getDni()%>
                            </td>
                            <td>
                                <%=birthdate%>
                            </td>
                            <td>
                                <%=client.getNationality()%>
                            </td>
                            <td>
                                <%=client.getCellphone()%>
                            </td>
                            <td>
                                <%=client.getEmail()%>
                            </td>
                            <td>
                                <form class="form-delete" action="SvClientDelete" method="POST">
                                    <input type="hidden" name="id" value="<%=client.getId()%>">
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
    <% }%>
</body>
</html>