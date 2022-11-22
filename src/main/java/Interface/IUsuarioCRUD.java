
package Interface;

import Model.Usuario;
import java.sql.SQLException;
import java.util.List;

public interface IUsuarioCRUD {
    public List loginUser(Usuario user);
    public List<Usuario> getUsuarios();
    public Usuario getUsuario(int id_usuario);
    public boolean addUsuario(Usuario usuario) throws ClassNotFoundException, SQLException ;
    public boolean updateUsuario(Usuario usuario);
    public boolean deleteUsuario(int id_usuario);
}
