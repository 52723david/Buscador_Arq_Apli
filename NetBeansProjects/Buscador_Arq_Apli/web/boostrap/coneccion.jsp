<%-- 
    Document   : coneccion
    Created on : 25/01/2016, 11:21:41
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conección</title>
    </head>
    <body>
        <!--<h1>Hello World!</h1>-->
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/buscador"
                           user="root"  password=""/>
        <%
            /*podemos leer los datos del request a una variable*/
            String nombre1 = request.getParameter("nombre");
            String cedula1 = request.getParameter("cedula");
            String email1 =  request.getParameter("email");
            String telefono1 =  request.getParameter("telefono");
            //String val = (String) ("INSERT INTO usuarios VALUES (0, '"+nombre1+"', '"+cedula1+"', '"+email1+"', '"+telefono1+"')");
            //out.print(nombre1+"<br/>"+cedula1+"<br/>"+email1+"<br/>"+telefono1);
        %>
        <sql:update dataSource="${snapshot}" var="result">
            INSERT INTO usuarios VALUES (0, 'nombre1', 118475869, 'email1', 09477686);
        </sql:update>
        <%out.print("La inserción fue correcta");%>
    </body>
</html>
