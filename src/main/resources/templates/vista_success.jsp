<%-- 
    Document   : vista_success
    Created on : 30/10/2021, 12:58:45
    Author     : javy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Success</title>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${success == 1}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 2}">
                    <div class="container">
                       <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 3}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 4}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 5}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 6}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 7}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 8}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 9}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 10}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 11}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${success == 12}">
                    <div class="container">
                        <h1><label>${successMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-submit"/>
                        </form>
                    </div>
                </c:when>
            </c:choose>              
            
        </div>

    </body>
</html>
