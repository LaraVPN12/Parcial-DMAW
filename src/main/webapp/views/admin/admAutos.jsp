<%@page import="java.util.ArrayList"%>
<%@page import="Model.Auto"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.AutoDAO"%>
<%
    AutoDAO autoDao = new AutoDAO();
    if (request.getParameter("delete") != null) {
        String[] carNumber = request.getParameterValues("eliminar");
        for (int i = 0; i < carNumber.length; i++) {
            autoDao.deleteAuto(Integer.parseInt(carNumber[i]));
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autos - Administrador</title>
        <jsp:include page="admNav.jsp" flush="true" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="w-full h-auto flex justify-center items-center p-10">
            <div class="w-full h-full flex justify-center items-center">
                <div class="h-auto w-[40%] flex justify-start items-start bg-slate-100 rounded-3xl mr-10">
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
                                               name="marca" required="true">
                                    </div>
                                </div>
                                <div class="flex justify-center items-center">
                                    <!-- Modelo -->
                                    <div class="font-bold text-lg mr-3">
                                        Modelo
                                    </div>
                                    <div>
                                        <input class="w-full rounded-md focus:outline-none px-3 py-2" type="text"
                                               name="modelo" required="true">
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
                                               name="color" required="true">
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
                                <select name="tipoAuto" id="tipoAuto" required="true"
                                        class="w-full bg-white text-gray-900 text-sm rounded-lg focus:outline-none p-3 mb-3">
                                    <option selected>Seleccione un tipo de vehículo</option>
                                    <option>HATCHBACK</option>
                                    <option>SEDAN</option>
                                    <option>SUV</option>
                                    <option>CAMIONETA</option>
                                </select>
                            </div>

                            <div class="flex justify-around items-center mb-10">
                                <div class="flex justify-center items-center">
                                    <!-- Transmision -->
                                    <div class="font-bold text-lg mr-3">
                                        Transmision
                                    </div>
                                    <div>
                                        <label><input class="mr-2" type="radio" name="transmision" value="manual">Manual</label>
                                        <label><input class="mr-2" type="radio" name="transmision" value="automatico">Automático</label>

                                    </div>
                                </div>
                                <div class="flex justify-center items-center">
                                    <!-- Combustible -->
                                    <div class="font-bold text-lg mr-3">
                                        Combustible
                                    </div>
                                    <div>
                                        <label><input class="mr-2" type="radio" name="combustible" value="diesel">Diesel</label>
                                        <label><input class="mr-2" type="radio" name="combustible" value="gasolina">Gasolina</label>

                                    </div>
                                </div>
                            </div>

                            <!-- Imagen -->
                            <div class="font-bold text-lg mr-3">
                                Imagen
                            </div>
                            <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="text"
                                   name="imagen" required="true">
                            <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit"
                                   name="action" value="Agregar">
                        </form>
                        <!--Fin del Bloque del Formulario-->
                    </div>
                </div>
                <div class="h-auto w-[60%] flex justify-start items-start bg-transparent shadow-xl rounded-3xl">
                    <div class="w-full p-10">
                        <form method="post">
                            <table class="table w-full">
                                <thead class="bg-gray-800 text-white">
                                    <tr>
                                        <th class="px-3 py-2"></th>
                                        <th class="px-3 py-2">MARCA</th>
                                        <th class="px-3 py-2">MODELO</th>
                                        <th class="px-3 py-2">COLOR</th>
                                        <th class="px-3 py-2">IMAGEN</th>
                                        <th class="px-3 py-2">TIPO DE AUTO</th>
                                        <th class="px-3 py-2">TRANSMISION</th>
                                        <th class="px-3 py-2">CAPACIDAD</th>
                                        <th class="px-3 py-2">TIPO DE COMBUSTIBLE</th> 
                                        <th class="px-3 py-2"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Auto> list = new ArrayList<>();
                                        list = autoDao.getAutos();
                                        for (int i = 0; i < list.size(); i++) {
                                            String tipo = autoDao.getTipoAuto(list.get(i).getId_tipo_auto());
                                            out.print(
                                                    "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'><input type=checkbox name='eliminar' value='" + list.get(i).getId_auto() + "' title='" + list.get(i).getId_auto() + "'></td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getMarca() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getModelo() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getColor() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'><img src='" + list.get(i).getImagen() + "' width='100px'/></td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + tipo + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getTransmision() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getCapacidad() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getTipo_combustible() + "</td>"
                                                    + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'><a href=editCar.jsp?id'"+list.get(i).getId_auto()+"'><div class='text-gray-500'><i class='bi bi-box-arrow-in-down-left'></i></div></a></td>"
                                            );
                                        }
                                    %>
                                </tbody>
                            </table>
                            <div class="flex justify-end items-center">
                                <button type="submit" name="delete" class="bg-red-400 text-white font-bold px-3 py-2 rounded-xl mt-5">Eliminar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
