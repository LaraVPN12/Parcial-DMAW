<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.AutoDAO"%>
<%
    AutoDAO autoDAO = new AutoDAO();
    List<String> res = new ArrayList<>();
    if(request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter(request.getParameter("id")));
        res = autoDAO.getAuto(id);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Datos del Vehículo</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[40%] flex justify-start items-start bg-slate-100 rounded-3xl mt-10">
                <div class="w-full p-10">
                    <!--Inicio del Bloque del Formulario-->
                    <form method="" action="../../AutoController">
                        <div class="flex justify-around items-center mb-10">
                            <div class="flex justify-center items-center">
                                <!-- Marca -->
                                <div class="font-bold text-lg mr-3">
                                    Marca
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                           name="marca" value="<%out.print(res.get(1));%> " required="true">
                                </div>
                            </div>
                            <div class="flex justify-center items-center">
                                <!-- Modelo -->
                                <div class="font-bold text-lg mr-3">
                                    Modelo
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                           name="modelo" value="<%out.print(res.get(2));%> required="true">
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-around items-center mb-10">
                            <div class="flex justify-center items-center">
                                <!-- Color -->
                                <div class="font-bold text-lg mr-3">
                                    Color
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                           name="color" value="<%out.print(res.get(3));%> required="true">
                                </div>
                            </div>
                            <div class="flex justify-center items-center">
                                <!-- Capacidad -->
                                <div class="font-bold text-lg mr-3">
                                    Capacidad
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="number"
                                           name="capacidad" required="true">
                                </div>
                            </div>
                        </div>

                        <!-- Tipo Auto -->
                        <div class="font-bold text-lg mb-3">
                            Tipo de Auto
                        </div>
                        <div class="mb-10">
                            <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                   name="tipoAuto" required="true">
                        </div>

                        <div class="flex justify-around items-center mb-10">
                            <div class="flex justify-center items-center">
                                <!-- Transmision -->
                                <div class="font-bold text-lg mr-3">
                                    Transmision
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                           name="transmision" required="true">
                                </div>
                            </div>
                            <div class="flex justify-center items-center">
                                <!-- Combustible -->
                                <div class="font-bold text-lg mr-3">
                                    Combustible
                                </div>
                                <div>
                                    <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                           name="combustible" required="true">
                                </div>
                            </div>
                        </div>

                        <!-- Imagen -->
                        <div class="font-bold text-lg mr-3">
                            Imagen
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="text"
                               name="imagen" value="<%out.print(res.get(4));%> required="true">
                        <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit"
                               name="action" value="Editar">
                    </form>
                    <!--Fin del Bloque del Formulario-->
                </div>
            </div>
        </div>
    </body>
</html>
