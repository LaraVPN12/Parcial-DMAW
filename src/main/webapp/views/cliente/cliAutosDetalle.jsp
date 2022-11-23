<%-- 
    Document   : cliAutosDetalle
    Created on : 21 nov. 2022, 01:27:54
    Author     : kjlme
--%>

<%@page import="ModelDAO.AutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Auto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Date now = new Date();
        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(now);
        List<Auto> list = new ArrayList<>();
        AutoDAO autoDAO = new AutoDAO();
        int id_auto = 0;
        if (request.getParameter("id") != null) {
            id_auto = Integer.parseInt(request.getParameter("id"));
            autoDAO.updateIsRented(id_auto);
            list = autoDAO.getAuto(id_auto);
        }
        String tipo = autoDAO.getTipoAuto(list.get(0).getId_tipo_auto());
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="jquery-3.6.0.min.js"></script>
        <title>
            <%
                out.print(list.get(0).getMarca() + " " + list.get(0).getModelo());
            %>
        </title>
        <jsp:include page="cliNav.jsp" flush="true" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="flex flex-col justify-center items-center">
            <div class="w-full h-[100px] flex justify-center items-center bg-slate-100">
                <div class="text-4xl">
                    <%
                        out.print(list.get(0).getMarca() + " " + list.get(0).getModelo());
                    %>
                </div>
            </div>
            <div class="w-[70%] h-auto flex justify-start items-center py-5 px-10">
                <div class="w-full flex justify-center items-center">
                    <div class="w-[30%] mr-20">
                        <img src=
                             "
                             <%
                                 out.print(list.get(0).getImagen());
                             %>
                             "/>
                    </div>
                    <div class="w-[60%]">
                        <div class="w-auto flex flex-col">
                            <div class="w-auto flex justify-between items-center mb-3">
                                <div class="text-xl">
                                    Precio
                                </div>
                                <div class="text-3xl font-bold">
                                    <%
                                        int precio = 0;
                                        switch (tipo) {
                                            case "HATCHBACK":
                                                precio = 25;
                                                break;
                                            case "SEDAN":
                                                precio = 35;
                                                break;
                                            case "SUV":
                                                precio = 35;
                                                break;
                                            case "CAMIONETA":
                                                precio = 50;
                                                break;
                                            default:
                                                throw new AssertionError();
                                        }
                                    %>
                                    <span class="">
                                        <%
                                            out.print(Integer.toString(precio));
                                        %> USD/día
                                    </span>
                                </div>
                            </div>
                            <div class="w-auto flex justify-start ietms-center mb-3">
                                <div class="py-2 px-7 bg-black rounded-xl text-white font-bold mr-3">
                                    Depósito
                                </div>
                                <div class="flex justify-center items-center text-md">
                                    100 USD
                                </div>
                            </div>
                            <div class="w-auto flex justify-start items-center mb-5">
                                <div class="flex flex-col">
                                    <div class="w-auto h-auto border-b-2 border-black">
                                        <div class="text-xl mb-3">Información General</div>
                                    </div>
                                    <div class="mt-5">
                                        <div class="grid grid-cols-3 gap-3 border-b-2 border-dashed">
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-car-front-fill"></i>
                                                <div class="font-bold px-2">
                                                    Clase:
                                                </div>
                                                <div>
                                                    <%
                                                        out.print(tipo);
                                                    %>
                                                </div>
                                            </div>
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-gear-fill"></i>
                                                <div class="font-bold px-2">
                                                    Transmisión:
                                                </div>
                                                <div>
                                                    <%
                                                        out.print(list.get(0).getTransmision());
                                                    %>
                                                </div>
                                            </div>
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-people-fill"></i>
                                                <div class="font-bold px-2">
                                                    Capacidad:
                                                </div>
                                                <div>
                                                    <%
                                                        out.print(list.get(0).getCapacidad());
                                                    %>
                                                </div>
                                            </div>
                                            <div class="flex py-1">
                                                <i class="bi bi-fuel-pump-fill"></i>
                                                <div class="font-bold px-1">
                                                    Tipo Combustible:
                                                </div>
                                                <div>
                                                    <%
                                                        out.print(list.get(0).getTipo_combustible());
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w-auto flex justify-start items-center mb-3">
                                <div class="w-full flex flex-col">
                                    <div class="w-auto h-auto border-b-2 border-black">
                                        <div class="text-xl mb-3">Detalles</div>
                                    </div>
                                    <div class="mt-5">
                                        <div class="grid grid-cols-3 gap-3 border-b-2 border-dashed">
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-check-lg"></i>
                                                <div>
                                                    ABS
                                                </div>
                                            </div>
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-check-lg"></i>
                                                <div>
                                                    Bolsas de Aire
                                                </div>
                                            </div>
                                            <div class="flex py-1 border-b-2 border-dashed">
                                                <i class="bi bi-check-lg"></i>
                                                <div>
                                                    Sistema de Audio HD
                                                </div>
                                            </div>
                                            <div class="flex py-1">
                                                <i class="bi bi-check-lg"></i>
                                                <div>
                                                    Vidrios Eléctricos
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                if (session.getAttribute("hasrented").equals("true")) {
            %>
            <div class='bg-orange-100 border border-orange-400 text-red-700 px-4 py-3 rounded'>
                <strong class='font-bold'>¡NO DISPONIBLE!</strong><br>
                <span class=''><c:out value="No puedes alquilar otro auto porque ya tienes un alquiler activo"/></span>
            </div>
            <%
            } else if (list.get(0).getIsrented()) {
            %>
            <div class='bg-orange-100 border border-orange-400 text-red-700 px-4 py-3 rounded'>
                <strong class='font-bold'>¡NO DISPONIBLE!</strong><br>
                <span class=''><c:out value="No puedes alquilar este auto porque alguien lo tiene alquilado"/></span>
            </div>
            <%
            } else {
            %>
            <div class="w-[70%] flex flex-col justify-center items-start">
                <div class="text-3xl mb-5">
                    <span>RENTAR <%
                        out.print(list.get(0).getMarca() + " " + list.get(0).getModelo());
                        %></span>
                </div>
                <div class="h-auto w-full flex bg-gray-700 rounded-xl shadow-xl p-5">
                    <form method="" action="/Parcial-DMAW/AlquilerController" class="w-full">
                        <div class="flex h-auto w-full justify-between items-center">
                            <div class="flex">
                                <!-- Item -->
                                <div class="flex flex-col mr-10">
                                    <div class=" text-white">
                                        Fecha de Alquiler
                                    </div>
                                    <div class="flex items-center justify-center h-full">
                                        <span class="text-white">Hoy: <% out.print(fecha);%></span>
                                    </div>
                                </div>
                                <!-- Item -->
                                <div class="flex flex-col mr-10">
                                    <div class=" text-white">
                                        Fecha de Devolución 
                                    </div>
                                    <div class="flex">
                                        <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2 mr-1" type="date" name="fin_date" id="dateControl" required>
                                    </div>
                                    <input hidden="true" type="number" name="id_auto" value="<% out.print(id_auto); %>">
                                    <input hidden="true" type="text" name="precio" value="<% out.print(precio);%>">
                                </div>
                            </div>
                            <div class="flex h-full">
                                <input class="py-2 px-10 bg-[#035771] font-bold text-white rounded-lg" type="submit" name="action" value="Alquilar">
                            </div>
                        </div>  
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            var dtToday = new Date();
            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate() + 1;
            var year = dtToday.getFullYear();
            if (month < 10)
                month = '0' + month.toString();
            if (day < 10) day ? '0' + day.toString();
                    var maxDate = year + '-' + month + '-' + day;
            $('#dateControl').attr('min', maxDate);
        });
    </script>
</html>
