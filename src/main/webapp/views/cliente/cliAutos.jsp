<%-- 
    Document   : cliAutos
    Created on : Nov 19, 2022, 11:32:33 PM
    Author     : deuseli
--%>

<%@page import="ModelDAO.AutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Auto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autos</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    </head>
     <%
        if (session.getAttribute("admin").equals("true")) {
    %>
    <jsp:include page="admin/admNav.jsp" flush="true" />
    <%
    } else if (session.getAttribute("admin").equals("false")) {
    %>
    <jsp:include page="cliNav.jsp" flush="true" />
    <%
        }
    %>
    <body>
        <%
            List<Auto> list = new ArrayList<>();
            AutoDAO autoDAO = new AutoDAO();
            list = autoDAO.getAutos();
            for (int i = 0; i < list.size(); i++) {
        %>
        <div class="flex flex-col justify-center items-center">
            <div class="w-full h-auto flex flex-col justify-center items-center mt-10">
                <div class="w-[80%] h-auto bg-white shadow-md">
                    <div class="flex py-5 px-10 justify-between">
                        <div class="w-[20%]">
                            <img src="<%
                                out.print(list.get(i).getImagen());
                            %>"/>
                        </div>
                        <div class="w-auto flex justify-center items-center">
                            <div class="flex flex-col divide-y-2 divide-dashed">
                                <div class="text-[#216869] text-xl mb-3">
                                    <%
                                        out.print(list.get(i).getMarca() + " " + list.get(i).getModelo());
                                    %>
                                </div>
                                <div class="py-2">
                                    <div class="grid grid-cols-3 gap-3">
                                        <div class="flex">
                                            <i class="bi bi-car-front-fill"></i>
                                            <div class="font-bold px-2">
                                                Clase:
                                            </div>
                                            <div>
                                                <%
                                                    String tipo = autoDAO.getTipoAuto(list.get(i).getId_tipo_auto());
                                                    out.print(tipo);
                                                %>
                                            </div>
                                        </div>
                                        <div class="flex">
                                            <i class="bi bi-gear-fill"></i>
                                            <div class="font-bold px-2">
                                                Transmisión:
                                            </div>
                                            <div>
                                                <%
                                                    out.print(list.get(i).getTransmision());
                                                %>
                                            </div>
                                        </div>
                                        <div class="flex">
                                            <i class="bi bi-people-fill"></i>
                                            <div class="font-bold px-2">
                                                Capacidad:
                                            </div>
                                            <div>
                                                <%
                                                    out.print(String.valueOf(list.get(i).getCapacidad()));
                                                %>
                                            </div>
                                        </div>
                                        <div class="flex">
                                            <i class="bi bi-fuel-pump-fill"></i>
                                            <div class="font-bold px-2">
                                                Tipo Combustible:
                                            </div>
                                            <div>
                                                <%
                                                    out.print(list.get(i).getTipo_combustible());
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div></div>
                            </div>
                        </div>
                        <div class="w-auto h-auto flex flex-col justify-between items-center">
                            <div class="flex justify-center items-center">
                                <div class="mr-5">
                                    PRECIO DESDE
                                </div>
                                <div class="text-4xl font-bold">
                                    8 USD
                                </div>
                            </div>
                            <div class="w-full flex flex-col">
                                <div class="w-auto flex justify-between items-center mb-3">
                                    <div class="font-bold">
                                        Deposito
                                    </div>
                                    <div>
                                        100 USD
                                    </div>
                                </div>
                                <div class="">
                                    <input class="py-2 w-full bg-[#035771] font-bold text-white rounded-lg" type="submit" name="survey" value="Rentar">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</body>
</html>
