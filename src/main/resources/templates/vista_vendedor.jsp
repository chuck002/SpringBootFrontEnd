<%-- 
    Document   : vista_vendedor
    Created on : 30/10/2021, 12:58:23
    Author     : javy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Menu Vendedor</title>
    </head>
    <body>
        <div>
            <h1>Bienvenido Vendedor 
                <c:out value="${usuario.nombre}"/>
            </h1>
            <h1>Usuarios Listados</h1>
            <table class="centrada">
                <thead>
                    <tr>
                        <td>Id Usuario</td>
                        <td>User</td>
                        <td>Pass</td>
                        <td>Nombre</td>
                        <td>Dni</td>
                        <td>Direccion</td>
                        <td>Telefono</td>
                        <td>Sucursal</td>
                        <td>Editar Usuario</td>
                        <td>Eliminar Usuario</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${datos_usuarios}">
                        <c:if test="${usuario.rol == 3}">
                            <tr>
                                <td><c:out value="${usuario.id}"/></td>
                                <td><c:out value="${usuario.user}"/></td>
                                <td><c:out value="${usuario.pass}"/></td>
                                <td><c:out value="${usuario.nombre}"/></td>
                                <td><c:out value="${usuario.dni}"/></td>
                                <td><c:out value="${usuario.direccion}"/></td>
                                <td><c:out value="${usuario.telefono}"/></td>
                                <td><c:out value="${usuario.sucursal}"/></td>
                                <td>
                                    <form action="ControladorVendedor" method="post">
                                        <input type="hidden" name="id" value="${usuario.id}"/>
                                        <input type="hidden" name="tipo" value="usuario"/>
                                        <input type="hidden" name="action" value="editar"/>
                                        <input type="submit" value="Editar" class="boton-update"/>
                                    </form>
                                </td>
                                <td>
                                    <form action="ControladorVendedor" method="post">
                                        <input type="hidden" name="id" value="${usuario.id}"/>
                                        <input type="hidden" name="tipo" value="usuario"/>
                                        <input type="hidden" name="action" value="eliminar"/>
                                        <input type="submit" value="Eliminar" class="boton-delete"/>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <form action="ControladorVendedor"method="post">
                <input type="hidden" name="tipo" value="usuario"/>
                <input type="hidden" name="action" value="agregar"/>
                <input type="submit" value="Agregar Nuevo Cliente" class="boton-submit">
            </form>
        </div>
        <div>
            <h1>Reservas</h1>
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
                        <td>Editar Reserva</td>
                        <td>Eliminar Reserva</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reserva" items="${datos_reservas}">
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
                            <td>
                                <form action="ControladorVendedor" method="post">
                                    <input type="hidden" name="id" value="${reserva.id}"/>
                                    <input type="hidden" name="tipo" value="reserva"/>
                                    <input type="hidden" name="action" value="editar"/>
                                    <input type="submit" value="Editar" class="boton-update"/>
                                </form>
                            </td>
                            <td>
                                <form action="ControladorVendedor" method="post">
                                    <input type="hidden" name="id" value="${reserva.id}"/>
                                    <input type="hidden" name="tipo" value="reserva"/>
                                    <input type="hidden" name="action" value="eliminar"/>
                                    <input type="submit" value="Eliminar" class="boton-delete"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <form action="ControladorVendedor"method="post">
                <input type="hidden" name="tipo" value="reserva"/>
                <input type="hidden" name="action" value="agregar"/>
                <input type="submit" value="Agregar Nueva Reserva" class="boton-submit">
            </form>
        </div>
        <br>
        <form action="index.jsp"method="post">
            <input type="submit" value="Cerrar Sesion" class="boton-delete">
        </form>
        <br>
    </body>
</html>
