
package Model;

public class Usuario {
    private int id_usuario;
    private String nombre;
    private String apellido;
    private String correo;
    private String contra;
    private Boolean admin;
    private Boolean hasrented;
    
    public Usuario(){}

    public Usuario(int id_usuario, String nombre, String apellido, String correo, String contra, Boolean admin, Boolean hasrented) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contra = contra;
        this.admin = admin;
        this.hasrented = hasrented;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
    
    public Boolean getHasrented() {
        return hasrented;
    }

    public void setHasrented(Boolean hasrented) {
        this.hasrented = hasrented;
    }
}
