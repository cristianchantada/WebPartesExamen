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
<title>Listar todos los servicios</title>
</head>
<body>
	<%
		List<Servicio> listaLocalizaciones = new ArrayList<>();
		ServicioDao servicioDao = new ServicioDao();
		listaLocalizaciones = servicioDao.getAll();
	%>	
		<div>
		<table>
		    <thead>
		        <tr>
					<th>Datos de los servicios</th>
					<th></th>
	    			<th></th>
	    			<th></th>
	    			<th></th>
		     	</tr>
			    <tr>
		            <th>Id</th>
		            <th>Hora de entrada</th>
		            <th>Hora de salida</th>
	    			<th>Fecha</th>
	    			<th>Descripción</th>
		     	</tr>
		    </thead>
			<tbody>
	<% 	
		for(Servicio servicio : listaLocalizaciones){						
	%>
				<tr>
					<td><%= servicio.getId() %></td>
					<td><%= servicio.getHe() %></td>
					<td><%= servicio.getHs() %></td>
					<td><%= servicio.getFecha() %></td>
					<td><%= servicio.getDesc() %></td>

				</tr>			
	<%		
		}
	%>
				<tr>
					<td></td>
					<td></td>
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