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
                <h1>Agregar Nuevo Usuario a la Nomina</h1>
                <form method="post" action="ControladorAdministrador">
                    <label>User: </label>
                    <input type="text" name="user" required="true"/><br>
                    <label>Pass: </label>
                    <input type="text" name="pass" required="true"/><br>
                    <label>Rol: </label>
                    <select name="rol">
                        <option value="1" selected>Administrador</option>
                        <option value="2">Vendedor</option>
                        <option value="3">Cliente</option>
                    </select><br>
                    <label>Nombre Completo: </label>
                    <input type="text" name="nombre" required="true"/><br>
                    <label>dni: </label>
                    <input type="text" name="dni"/><br>
                    <label>Direccion: </label>
                    <input type="text" name="direccion"/><br>
                    <label>Telefono: </label>
                    <input type="text" name="telefono"/><br>
                    <label>Sucursal: </label>
                    <input type="number" name="sucursal"/><br>
                    <input type="hidden" name="tipo" value="usuario"/>
                    <input type="hidden" name="action" value="agregar_usuario"/>
                    <input type="submit" value="Agregar" class="boton-submit"/>
                </form>
                 <br>
                <form method="post" action="ControladorAdministrador">
                    <input type="hidden" name="tipo" value="usuario"/> 
                    <input type="hidden" name="action" value="volver_usuario"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
        <c:if test="${action == 'editar'}">
            <div class="container">
                <h1>Editar Usuario de la Nomina</h1>
                <form method="post" action="ControladorAdministrador">
                    <label>User: </label>
                    <input type="text" name="user" value="${usuario.user}"/><br>
                    <label>Pass: </label>
                    <input type="text" name="pass" value="${usuario.pass}"/><br>
                    <label>Rol: <c:out value="${usuario.rol}"/></label>
                    <select name="rol">
                        <option value="1">Administrador</option>
                        <option value="2">Vendedor</option>
                        <option value="3">Cliente</option>
                    </select><br>
                    <label>Nombre Completo: </label>
                    <input type="text" name="nombre" value="${usuario.nombre}"/><br>
                    <label>dni: </label>
                    <input type="text" name="dni" value="${usuario.dni}"/><br>
                    <label>Direccion: </label>
                    <input type="text" name="direccion" value="${usuario.direccion}"/><br>
                    <label>Telefono: </label>
                    <input type="text" name="telefono" value="${usuario.telefono}"/><br>
                    <label>Sucursal: </label>
                    <input type="number" name="sucursal" value="${usuario.sucursal}"/><br>
                    <input type="hidden" name="tipo" value="usuario"/>
                    <input type="hidden" name="action" value="editar_usuario"/>
                    <input type="hidden" name="id" value="${usuario.id}"/>
                    <input type="submit" value="Editar Usuario" class="boton-update"/>
                </form>
                     <br>
                <form method="post" action="ControladorAdministrador">
                    <input type="hidden" name="tipo" value="usuario"/> 
                    <input type="hidden" name="action" value="volver_usuario"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
        <c:if test="${action == 'eliminar'}">
            <div class="container">
                <h1>Eliminar Usuario de la Nomina</h1>
                <form method="post" action="ControladorAdministrador">
                    <label>Id: <c:out value="${usuario.id}"/></label><br>

                    <label>User: <c:out value="${usuario.user}"/></label><br>

                    <label>Pass: <c:out value="${usuario.pass}"/></label><br>

                    <label>Rol: <c:out value="${usuario.rol}"/></label><br>

                    <label>Nombre Completo: <c:out value="${usuario.nombre}"/></label><br>

                    <label>dni: <c:out value="${usuario.dni}"/></label><br>

                    <label>Direccion: <c:out value="${usuario.direccion}"/></label><br>

                    <label>Telefono: <c:out value="${usuario.telefono}"/></label><br>

                    <label>Sucursal: <c:out value="${usuario.sucursal}"/></label><br>
                    <input type="hidden" name="tipo" value="usuario"/>
                    <input type="hidden" name="action" value="eliminar_usuario"/>
                    <input type="hidden" name="id" value="${usuario.id}"/>
                    <input type="submit" value="Eliminar" class="boton-delete"/>
                </form>
                     <br>
                <form method="post" action="ControladorAdministrador">
                    <input type="hidden" name="tipo" value="usuario"/> 
                    <input type="hidden" name="action" value="volver_usuario"/> 
                    <input type="submit" value="Salir" class="boton-submit"/>
                </form>
            </div>
        </c:if>
    </body>
</html>
