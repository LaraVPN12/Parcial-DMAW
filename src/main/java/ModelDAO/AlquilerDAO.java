package ModelDAO;

import DB.Connect;
import Interface.IAlquilerCRUD;
import Model.Alquiler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author deuseli
 */
public class AlquilerDAO implements IAlquilerCRUD {
    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List getAlquileres() {
        ArrayList<Alquiler> list = new ArrayList<>();
        String sql = "SELECT * FROM alquiler";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Alquiler alquiler = new Alquiler();
                alquiler.setId_auto(rs.getInt("id_auto"));
                alquiler.setId_usuario(rs.getInt("id_usuario"));
                alquiler.setFecha_inicio(rs.getDate("fecha_inicio"));
                alquiler.setFecha_fin(rs.getDate("fecha_fin"));
                alquiler.setTotal(rs.getDouble("total"));
                
                list.add(alquiler);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List getAlquileresByUserId(int id_usuario) {
        ArrayList<Alquiler> list = new ArrayList<>();
        String sql = "SELECT * FROM alquiler WHERE id_usuario = '" + id_usuario + "' ORDER BY fecha_fin DESC";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Alquiler alq = new Alquiler();
                alq.setId_auto(rs.getInt("id_auto"));
                alq.setId_usuario(rs.getInt("id_usuario"));
                alq.setFecha_inicio(rs.getDate("fecha_inicio"));
                alq.setFecha_fin(rs.getDate("fecha_fin"));
                alq.setTotal(rs.getDouble("total"));
                list.add(alq);
            }
            return list;
        } catch (Exception e) {
        }
        return list;
    }
    
    public Boolean deleteAlquileresByUsuario(int id_usuario) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM alquiler WHERE id_usuario = '" + id_usuario + "' AND fecha_fin < '"+ new Date() +"'";
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            return true;
    }
    
    public List getAlquileresActivosByUserId(int id_usuario, Date fecha) {
        ArrayList<Alquiler> list = new ArrayList<>();
        String sql = "SELECT * FROM alquiler WHERE id_usuario = '" + id_usuario + "' AND fecha_fin >= '"+fecha+"'  ORDER BY fecha_fin DESC";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Alquiler alq = new Alquiler();
                alq.setId_auto(rs.getInt("id_auto"));
                alq.setId_usuario(rs.getInt("id_usuario"));
                alq.setFecha_inicio(rs.getDate("fecha_inicio"));
                alq.setFecha_fin(rs.getDate("fecha_fin"));
                alq.setTotal(rs.getDouble("total"));
                list.add(alq);
            }
            return list;
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Alquiler getAlquiler(int id_alquiler) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean addAlquiler(Alquiler alq) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO alquiler (id_auto, id_usuario, fecha_inicio, fecha_fin, total) VALUES ('" + alq.getId_auto() +"', '" + alq.getId_usuario() +"', '" + alq.getFecha_inicio() +"', '" + alq.getFecha_fin() +"', '" + alq.getTotal() +"')";
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            return true;
    }

    @Override
    public boolean updateAlquiler(Alquiler alq) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteAlquiler(int id_alquiler) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
