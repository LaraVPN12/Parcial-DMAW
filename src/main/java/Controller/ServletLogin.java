
package Controller;

import Model.Usuario;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario user = new Usuario();
        user.setCorreo(email);
        user.setContra(password);
        
        //Agregar a Lista
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> list = dao.loginUser(user);
        
        //Variable tipo Usuario para Iterador
        Usuario userIterator = null;
        HttpSession session = request.getSession();

        
        try (PrintWriter out = response.getWriter()) {
            if(list.isEmpty()) {
                String url = "index.jsp";
                session.setAttribute("errorLogin", "true");
                response.sendRedirect(url);
            } else {
                Iterator<Usuario> i = list.iterator();
                while(i.hasNext()) {
                    userIterator = i.next();
                    session.setAttribute("correo", userIterator.getCorreo());
                    session.setAttribute("contra", userIterator.getContra());
                    session.setAttribute("nombre", userIterator.getNombre());
                    session.setAttribute("apellido", userIterator.getApellido());
                    session.setAttribute("admin", userIterator.getAdmin().toString());
                    session.setAttribute("id_usuario", userIterator.getId_usuario());
                    response.sendRedirect("principal.jsp");
//                    if (userIterator.getAdmin()) {
//                        response.sendRedirect("views/admin/admHome.jsp");
//                    } else {
//                        response.sendRedirect("views/cliente/cliHome.jsp");
//                    }
                }
            }
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
