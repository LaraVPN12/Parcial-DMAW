package Model;

/**
 *
 * @author deuseli
 */
import java.util.Date;

public class Alquiler {
    private int id_alquiler;
    private int id_auto;
    private int id_usuario;
    private Date fecha_inicio;
    private Date fecha_fin;
    private double total;
    
    public Alquiler() {
        
    }

    public Alquiler(int id_alquiler, int id_auto, int id_usuario, Date fecha_inicio, Date fecha_fin, double total) {
        this.id_alquiler = id_alquiler;
        this.id_auto = id_auto;
        this.id_usuario = id_usuario;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.total = total;
    }

    public int getId_alquiler() {
        return id_alquiler;
    }

    public void setId_alquiler(int id_alquiler) {
        this.id_alquiler = id_alquiler;
    }

    public int getId_auto() {
        return id_auto;
    }

    public void setId_auto(int id_auto) {
        this.id_auto = id_auto;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
