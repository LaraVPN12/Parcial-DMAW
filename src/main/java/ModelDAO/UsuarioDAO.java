package ModelDAO;

import DB.Connect;
import Interface.IUsuarioCRUD;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO implements IUsuarioCRUD {

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
            ps.setString(2, getMD5(user.getContra()));
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setCorreo(user.getCorreo());
                usuario.setContra(user.getContra());
                usuario.setAdmin(rs.getBoolean("admin"));
                usuario.setHasrented(rs.getBoolean("hasrented"));
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
    public boolean addUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO usuario (nombre, apellido, correo, contra) VALUES(?, ?, ?, ?)";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, usuario.getNombre());
        ps.setString(2, usuario.getApellido());
        ps.setString(3, usuario.getCorreo());
        try {
            ps.setString(4, getMD5(usuario.getContra()));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean updateUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre=?, apellido=?, correo=?, contra=? WHERE id_usuario ='" + usuario.getId_usuario() + "' ";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, getMD5(usuario.getContra()));
            ps.executeUpdate();
            return true;
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean deleteUsuario(int id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean updateHasRentedTrue(int id_usuario) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE usuario SET hasrented=true WHERE id_usuario ='" + id_usuario + "' ";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }

    public boolean updateHasRentedFalse(int id_usuario) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE usuario SET hasrented=false WHERE (SELECT MAX(fecha_fin) FROM alquiler WHERE id_usuario = '" + id_usuario + "') < '" + new Date() + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
    
    public boolean getHasRented(int id_usuario) throws ClassNotFoundException, SQLException {
        boolean hasrented = false;
        String sql = "SELECT hasrented FROM usuario WHERE id_usuario = '" + id_usuario + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            hasrented = rs.getBoolean("hasrented");
        }
        return hasrented;
    }

    public String getMD5(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] encBytes = md.digest(password.getBytes());
        BigInteger num = new BigInteger(1, encBytes);
        String encPassword = num.toString(16);
        while (encPassword.length() < 32) {
            encPassword = "0" + encPassword;
        }
        return encPassword;
    }
}
