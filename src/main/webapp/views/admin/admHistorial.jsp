<%@page import="Model.Alquiler"%>
<%@page import="ModelDAO.AutoDAO"%>
<%@page import="ModelDAO.AlquilerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.UsuarioDAO"%>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    AlquilerDAO alquilerDAO = new AlquilerDAO();
    AutoDAO autoDAO = new AutoDAO();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Alquileres</title>
        <jsp:include page="admNav.jsp" flush="true" />
    </head>
    <body>
        <div class="flex flex-col justify-center items-center">
            <div class="w-[50%] h-auto flex flex-col justify-center items-center p-10">
                <%
                    List<Usuario> listUsuarios = new ArrayList<>();
                    listUsuarios = usuarioDAO.getUsuarios();
                    for (int i = 0; i < listUsuarios.size(); i++) {
                %>
                <div class="w-full text-center h-auto bg-transparent  shadow-xl rounded-3xl p-10 mb-10">
                    <div class="text-xl font-bold mb-5">
                        <%
                            out.print(listUsuarios.get(i).getNombre() + " " + listUsuarios.get(i).getApellido());
                        %>
                    </div>
                    <table class="table w-full">
                        <thead class="bg-gray-800 text-white">
                            <tr>
                                <th class="px-3 py-2">AUTO</th>
                                <th class="px-3 py-2">FECHA INICIO</th>
                                <th class="px-3 py-2">FECHA FIN</th>
                                <th class="px-3 py-2">TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Alquiler> listAlquiler = new ArrayList<>();
                                listAlquiler = alquilerDAO.getAlquileresByUserId(listUsuarios.get(i).getId_usuario());
                                for (int j = 0; j < listAlquiler.size(); j++) {
                                        String nameAuto = autoDAO.getAutoName(listAlquiler.get(j).getId_auto());
                                        out.print(
                                                "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + nameAuto + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + listAlquiler.get(j).getFecha_inicio().toString() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + listAlquiler.get(j).getFecha_fin().toString()+ "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + "$" + listAlquiler.get(j).getTotal()+ "</td>"
                                        );
                                    }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
