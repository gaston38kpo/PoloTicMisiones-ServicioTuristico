package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.User;

@WebServlet(name = "SvUser", urlPatterns = {"/SvUserCreate",
    "/SvUserDelete", "/SvUserEdit", "/SvUserRead", "/SvUserSession", "/SvUserLogout"})
public class SvUser extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //<editor-fold defaultstate="collapsed" desc="[GET]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        String username;
        String password;
        int id;

//</editor-fold>
        switch (action) {
            case "/SvUserCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvUserDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvUserEdit":
                //<editor-fold defaultstate="collapsed" desc="[GET]EDIT">

                // Se almacena el ID
                id = Integer.parseInt(request.getParameter("id"));

                // Almacenando los nuevos datos
                username = request.getParameter("username");
                password = request.getParameter("password");

                // Traigo el objeto con su respectivo ID
                User user = control.searchUser(id);

                // Asignacion de los datos anteriormente almacenados al objeto
                user.setUsername(username);
                user.setPassword(password);

                // Se envia el objeto con los nuevos datos a la controladora para persistirlo
                control.updateUser(user);

                // Regresa a la pagina para obervar el cambio
                response.sendRedirect("users.jsp");

//</editor-fold>
                break;
            case "/SvUserRead":
                //<editor-fold defaultstate="collapsed" desc="[GET]READ(Empty)">

//</editor-fold>
                break;
            case "/SvUserSession":
                //<editor-fold defaultstate="collapsed" desc="[GET]SESSION(Empty)">

//</editor-fold>
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //<editor-fold defaultstate="collapsed" desc="[POST]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int id;
        String username;
        String password;

        HttpSession thisSession;
        List<User> userList;

//</editor-fold>
        switch (action) {
            case "/SvUserCreate":
                //<editor-fold defaultstate="collapsed" desc="[POST]CREATE">

                // Almacenando los nuevos datos
                username = request.getParameter("username");
                password = request.getParameter("password");

                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("password", password);

                // Envio de datos a la controladora 
                control.createUser(username, password);

                // Redirecciona a si misma para ver el nuevo dato en la tabla.
                response.sendRedirect("users.jsp");

//</editor-fold>
                break;
            case "/SvUserDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id de ese momento del ciclo
                id = Integer.parseInt(request.getParameter("id"));

                // Se envia el dato a la controladora 
                control.deleteUser(id);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("users.jsp");

//</editor-fold>
                break;
            case "/SvUserEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">

                // Se almacena el ID
                id = Integer.parseInt(request.getParameter("id"));

                // Traigo el objeto 
                User user = control.searchUser(id);

                // Almaceno el objeto en la sesion
                thisSession = request.getSession();
                thisSession.setAttribute("user", user);

                // Redireccion al formulario de edicion
                response.sendRedirect("users-edit.jsp");

//</editor-fold>
                break;
            case "/SvUserRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                userList = control.getAllUsers();

                thisSession = request.getSession();
                thisSession.setAttribute("userList", userList);

                response.sendRedirect("users.jsp");

//</editor-fold>
                break;
            case "/SvUserSession":
                //<editor-fold defaultstate="collapsed" desc="[POST]SESSION">

                username = request.getParameter("username");
                password = request.getParameter("password");

                boolean authorized = control.verifyUser(username, password);

                if (authorized) {
                    thisSession = request.getSession(true);

                    thisSession.setAttribute("username", username);
                    thisSession.setAttribute("password", password);

                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }

//</editor-fold>
                break;
            case "/SvUserLogout":
                //<editor-fold defaultstate="collapsed" desc="[POST]LOGOUT">

                String logout = request.getParameter("logout");

                if (logout.equals("true") || logout == null) {
                    thisSession = request.getSession(true);

                    thisSession.setAttribute("username", null);
                    thisSession.setAttribute("password", null);
                    thisSession.setAttribute("logout", "false");

                    response.sendRedirect("login.jsp");
                }

//</editor-fold>
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
