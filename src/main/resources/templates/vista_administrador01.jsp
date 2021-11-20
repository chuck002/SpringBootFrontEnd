<%-- 
    Document   : vista_administrador
    Created on : 30/10/2021, 12:57:45
    Author     : javy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Menu Administrador</title>
    </head>
    <body>
        <div class="container">
            <h1>Bienvenido Administrador 
                <c:out value="${usuario.nombre}"/>
            </h1>
            <h1>Usuarios Listados</h1>
        </div>
        <div class="container">
            <div class="container_izquierda">
                <form action="ControladorAdministrador"method="post" >
                    <input type="hidden" name="tipo" value="usuario"/>
                    <input type="hidden" name="action" value="agregar"/>
                    <input type="submit" value="Agregar Nuevo Usuario" class="boton-submit">
                </form>
            </div>
        </div>
            <br>
        <div class="container">
            <table class="centrada">
                <thead>
                    <tr>
                        <th>Id Usuario</th>
                        <th>User</th>
                        <th>Pass</th>
                        <th>Rol</th>
                        <th>Nombre</th>
                        <th>Dni</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Sucursal</th>
                        <th>Editar Usuario</th>
                        <th>Eliminar Usuario</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${datos_usuarios}">
                        <tr>
                            <td><c:out value="${usuario.id}"/></td>
                            <td><c:out value="${usuario.user}"/></td>
                            <td><c:out value="${usuario.pass}"/></td>
                            <td><c:out value="${usuario.rol}"/></td>
                            <td><c:out value="${usuario.nombre}"/></td>
                            <td><c:out value="${usuario.dni}"/></td>
                            <td><c:out value="${usuario.direccion}"/></td>
                            <td><c:out value="${usuario.telefono}"/></td>
                            <td><c:out value="${usuario.sucursal}"/></td>
                            <td>
                                <form action="ControladorAdministrador" method="post">
                                    <input type="hidden" name="id" value="${usuario.id}"/>
                                    <input type="hidden" name="tipo" value="usuario"/>
                                    <input type="hidden" name="action" value="editar"/>
                                    <input type="submit" value="Editar" class="boton-update"/>
                                </form>
                            </td>
                            <td>
                                <form action="ControladorAdministrador" method="post">
                                    <input type="hidden" name="id" value="${usuario.id}"/>
                                    <input type="hidden" name="tipo" value="usuario"/>
                                    <input type="hidden" name="action" value="eliminar"/>
                                    <input type="submit" value="Eliminar" class="boton-delete"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

        </div>
        <div class="container">

            <h1>Vehiculos Listados</h1>
            <form action="ControladorAdministrador"method="post" class="boton_agregar">
                <input type="hidden" name="tipo" value="vehiculo"/>
                <input type="hidden" name="action" value="agregar"/>
                <input type="submit" value="Agregar Nuevo Vehiculo" class="boton-submit">
            </form>
            <br>
            <table class="centrada">
                <thead>
                    <tr>
                        <th>Id Vehiculo</th>
                        <th>Precio de Alquiler</th>
                        <th>Litros en Tanque</th>
                        <th>Fue Entregado</th>
                        <th>Patente</th>
                        <th>Modelo</th>
                        <th>Marca</th>
                        <th>Color</th>
                        <th>Editar Vehiculo</th>
                        <th>Eliminar Vehiculo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vehiculo" items="${datos_vehiculos}">
                        <tr>
                            <td><c:out value="${vehiculo.id}"/></td>
                            <td><c:out value="${vehiculo.precio_alquiler}"/></td>
                            <td><c:out value="${vehiculo.litros_combustible}"/></td>
                            <td><c:out value="${vehiculo.entregado}"/></td>
                            <td><c:out value="${vehiculo.patente}"/></td>
                            <td><c:out value="${vehiculo.modelo}"/></td>
                            <td><c:out value="${vehiculo.marca}"/></td>
                            <td><c:out value="${vehiculo.color}"/></td>
                            <td>
                                <form action="ControladorAdministrador" method="post">
                                    <input type="hidden" name="id" value="${vehiculo.id}"/>
                                    <input type="hidden" name="tipo" value="vehiculo"/>
                                    <input type="hidden" name="action" value="editar"/>
                                    <input type="submit" value="Editar" class="boton-update"/>
                                </form>
                            </td>
                            <td>
                                <form action="ControladorAdministrador" method="post">
                                    <input type="hidden" name="id" value="${vehiculo.id}"/>
                                    <input type="hidden" name="tipo" value="vehiculo"/>
                                    <input type="hidden" name="action" value="eliminar"/>
                                    <input type="submit" value="Eliminar" class="boton-delete"/>
                                </form>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

        </div>
        <br>
        <form action="index.jsp"method="post">
            <input type="submit" value="Cerrar Sesion" class="boton-delete">
        </form>
        <br>
    </body>
</html>
