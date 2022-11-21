
package Interface;

import Model.Auto;
import java.util.List;

public interface IAutoCRUD {
    public List getAutos();
    public Auto getAuto(int id_auto);
    public boolean addAuto(Auto auto);
    public boolean updateAuto(Auto auto);
    public boolean deleteAuto(int id_auto);
}
