<%-- 
    Document   : vista_administrador_usuario
    Created on : 30/10/2021, 22:15:34
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
                <h1>Agregar Nueva Reserva</h1>
                <form method="post" action="ControladorVendedor">
                    <label>Fecha de Inicio: </label>
                    <input type="date" name="fecha_inicio" required="true"/><br>
                    <label>Fecha de Finalizacion: </label>
                    <input type="date" name="fecha_final" required="true"/><br>
                    <label>Id Oficina: </label>
                    <input type="number" name="id_oficina" required="true"/><br>
                    <label>Id Cliente: </label>
                    <select name="id_cliente">
                        <c:forEach var="usuario" items="${usuarios}">
                            <c:if test="${usuario.rol == '3'}">
                                <option value="${usuario.id}">${usuario.nombre}</option>
                            </c:if>
                        </c:forEach>
                    </select><br>
                    <label>Seleccionar Vehiculos: </label>
                    <table class="centrada">
                        <thead>
                        <td>Agregar Vehiculo</td>
                        <td>Id Vehiculo</td>
                        <td>Precio de Alquiler</td>
                        <td>Litros en Tanque</td>
                        <td>Fue Entregado</td>
                        <td>Patente</td>
                        <td>Modelo</td>
                        <td>Marca</td>
                        <td>Color</td>
                        </thead>
                        <tbody>
                            <c:forEach var="vehiculo" items="${vehiculos}">
                                <tr>
                                    <td><input type="checkbox" name="vehiculos_reservados[]" value="${vehiculo.id}"></td>
                                    <td><c:out value="${vehiculo.id}"/></td>
                                    <td><c:out value="${vehiculo.precio_alquiler}"/></td>
                                    <td><c:out value="${vehiculo.litros_combustible}"/></td>
                                    <td><c:if test="${vehiculo.entregado == 0}">
                                            No
                                        </c:if>
                                        <c:if test="${vehiculo.entregado == 1}">
                                            Si
                                        </c:if>
                                    </td>
                                    <td><c:out value="${vehiculo.patente}"/></td>
                                    <td><c:out value="${vehiculo.modelo}"/></td>
                                    <td><c:out value="${vehiculo.marca}"/></td>
                                    <td><c:out value="${vehiculo.color}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <label>Vehiculos Entregados: </label>
                    <select name="entregados">
                        <option value="0">No</option>
                        <option value="1">Si</option>
                    </select><br>
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="agregar_reserva"/>
                    <input type="submit" value="Agregar" class="boton-submit"/>
                </form>
                 <br>
                <form method="post" action="ControladorVendedor">
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="volver_reservas"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
        <c:if test="${action == 'editar'}">
            <div class="container">
                <h1>Editar Reserva</h1>
                <form method="post" action="ControladorVendedor">
                    <label>Fecha de Inicio: </label>
                    <input type="date" name="fecha_inicio" value="${reserva.fecha_inicio}"/><br>
                    <label>Fecha de Finalizacion: </label>
                    <input type="date" name="fecha_final" value="${reserva.fecha_final}"/><br>
                    <label>Id Oficina: </label>
                    <input type="number" name="id_oficina" value="${reserva.id_oficina}"/><br>
                    <label>Id Cliente: </label>
                    <input type="text" name="id_cliente" readonly="true" value="${reserva.id_cliente}"/><br>
                    <label>Seleccionar Vehiculos: </label>
                    <table class="centrada">
                        <thead>
                        <td>Agregar Vehiculo</td>
                        <td>Id Vehiculo</td>
                        <td>Precio de Alquiler</td>
                        <td>Litros en Tanque</td>
                        <td>Fue Entregado</td>
                        <td>Patente</td>
                        <td>Modelo</td>
                        <td>Marca</td>
                        <td>Color</td>
                        </thead>
                        <tbody>
                            <c:forEach var="vehiculo" items="${reserva.vehiculos_reservados}">
                                <tr>
                                    <td>

                                        <input type="checkbox" checked="true" name="vehiculos_reservados[]" value="${vehiculo.id}">

                                    </td>
                                    <td><c:out value="${vehiculo.id}"/></td>
                                    <td><c:out value="${vehiculo.precio_alquiler}"/></td>
                                    <td><c:out value="${vehiculo.litros_combustible}"/></td>
                                    <td><c:if test="${vehiculo.entregado == 0}">
                                            No
                                        </c:if>
                                        <c:if test="${vehiculo.entregado == 1}">
                                            Si
                                        </c:if>
                                    </td>
                                    <td><c:out value="${vehiculo.patente}"/></td>
                                    <td><c:out value="${vehiculo.modelo}"/></td>
                                    <td><c:out value="${vehiculo.marca}"/></td>
                                    <td><c:out value="${vehiculo.color}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <label>Vehiculos Entregados: </label>
                    <select name="entregados">
                        <option value="0">No</option>
                        <option value="1">Si</option>
                    </select><br>
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="editar_reserva"/>
                    <input type="hidden" name="id" value="${reserva.id}"/>
                    <input type="submit" value="Editar" class="boton-update"/>
                </form>
                    <br>
                <form method="post" action="ControladorVendedor">
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="volver_reservas"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
        <c:if test="${action == 'eliminar'}">
            <div class="container">
                <h1>Eliminar Reserva</h1>
                <form method="post" action="ControladorVendedor">
                    <label>Id: <c:out value="${reserva.id}"/></label><br>

                    <label>Fecha de Inicio: <c:out value="${reserva.fecha_inicio}"/></label><br>

                    <label>Fecha de Cierre: <c:out value="${reserva.fecha_final}"/></label><br>

                    <label>Id: Oficina: <c:out value="${reserva.id_oficina}"/></label><br>

                    <label>Id Cliente: <c:out value="${reserva.id_cliente}"/></label><br>

                    <label>Vehiculos:</label><br>
                    <table class="centrada">
                        <thead>
                        <td>Id Vehiculo</td>
                        <td>Precio de Alquiler</td>
                        <td>Litros en Tanque</td>
                        <td>Fue Entregado</td>
                        <td>Patente</td>
                        <td>Modelo</td>
                        <td>Marca</td>
                        <td>Color</td>
                        </thead>
                        <tbody>
                            <c:forEach var="vehiculo" items="${reserva.vehiculos_reservados}">
                                <tr>
                                    <td><c:out value="${vehiculo.id}"/></td>
                                    <td><c:out value="${vehiculo.precio_alquiler}"/></td>
                                    <td><c:out value="${vehiculo.litros_combustible}"/></td>
                                    <td><c:if test="${vehiculo.entregado == 0}">
                                            No
                                        </c:if>
                                        <c:if test="${vehiculo.entregado == 1}">
                                            Si
                                        </c:if>
                                    </td>
                                    <td><c:out value="${vehiculo.patente}"/></td>
                                    <td><c:out value="${vehiculo.modelo}"/></td>
                                    <td><c:out value="${vehiculo.marca}"/></td>
                                    <td><c:out value="${vehiculo.color}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="eliminar_reserva"/>
                    <input type="hidden" name="id" value="${reserva.id}"/>
                    <input type="submit" value="Eliminar" class="boton-delete"/>
                </form>
                     <br>
                <form method="post" action="ControladorVendedor">
                    <input type="hidden" name="tipo" value="reserva"/> 
                    <input type="hidden" name="action" value="volver_reservas"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
    </body>

</html>
