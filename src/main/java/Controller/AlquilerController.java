package Controller;

import Model.Alquiler;
import ModelDAO.AlquilerDAO;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author deuseli
 */
@WebServlet(name = "AlquilerController", urlPatterns = {"/AlquilerController"})
public class AlquilerController extends HttpServlet {

    AlquilerDAO alquilerDAO = new AlquilerDAO();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    Alquiler alquiler = new Alquiler();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlquilerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AlquilerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        switch (action.toLowerCase()) {
            case "alquilar":
                Date fecha_fin = null;
                try {
                    fecha_fin = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fin_date"));
                } catch (ParseException ex) {
                    Logger.getLogger(AlquilerController.class.getName()).log(Level.SEVERE, null, ex);
                }

                int id_auto = Integer.parseInt(request.getParameter("id_auto"));
                double precio = Double.parseDouble(request.getParameter("precio").trim());
                int miliseconds = 86400000;
                int days = (int) ((fecha_fin.getTime() - new Date().getTime()) / miliseconds + 1);
                double total = 100 + days * precio;

                alquiler.setId_auto(id_auto);
                alquiler.setId_usuario(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                alquiler.setFecha_inicio(new Date());
                alquiler.setFecha_fin(fecha_fin);
                alquiler.setTotal(total);
                
            {
                try {
                    alquilerDAO.addAlquiler(alquiler);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AlquilerController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                

                try {
                    alquilerDAO.addAlquiler(alquiler);
                    usuarioDAO.updateHasRentedTrue(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                    session.setAttribute("hasrented", "true");
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AlquilerController.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("/Parcial-DMAW/views/cliente/cliHistorial.jsp");
                break;

            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
