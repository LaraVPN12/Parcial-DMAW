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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Date now = new Date();
        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(now);
        List<Auto> list = new ArrayList<>();
        AutoDAO autoDAO = new AutoDAO();
        if (request.getParameter("id") != null) {
            int id_auto = Integer.parseInt(request.getParameter("id"));
            list = autoDAO.getAutoById(id_auto);
        }
        String tipo = autoDAO.getTipoAuto(list.get(0).getId_tipo_auto());
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                                precio = 8;
                                                break;
                                            case "SEDAN":
                                                precio = 7;
                                                break;
                                            case "SUV":
                                                precio = 9;
                                                break;
                                            case "CAMIONETA":
                                                precio = 10;
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
            <div class="w-[70%] flex flex-col justify-center items-start">
                <div class="text-3xl mb-5">
                    Rentar Ford Fiesta
                </div>
                <div class="h-auto w-full flex bg-gray-700 rounded-xl shadow-xl p-5">
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
                                <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2 mr-1" type="date" name="date">
                            </div>
                        </div>
                        <div class="flex justify-end items-end">
                            <input class="py-2 px-10 bg-[#035771] font-bold text-white rounded-lg" type="submit" name="survey" value="Continuar">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
