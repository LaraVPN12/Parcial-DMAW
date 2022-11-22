package Interface;

import Model.Alquiler;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author deuseli
 */
public interface IAlquilerCRUD {
    public List getAlquileres();
    public Alquiler getAlquiler(int id_alquiler);
    public boolean addAlquiler(Alquiler alq) throws ClassNotFoundException, SQLException;
    public boolean updateAlquiler(Alquiler alq);
    public boolean deleteAlquiler(int id_alquiler);
}
