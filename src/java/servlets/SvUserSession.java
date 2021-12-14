package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet(name = "SvUserSession", urlPatterns = {"/SvUserSession"})
public class SvUserSession extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean authorized = control.verifyUser(username, password);

        if (authorized) {
            HttpSession thisSession = request.getSession(true);

            thisSession.setAttribute("username", username);
            thisSession.setAttribute("password", password);

            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
