<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controllers.*"%>
<%@ page import="models.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Listar todos los materiales</title>
</head>
<body>
	<%
		List<Material> listaMateriales = new ArrayList<>();
		MaterialDao vehiculoDao = new MaterialDao();
		listaMateriales = vehiculoDao.getAll();
	%>	
		<div>
		<table>
		    <thead>
		        <tr>
					<th>Datos materiales</th>
					<th></th>
	    			<th></th>
		     	</tr>
			    <tr>
		            <th>Id</th>
		            <th>Descripción</th>
		            <th>Cantidad</th>
		     	</tr>
		    </thead>
			<tbody>
	<% 	
		for(Material material : listaMateriales){						
	%>
				<tr>
					<td><%= material.getId() %></td>
					<td><%= material.getDesc() %></td>
					<td><%= material.getCtdad() %></td>
				</tr>			
	<%		
		}
	%>
				<tr>
					<td></td>
					<td></td>
					<td>
						<a href="index.jsp" class="boton-volver">Volver</a>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
</body>
</html>