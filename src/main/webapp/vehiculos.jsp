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
<title>Listar todos los vehículos</title>
</head>
<body>
	<%
		List<Vehiculo> listaVehiculos = new ArrayList<>();
		VehiculoDao vehiculoDao = new VehiculoDao();
		listaVehiculos = vehiculoDao.getAll();
	%>	
		<div>
		<table>
		    <thead>
		        <tr>
					<th>Datos vehiculos</th>
					<th></th>
	    			<th></th>
		     	</tr>
			    <tr>
		            <th>Matricula</th>
		            <th>Marca</th>
		            <th>Modelo</th>
		     	</tr>
		    </thead>
			<tbody>
	<% 	
		for(Vehiculo vehiculo : listaVehiculos){						
	%>
				<tr>
					<td><%= vehiculo.getMatricula() %></td>
					<td><%= vehiculo.getMarca() %></td>
					<td><%= vehiculo.getModelo() %></td>
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