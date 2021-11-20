<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/MainStyles.css" type="text/css"/>
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <h1>Login</h1>
            <form method="post" action="/tryuser">
                <div class="form-control">
                <label>Usuario: </label>
                <input type="text" name="user">
                </div>
                <div class="form-control">
                <label>Password: </label>
                <input type="password" name="pass">
                </div>
                <input type="submit" class="boton-submit" value="Login">
            </form>
        </div>
    </body>
</html>
