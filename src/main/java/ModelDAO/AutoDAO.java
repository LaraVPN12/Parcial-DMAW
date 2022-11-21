package ModelDAO;

import DB.Connect;
import Interface.IAutoCRUD;
import Model.Auto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                list.add(auto);
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public List getAutoById(int id) {
        List<Auto> list = new ArrayList<>();
        String sql = "SELECT * FROM auto WHERE id_auto = '"+id+"'";
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
                list.add(auto);
            }
        }catch(Exception e) {
            
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

    @Override
    public Auto getAuto(int id_auto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean addAuto(Auto auto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        String sql = "UPDATE auto SET isrented=? WHERE id_usuario ='"+id_auto+"' ";
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
}
