<%-- 
    Document   : adminUsuarios
    Created on : Nov 19, 2022, 11:25:07 PM
    Author     : deuseli
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.UsuarioDAO"%>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios - Adminsitrador</title>
        <jsp:include page="admNav.jsp" flush="true" />
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="w-[50%] h-auto flex justify-center items-center p-10">
                <div class="w-full text-center h-auto bg-transparent  shadow-xl rounded-3xl p-10 ">
                    <div class="text-xl font-bold mb-5">
                        Lista de Usuarios
                    </div>
                    <table class="table w-full">
                        <thead class="bg-gray-800 text-white">
                            <tr>
                                <th class="px-3 py-2">NOMBRE</th>
                                <th class="px-3 py-2">APELLIDO</th>
                                <th class="px-3 py-2">CORREO</th>
                                <th class="px-3 py-2">CONTRA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Usuario> list = new ArrayList<>();
                                list = usuarioDAO.getUsuarios();
                                for (int i = 0; i < list.size(); i++) {
                                    out.print
                                    (
                                        "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getNombre() + "</td>" +
                                        "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getApellido()+ "</td>" +
                                        "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getCorreo()+ "</td>" +
                                        "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getContra()+ "</td>"

                                    );
                                }

                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
