<%-- 
    Document   : register
    Created on : Nov 9, 2022, 12:24:06 AM
    Author     : deuseli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[25%] flex justify-start items-start bg-slate-100 rounded-3xl mt-10">
                <div class="w-full p-10">
                    <!--Inicio del Bloque del Formulario-->
                    <form method="" action="../UsuarioController">
                        <!-- Nombre -->
                        <div class="font-bold text-lg mr-3">
                            Nombre
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="text" name="nombre" required>
                        <!-- Apellido -->
                        <div class="font-bold text-lg mr-3">
                            Apellido
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="text" name="apellido">
                        <small><span>Opcional</span></small>
                        <!-- Correo -->
                        <div class="font-bold text-lg mr-3">
                            Correo
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="email" name="correo" required>
                        <!-- Password -->
                        <div class="font-bold text-lg mr-3">
                            Contraseña
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="password" name="contra" required>
                        <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit" name="action" value="Registrarse">
                    </form>
                    <!--Fin del Bloque del Formulario-->
                </div>
            </div>
        </div>
    </body>
</html>
