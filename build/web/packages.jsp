<%@page import="logica.Package"%>
<%@page import="java.util.List"%>
<%@page import="logica.Service"%>
<%@page import="logica.Controladora"%>
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

            <!-- Hide/Show Form -->

            <input type=checkbox id="show">
            <label class="show-btn" for="show">Registrar nuevo Paquete</label>

            <!-- Form to create new package -->

            <form id="content" action="SvPackageCreate" method="POST">
                <div class="form-group">

                    <h2>Paquete</h2>

                    <%
                        Controladora control = new Controladora();

                        List<Service> serviceList = control.getAllServices();

                        for (Service service : serviceList) {

                            String name = service.getName();
                    %>

                    <label  class="checkbox-label" >
                        <input 
                            type="checkbox" 
                            value="<%= service.getService_code()%>">
                        <%= name%>
                    </label>

                    <%}%>

                </div>

                <input type="submit" value="Crear Paquete" class="submit-btn">

            </form>

        </section>


        <!-- List all packages on database -->

        <section class="log-section">

            <h2>Lista de Paquetes</h2>

            <div class="table-wrapper">                
                <table class="fl-table">
                    
                    <thead class="log-header">
                        <tr>
                            <th></th>
                            <th>Codigo del paquete</th>                            
                            <th>Servicios incluidos</th>                            
                            <th></th>
                        </tr>
                    </thead>

                    <tbody class="log-body">
                        <%
                            List<Package> packageList = control.getAllPackages();

                            for (Package pkg : packageList) {

                                List<Service> packageServiceList = pkg.getList_of_services();

                                int package_code = pkg.getPackage_code();
                        %>
                        <tr>
                            <td>
                                <form class="form-edit" action="SvPackageEdit" method="POST">
                                    <input type="hidden" name="id" value="<%= package_code%>">
                                    <button type="submit" class="edit-btn">Editar</button>
                                </form>
                            </td>
                            <td><%= package_code%></td>
                            <td>
                                <select>

                                    <%for (Service pkgService : packageServiceList){%>

                                    <option>
                                        <%= pkgService.getName()%>
                                    </option>

                                    <% }%>
                                </select> 
                            </td>
                            <td>
                                <form class="form-delete" action="SvPackageDelete" method="POST">
                                    <input type="hidden" name="id" value="<%= package_code%>">
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