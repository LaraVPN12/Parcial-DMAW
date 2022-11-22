<%-- 
    Document   : admNav
    Created on : Nov 19, 2022, 11:34:52 PM
    Author     : deuseli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://cdn.tailwindcss.com"></script>
<nav id="header" class="w-full z-30 py-1 bg-gray-800">
    <div class="w-full flex items-center justify-between mt-0 px-6 py-2">
        <div class="w-full md:order-1" id="menu">
            <nav>
                <ul class="flex items-start justify-between items-center text-base text-white pt-4 md:pt-0">
                    <div class="flex flex-row">
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/admin/admHome.jsp">Página Principal</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/admin/admUsuarios.jsp">Usuarios</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/admin/admAutos.jsp">Autos</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="/Parcial-DMAW/views/admin/admAutos.jsp">Historial de Alquileres</a></li>
                    </div>
                    <li>
                        <div class="px-2 py-1 rounded-md bg-red-400"><a class="no-underline font-bold" href="/Parcial-DMAW/ServletCerrarSesion">Cerrar Sesión</a></div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</nav>