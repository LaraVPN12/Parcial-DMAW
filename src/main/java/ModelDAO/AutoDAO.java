package ModelDAO;

import DB.Connect;
import Interface.IAutoCRUD;
import Model.Auto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AutoDAO implements IAutoCRUD {

    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List getAutos() {
        List<Auto> list = new ArrayList<>();
        String sql = "SELECT * FROM auto";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Auto auto = new Auto();
                auto.setId_auto(rs.getInt("id_auto"));
                auto.setMarca(rs.getString("marca"));
                auto.setModelo(rs.getString("modelo"));
                auto.setColor(rs.getString("color"));
                auto.setImagen(rs.getString("imagen"));
                auto.setId_tipo_auto(rs.getInt("id_tipo_auto"));
                auto.setTransmision(rs.getString("transmision"));
                auto.setCapacidad(rs.getInt("capacidad"));
                auto.setTipo_combustible(rs.getString("tipo_combustible"));
                auto.setIsrented(rs.getBoolean("isrented"));
                list.add(auto);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public String getTipoAuto(int id) {
        String response = "";
        String sql = "SELECT tipo FROM tipo_auto WHERE id_tipo_auto = '" + id + "'";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                response += rs.getString("tipo");
            }
        } catch (Exception e) {

        }
        return response;
    }
    
//    public Boolean updateEveryIsRented() {
//        Date now = new Date();
//        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(now);
//        String sql1 = "SELECT * FROM alquiler WHERE fecha_fin < '" + fecha + "'";
//        try {
//            conn = cn.getConnection();
//            ps = conn.prepareStatement(sql1);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                
//            }
//        } catch (Exception e) {
//        }
//            
//        String sql2 = "UPDATE auto SET isrented = false WHERE fecha_fin";
//    }

    @Override
    public List getAuto(int id_auto) {
        List<Auto> list = new ArrayList<>();
        String sql = "SELECT * FROM auto WHERE id_auto = '"+id_auto+"'";
        try{
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Auto auto = new Auto();
                auto.setId_auto(rs.getInt("id_auto"));
                auto.setMarca(rs.getString("marca"));
                auto.setModelo(rs.getString("modelo"));
                auto.setColor(rs.getString("color"));
                auto.setImagen(rs.getString("imagen"));
                auto.setId_tipo_auto(rs.getInt("id_tipo_auto"));
                auto.setTransmision(rs.getString("transmision"));
                auto.setCapacidad(rs.getInt("capacidad"));
                auto.setTipo_combustible(rs.getString("tipo_combustible"));
                auto.setIsrented(rs.getBoolean("isrented"));
                list.add(auto);
            }
        }catch(Exception e) {
            
        }
        return list;
    }

    @Override
    public boolean addAuto(Auto auto) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO auto (marca, modelo, color, imagen, id_tipo_auto, transmision, capacidad, tipo_combustible) VALUES(?, ?, ?, ?, '"+auto.getId_tipo_auto()+"', ?, '"+auto.getCapacidad()+"', ?)";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, auto.getMarca().toUpperCase());
        ps.setString(2, auto.getModelo().toUpperCase());
        ps.setString(3, auto.getColor().toUpperCase());
        ps.setString(4, auto.getImagen());
        ps.setString(5, auto.getTransmision().toUpperCase());
        ps.setString(6, auto.getTipo_combustible().toUpperCase());
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean updateAuto(Auto auto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteAuto(int id_auto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean updateIsRented(int id_auto, Boolean isrented) {
        String sql = "UPDATE auto SET isrented=? WHERE id_usuario ='"+id_auto+"'";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, isrented);
            ps.executeUpdate();
            return true;
        }catch(Exception e) {
            
        }
        return false;
    }
    
   
    public String getAutoName(int id_auto) {
        String sql = "SELECT concat(marca, ' ', modelo) FROM auto WHERE id_auto = '"+id_auto+"'";
        String name = "";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString("concat"); 
            }
        }catch(Exception e) {
            
        }
        return name;
    }
}
