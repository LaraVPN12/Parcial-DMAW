<%-- 
    Document   : cliNav
    Created on : Nov 19, 2022, 11:34:43 PM
    Author     : deuseli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<nav id="header" class="w-full z-30 py-1 bg-gray-800">
    <div class="w-full flex items-center justify-between mt-0 px-6 py-2">
        <div class="w-full md:order-1" id="menu">
            <nav>
                <ul class="flex items-start justify-between items-center text-base text-white pt-4 md:pt-0">
                    <div class="flex flex-row">
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/cliente/cliHome.jsp">Página Principal</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/cliente/cliAutos.jsp">Nuestros Autos</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/cliente/cliHistorial.jsp">Historial de Rentas</a></li>
                    </div>
                    <div class="flex justify-center items-center">
                        <li>
                            <div class="flex flex-row justify-center items-center">
                                <div class="text-5xl text-white mr-3">
                                    <i class="bi bi-person-circle"></i>
                                </div>
                                <div class="flex flex-col justify-center items-center mr-10">
                                    <span class="font-bold text-xl"><% out.print(session.getAttribute("nombre") + " " + session.getAttribute("apellido"));%></span>
                                    <a class="no-underline italic" href="/Parcial-DMAW/UsuarioController?action=update">Editar Perfil</a>
                                </div>
                                <div class="px-2 py-1 rounded-md bg-red-400"><a class="no-underline font-bold" href="/Parcial-DMAW/ServletCerrarSesion">Cerrar Sesión</a></div>
                            </div>
                        </li>
                    </div>
                </ul>
            </nav>
        </div>
    </div>
</nav>

