<%-- 
    Document   : vista_error
    Created on : 30/10/2021, 12:58:34
    Author     : javy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Error!</title>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${error == -1}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="index.jsp">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == -2}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="index.jsp">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 1}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 2}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 3}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_usuario"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 4}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 5}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 6}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorAdministrador">
                            <input type="hidden" name="tipo" value="vehiculo"/> 
                            <input type="hidden" name="action" value="volver_vehiculo"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 7}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 8}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 9}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="usuario"/> 
                            <input type="hidden" name="action" value="volver_clientes"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 10}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 11}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
                <c:when test="${error == 12}">
                    <div class="container">
                        <h1><label>${ErrorMsg}</label></h1>
                        <br>
                        <form method="post" action="ControladorVendedor">
                            <input type="hidden" name="tipo" value="reserva"/> 
                            <input type="hidden" name="action" value="volver_reservas"/> 
                            <input type="submit" value="Salir"class="boton-delete"/>
                        </form>
                    </div>
                </c:when>
            </c:choose>

        </div>

    </body>
</html>
