
package Interface;

import Model.Auto;
import java.sql.SQLException;
import java.util.List;

public interface IAutoCRUD {
    public List getAutos();
    public List getAuto(int id_auto);
    public boolean addAuto(Auto auto)throws ClassNotFoundException, SQLException;
    public boolean updateAuto(Auto auto);
    public boolean deleteAuto(int id_auto);
}
