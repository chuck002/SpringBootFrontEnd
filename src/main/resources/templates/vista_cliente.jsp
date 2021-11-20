<%-- 
    Document   : vista_cliente
    Created on : 30/10/2021, 12:58:04
    Author     : javy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Menu Clientes</title>
    </head>
    <body>
        <div class="container">
            <h1>Bienvenido Cliente 
                <c:out value="${usuario.nombre}"/>
            </h1>
            <table class="centrada">
                <thead>
                    <tr>
                        <td>Id Reserva</td>
                        <td>Fecha de Inicio</td>
                        <td>Fecha de Cierre</td>
                        <td>Precio Total</td>
                        <td>ID Oficina</td>
                        <td>ID Cliente</td>
                        <td>Vehiculos Entregados</td>
                        <td>Vehiculos Reservados</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reserva" items="${datos_reservas}">
                        <c:if test="${reserva.id_cliente == usuario.id}">
                            <tr>
                                <td><c:out value="${reserva.id}"/></td>
                                <td><c:out value="${reserva.fecha_inicio}"/></td>
                                <td><c:out value="${reserva.fecha_final}"/></td>
                                <td><c:out value="${reserva.precio_total}"/></td>
                                <td><c:out value="${reserva.id_oficina}"/></td>
                                <td><c:out value="${reserva.id_cliente}"/></td>
                                <td>
                                    <c:forEach var="entregado" items="${reserva.vehiculos_entregados}">
                                        <c:out value="${entregado.id} - ${entregado.marca} ${entregado.modelo}"/>
                                        <br>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach var="reservado" items="${reserva.vehiculos_reservados}">
                                        <c:out value="${reservado.id} - ${reservado.marca} ${reservado.modelo}"/>
                                        <br>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <form action="index.jsp"method="post">
                <input type="submit" value="Cerrar Sesion" class="boton-delete">
            </form>
            <br>
        </div>
    </body>
</html>
