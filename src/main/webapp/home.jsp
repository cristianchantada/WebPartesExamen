<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="homeStyle.css">
    <title>Página Principal</title>   
</head>
<body>
    <h2>Listar las Clases</h2>
    <ul class="lists-ul">
        <li><a href="clientes.jsp">Clientes</a></li>
        <li><a href="empleados.jsp">Empleados</a></li>
        <li><a href="vehiculos.jsp">Vehículos</a></li>
        <li><a href="localizaciones.jsp">Localizaciones</a></li>
        <li><a href="materiales.jsp">Materiales</a></li>
        <li><a href="servicios.jsp">Servicios</a></li>
        <li><a href="partes.jsp">Partes</a></li>
    </ul>
    <h2>Otras funciones</h2>
    <ul class="other-functions-list">
        <li><a href="partesForm.jsp">Dar alta Parte</a></li>
    	<li><a href="consultatrabajosempleado.jsp">Consulta datos de empleados</a></li>	
    </ul>
    
    <ul class="logout-list">
    	<li><a href="index.jsp">Logout</a></li>	
    </ul>
    
    
</body>
</html>