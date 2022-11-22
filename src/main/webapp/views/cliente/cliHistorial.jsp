<%-- 
    Document   : cliHistorial
    Created on : Nov 21, 2022, 6:06:12 PM
    Author     : deuseli
--%>

<%@page import="ModelDAO.AutoDAO"%>
<%@page import="ModelDAO.AlquilerDAO"%>
<%@page import="Model.Alquiler"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MI HISTORIAL</title>
        <jsp:include page="cliNav.jsp" flush="true" />
    </head>
    <body>
        <div class="flex flex-col justify-center items-center">
            <form action="../EncuestaController">
                <div class="h-auto w-auto flex flex-col border bg-transparent rounded-3xl p-10 mt-10 mb-10">
                    <!-- Filtrar por Fecha -->
<!--                    <div class="flex justify-start items-center mb-10">
                        <input class="w-40 rounded-md bg-slate-100 focus:outline-none py-1 text-center mr-3" type="date" name="date">
                        <input class="px-3 py-1 bg-blue-800 font-bold text-white rounded-md" type="submit" name="action" value="Filtrar">
                    </div>-->
                    <!-- Tabla -->
                    <div class="flex flex-col justify-center items-center">
                        <table class="table">
                            <thead class="bg-gray-800 text-white">
                                <tr>
                                    <th class="px-3 py-2">AUTO</th>
                                    <th class="px-3 py-2">FECHA INICIO</th>
                                    <th class="px-3 py-2">FECHA FIN</th>
                                    <th class="px-3 py-2">TOTAL</th>
                                    <th class="px-3 py-2">VER</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    AlquilerDAO alquilerDao = new AlquilerDAO();
                                    AutoDAO autoDao = new AutoDAO();
                                    String paramLista = request.getParameter("list");
                                    String paramFrom = request.getParameter("from");
                                    List<Alquiler> list = new ArrayList<>();
//                                    if (paramLista != null && paramFrom != null) {
//                                        switch (paramFrom) {
//                                            case "filter":
//                                                if (paramLista.equals("every")) {
//                                                    list = survey.listEncuestas();
//                                                } else if (paramLista.isEmpty()) {
//                                                    list = survey.listEncuestas();
//                                                } else {
//                                                    list = survey.getByFecha(paramLista);
//                                                }
//                                                break;
//                                            case "search":
//                                                if (paramLista.equals("every")) {
//                                                    list = survey.listEncuestas();
//                                                } else {
//                                                    list = survey.getByNombre(paramLista);
//                                                }
//                                                break;
//                                            default:
//                                                list = survey.listEncuestas();
//                                        }
//                                    } else if (paramLista != null) {
//                                        list = survey.listEncuestas();
//                                    }
                                    list = alquilerDao.getAlquileresByUserId(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                    
                                    
                                    for (int i = 0; i < list.size(); i++) {
                                        String autoName = autoDao.getAutoName(list.get(i).getId_auto());

                                        out.print(
                                                "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + autoName + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getFecha_inicio().toString() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getFecha_fin().toString()+ "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + "$" + list.get(i).getTotal()+ "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md justify-center'>"
                                                + "<a href='/Parcial-DMAW/views/cliente/cliAutosDetalle.jsp?id=" + list.get(i).getId_auto() + "'>"
                                                + "<img src='https://cdn-icons-png.flaticon.com/128/709/709586.png' class='w-4 h-4'></a></td></tr>"
                                        );
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
