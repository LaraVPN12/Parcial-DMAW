<%-- 
    Document   : editUser
    Created on : 9 nov. 2022, 17:26:23
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[25%] flex justify-start items-start bg-slate-100 rounded-3xl mt-10">
                <div class="w-full p-10">
                    <!--Inicio del Bloque del Formulario-->
                    <form method="" action="/Parcial-DMAW/UsuarioController">
                        <!-- Nombre -->
                        <div class="font-bold text-lg mr-3">
                            Nombre
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="text" name="nombre" value="<% out.print(session.getAttribute("nombre")); %>" required>
                        <!-- Apellido -->
                        <div class="font-bold text-lg mr-3">
                            Apellido
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2" type="text" name="apellido" value="<% out.print(session.getAttribute("apellido")); %>" required>
                        <div class="mb-3">
                        </div>
                        <!-- Correo -->
                        <div class="font-bold text-lg mr-3">
                            Correo
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="email" name="correo" value="<% out.print(session.getAttribute("correo")); %>" required>
                        <!-- Password -->
                        <div class="font-bold text-lg mr-3">
                            Contraseña
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="text" name="contra" value="<% out.print(session.getAttribute("contra")); %>" required>
                        <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit" name="action" value="Actualizar">
                    </form>
                    <!--Fin del Bloque del Formulario-->
                </div>
            </div>
        </div>
    </body>
</html>