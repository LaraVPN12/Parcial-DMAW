
package Controller;

import Model.Auto;
import ModelDAO.AutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AutoController", urlPatterns = {"/AutoController"})
public class AutoController extends HttpServlet {
    Auto auto = new Auto();
    AutoDAO autoDAO = new AutoDAO();
    


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AutoController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AutoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String marca, modelo, color, tipoAuto, transmision, combustible, imagen;
        int capacidad;
        String action = request.getParameter("action");
        
        switch(action.toLowerCase()) {
                case "agregar":
                int id = 0;
                marca = request.getParameter("marca");
                modelo = request.getParameter("modelo");
                color = request.getParameter("color");
                capacidad = Integer.parseInt(request.getParameter("capacidad"));
                tipoAuto = request.getParameter("tipoAuto");
                switch(tipoAuto){
                    case "HATCHBACK":
                        id = 1;
                        break;
                    case "SEDAN":
                        id = 2;
                        break;
                    case "SUV":
                        id = 3;
                        break;
                    case "CAMIONETA":
                        id = 4;
                        break;
                }
                transmision = request.getParameter("transmision");
                combustible = request.getParameter("combustible");
                imagen = request.getParameter("imagen");
                
                auto.setMarca(marca);
                auto.setModelo(modelo);
                auto.setColor(color);
                auto.setCapacidad(capacidad);
                auto.setId_tipo_auto(id);
                auto.setTransmision(transmision);
                auto.setTipo_combustible(combustible);
                auto.setImagen(imagen);
                
            {
                try {
                    autoDAO.addAuto(auto);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AutoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                
                break;
                default:
                throw new AssertionError();

            }
        response.sendRedirect("views/admin/admAutos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
