
package ModelDAO;

import DB.Connect;
import Interface.IUsuarioCRUD;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO implements IUsuarioCRUD{
    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Usuario user = new Usuario();

    @Override
    public List loginUser(Usuario user) {
         ArrayList<Usuario> list = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE correo = ? AND contra = ?";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getCorreo());
            ps.setString(2, user.getContra());
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setCorreo(user.getCorreo());
                usuario.setContra(user.getContra());
                usuario.setAdmin(rs.getBoolean("admin"));
                list.add(usuario);
            }
        } catch (Exception e) {
            
        }
        return list;
    }

    @Override
    public Usuario getUsuario(int id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean addUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteUsuario(int id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
