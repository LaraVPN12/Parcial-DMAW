package Controller;

import Model.Usuario;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Cipher;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author deuseli
 */
@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

    String login = "views/login.jsp";
    String home = "views/cliente/cliHome.jsp";
    String registerUsuario = "views/register.jsp";
    String updateUsuario = "views/cliente/cliEditarUsuario.jsp";
    String deleteUsuario = "";
    Usuario usuario = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String nombre, apellido, correo, contra;
        String access = "";
        String action = request.getParameter("action");
        switch (action.toLowerCase()) {
            case "registrarse":
                nombre = request.getParameter("nombre").toUpperCase();
                apellido = request.getParameter("apellido").toUpperCase();
                correo = request.getParameter("correo");
                contra = request.getParameter("contra");

                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setCorreo(correo);
                usuario.setContra(contra);

                 {
                    try {
                        dao.addUsuario(usuario);
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                access = "";
                break;

            case "registration":
                access = registerUsuario;
                break;
            case "update":
                access = updateUsuario;
                break;
            case "actualizar":
                nombre = request.getParameter("nombre").toUpperCase();
                apellido = request.getParameter("apellido").toUpperCase();
                correo = request.getParameter("correo");
                contra = request.getParameter("contra");

                usuario.setId_usuario(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setCorreo(correo);
                usuario.setContra(contra);

                dao.updateUsuario(usuario);

                session.setAttribute("correo", usuario.getCorreo());
                session.setAttribute("contra", usuario.getContra());
                session.setAttribute("nombre", usuario.getNombre());
                session.setAttribute("apellido", usuario.getApellido());

                access = home;
                break;
            case "delete":

                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect(access);

    }

//    private String encryptPassword(String password, String email) throws Exception {
//        SecretKeySpec secretKey = generateKey(email);
//        Cipher cipher = Cipher.getInstance("AES");
//        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
//        byte[] passwordBytes = password.getBytes("UTF-8");
//        byte[] passwordEncrypted = cipher.doFinal(passwordBytes);
//        String passwordEncryptedString = Base64.encode(passwordEncrypted);
//    }
//
//    private SecretKeySpec generateKey(String password) throws Exception {
//        MessageDigest code = MessageDigest.getInstance("SHA-256");
//        byte[] key = password.getBytes("UTF-8");
//        key = code.digest(key);
//        SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
//        return secretKey;
//    }
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
