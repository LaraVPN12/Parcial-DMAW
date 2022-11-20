<%-- 
    Document   : home
    Created on : Nov 19, 2022, 7:14:25 PM
    Author     : deuseli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
        <script src="https://cdn.tailwindcss.com"></script>
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
        <!-- Principal -->
        <div class="flex flex-col justify-center items-center">
            <!-- Heading -->
            <div class="w-full h-[400px] flex justify-start items-center bg-cover bg-center"
                 style="background-image: url('../../images/background3.jpg'); background-repeat: no-repeat;">
                <div class="w-auto h-auto p-10">
                    <div class="text-[50px] text-white font-bold">
                        Maneja a tu estilo
                    </div>
                    <div class="text-[40px] text-white mb-5">
                        Haz de este viaje inmemorable!
                    </div>
                    <!-- Formulario -->
                    <div class="h-auto w-auto flex bg-black/50 rounded-xl shadow-xl p-5">
                        <div class="flex">
                            <!-- Item -->
                            <div class="flex flex-col mr-10">
                                <div class=" text-white mb-2">
                                    Fecha de Alquiler
                                </div>
                                <div class="flex">
                                    <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2 mr-1" type="date" name="date">
                                    <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2" type="time" name="hour">
                                </div>
                            </div>
                            <!-- Item -->
                            <div class="flex flex-col mr-10">
                                <div class=" text-white mb-2">
                                    Fecha de Devolución
                                </div>
                                <div class="flex">
                                    <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2 mr-1" type="date" name="date">
                                    <input class="w-auto rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2" type="time" name="hour">
                                </div>
                            </div>
                            <div class="flex justify-end items-end">
                                <input class="py-3 px-10 bg-[#035771] font-bold text-white rounded-lg" type="submit" name="survey" value="Buscar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
