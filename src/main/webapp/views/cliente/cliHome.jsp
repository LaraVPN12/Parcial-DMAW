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
        <jsp:include page="cliNav.jsp" flush="true" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

    </head>
    <body class="h-full bg-gray-800">
        <!-- Principal -->
        <div class="flex flex-col justify-center items-center h-full">
            <!-- Heading -->
            <div class="w-full h-full flex justify-start items-center bg-cover bg-center"
                 style="background-image: url('../../images/background3.jpg'); background-repeat: no-repeat;">
                <div class="w-auto h-auto p-10">
                    <div class="text-[50px] text-white font-bold">
                        Maneja a tu estilo
                    </div>
                    <div class="text-[40px] text-white mb-5">
                        Haz de este viaje inmemorable!
                    </div>
                </div>
            </div>
            <div class="w-full flex flex-col justify-start items-center h-full bg-gray-800 mt-10">
                <div class="flex justify-center items-center">
                    <div class="text-[200px] mr-5">
                        <i class="bi bi-car-front-fill text-white"></i>
                    </div>
                    <div class="flex flex-col">
                        <div class="text-[50px] font-bold text-white">
                            Alquileres
                        </div>
                        <div class="text-[30px] italic text-white">
                            Alquilar autos nunca fue tan fácil
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
