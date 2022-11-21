
package Model;

public class Auto {
    private int id_auto;
    private String marca;
    private String modelo;
    private String color;
    private String placa;
    private String imagen;
    private int id_tipo_auto;
    private String transmision;
    private int capacidad;
    private String tipo_combustible;
    
    
    public Auto(){}

    public Auto(int id_auto, String marca, String modelo, String color, String placa, String imagen, int id_tipo_auto, String transmision, int capacidad, String tipo_combustible) {
        this.id_auto = id_auto;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.placa = placa;
        this.imagen = imagen;
        this.id_tipo_auto = id_tipo_auto;
        this.transmision = transmision;
        this.capacidad = capacidad;
        this.tipo_combustible = tipo_combustible;
    }

    public int getId_auto() {
        return id_auto;
    }

    public void setId_auto(int id_auto) {
        this.id_auto = id_auto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getId_tipo_auto() {
        return id_tipo_auto;
    }

    public void setId_tipo_auto(int id_tipo_auto) {
        this.id_tipo_auto = id_tipo_auto;
    }

    public String getTransmision() {
        return transmision;
    }

    public void setTransmision(String transmision) {
        this.transmision = transmision;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getTipo_combustible() {
        return tipo_combustible;
    }

    public void setTipo_combustible(String tipo_combustible) {
        this.tipo_combustible = tipo_combustible;
    }
    
    
}
