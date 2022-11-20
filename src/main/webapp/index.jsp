<%-- 
    Document   : index
    Created on : 19 nov. 2022, 15:12:08
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    </head>
    <body class="antialiased bg-gradient-to-br from-green-100 to-white">
        <div class="w-full h-screen flex justify-center items-center p-10">
            <div class="w-full h-full flex justify-center items-center">
                <!-- Nombre del Sistema Container -->
                <div class="w-[50%] flex flex-col justify-start items-start">
                    <div class="flex justify-center items-center">
                        <div class="text-[200px] mr-5">
                            <i class="bi bi-car-front-fill"></i>
                        </div>
                        <div class="flex flex-col">
                            <div class="text-[50px] font-bold">
                                Alquileres
                            </div>
                            <div class="text-[30px] italic">
                                Alquilar autos nunca fue tan fácil
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Formulario Container -->
                <div class="w-auto h-[60%] flex flex-col justify-center items-center">
                    <div class="h-full w-full flex flex-col justify-center items-center bg-white shadow-xl rounded-3xl">
                        <div class="w-full p-10">
                            <!--Inicio del Bloque del Formulario-->
                            <form method="POST" action="ServletLogin">
                                <!-- Correo -->
                                <div class="font-bold text-lg mr-3">
                                    Correo
                                </div>
                                <input class="bg-slate-100 w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="email" name="email">
                                <!-- Password -->
                                <div class="font-bold text-lg mr-3">
                                    Password
                                </div>
                                <input class="bg-slate-100 w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="password" name="password">
                                <input class="w-full px-3 py-2 bg-green-800 font-bold text-white rounded-md mb-5" type="submit" name="login" value="Iniciar Sesión">
                                <div class="w-full flex flex-row justify-center items-center">
                                    <span>¿No tienes una cuenta?</span><a class="font-bold ml-2" href="UsuarioController?action=registration">Regístrate ahora</a>
                                </div>
                            </form>
                            <!--Fin del Bloque del Formulario-->
                        </div>
                        <div class="flex flex-col w-full p-10 pt-0">
                            <%
                                if (session.getAttribute("errorLogin") != null && session.getAttribute("errorLogin").equals("true")) {
                            %>
                            <div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded'>
                                <strong class='font-bold'>¡Error en inicio de sesión!</strong><br>
                                <span class=''><c:out value="Correo o Contraseña Incorrecta"/></span>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
