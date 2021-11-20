<%-- 
    Document   : vista_administrador_vehiculos
    Created on : 30/10/2021, 22:15:59
    Author     : javy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${action == 'agregar'}">
            <div class="container">
                <h1>Agregar Nuevo Vehiculo a la Nomina</h1>
                <form method="post" action="ControladorAdministrador">
                    <label>Marca: </label>
                    <input type="text" name="marca" required="true"/><br>
                    <label>Modelo: </label>
                    <input type="text" name="modelo" required="true"/><br>
                    <label>Patente: </label>
                    <input type="text" name="patente" required="true"/><br>
                    <label>Color: </label>
                    <input type="text" name="color" required="true"/><br>
                    <label>Litros Combustible: </label>
                    <input type="text" name="litros_combustible" required="true"/><br>
                    <label>Precio: </label>
                    <input type="text" name="precio_alquiler" required="true"/><br>
                     <input type="hidden" name="tipo" value="vehiculo"/> 
                    <input type="hidden" name="entregado" value="0"/><br>
                    <input type="hidden" name="action" value="agregar_vehiculo"/>
                    <input type="submit" value="Agregar" class="boton-submit"/>
                </form>
                 <br>
                <form method="post" action="ControladorAdministrador">
                    <input type="hidden" name="tipo" value="vehiculo"/> 
                    <input type="hidden" name="action" value="volver_vehiculo"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
        <c:if test="${action == 'editar'}">
            <div class="container">
                <h1>Editar Vehiculo de la Nomina</h1>
                <form method="post" action="ControladorAdministrador">
                    <label>Marca: </label>
                    <input type="text" name="marca" value="${vehiculo.marca}"/><br>
                    <label>Modelo: </label>
                    <input type="text" name="modelo" value="${vehiculo.modelo}"/><br>
                    <label>Patente: </label>
                    <input type="text" name="patente" value="${vehiculo.patente}"/><br>
                    <label>Color: </label>
                    <input type="text" name="color" value="${vehiculo.color}"/><br>
                    <label>Litros Combustible: </label>
                    <input type="text" name="litros_combustible" value="${vehiculo.litros_combustible}"/><br>
                    <label>Precio: </label>
                    <input type="text" name="precio_alquiler" value="${vehiculo.precio_alquiler}"/><br>
                    <label>Entregado: </label>
                    <input type="text" name="entregado" value="${vehiculo.entregado}"/><br>
                     <input type="hidden" name="tipo" value="vehiculo"/> 
                    <input type="hidden" name="action" value="editar_vehiculo"/>
                    <input type="hidden" name="id" value="${vehiculo.id}"/>
                    <input type="submit" value="Editar" class="boton-update"/>
                </form>
                     <br>
                <form method="post" action="ControladorAdministrador">
                    <input type="hidden" name="tipo" value="vehiculo"/> 
                    <input type="hidden" name="action" value="volver_vehiculo"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </form>
        </div>
    </c:if>
    <c:if test="${action == 'eliminar'}">
        <div class="container">
            <h1>Eliminar Vehiculo de la Nomina</h1>
            <form method="post" action="ControladorAdministrador">
                <label>Marca: ${vehiculo.marca}</label><br>

                <label>Modelo: ${vehiculo.modelo}</label><br>

                <label>Patente: ${vehiculo.patente}</label><br>

                <label>Color: ${vehiculo.color}</label><br>

                <label>Litros Combustible: ${vehiculo.litros_combustible}</label><br>

                <label>Precio: ${vehiculo.precio_alquiler}</label><br>

                <label>Entregado: ${vehiculo.entregado}</label><br>
                 <input type="hidden" name="tipo" value="vehiculo"/> 
                <input type="hidden" name="action" value="eliminar_vehiculo"/>
                <input type="hidden" name="id" value="${vehiculo.id}"/>
                <input type="submit" value="Eliminar" class="boton-delete"/>
            </form>
                 <br>
            <form method="post" action="ControladorAdministrador">
                <input type="hidden" name="tipo" value="vehiculo"/> 
                <input type="hidden" name="action" value="volver_vehiculo"/> 
                <input type="submit" value="Salir" class="boton-submit"/>
            </form>
        </div>
    </c:if>
</body>
</html>
