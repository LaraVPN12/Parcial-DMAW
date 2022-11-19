
package Interface;

import Model.Auto;

public interface IAutoCRUD {
    public Auto getUsuario(int id_auto);
    public boolean addAuto(Auto auto);
    public boolean updateAuto(Auto auto);
    public boolean deleteAuto(int id_auto);
}
