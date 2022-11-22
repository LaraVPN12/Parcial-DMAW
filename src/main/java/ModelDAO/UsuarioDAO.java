
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
                usuario.setHasrented(rs.getBoolean("hasRented"));
                list.add(usuario);
            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    @Override
    public List<Usuario> getUsuarios() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE admin = false";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContra(rs.getString("contra"));
                usuario.setAdmin(rs.getBoolean("admin"));
                usuario.setHasrented(rs.getBoolean("hasRented"));
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
        String sql = "INSERT INTO usuario (nombre, apellido, correo, contra) VALUES(?, ?, ?, ?)";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getContra());
            ps.executeUpdate();
            return true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre=?, apellido=?, correo=?, contra=? WHERE id_usuario ='"+usuario.getId_usuario()+"' ";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getContra());
            ps.executeUpdate();
            return true;
        }catch(Exception e) {
            
        }
        return false;
    }

    @Override
    public boolean deleteUsuario(int id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean updateHasRentedTrue(int id_usuario) {
        String sql = "UPDATE usuario SET hasrented=true WHERE id_usuario ='"+id_usuario+"' ";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(Exception e) {
            
        }
        return false;
    }
}
