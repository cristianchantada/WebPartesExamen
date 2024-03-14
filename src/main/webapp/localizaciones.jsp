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
<title>Listar todas las localizaciones</title>
</head>
<body>
	<%
		List<Localizacion> listaLocalizaciones = new ArrayList<>();
		LocalizacionDao localizacionDao = new LocalizacionDao();
		listaLocalizaciones = localizacionDao.getAll();
	%>	
		<div>
		<table>
		    <thead>
		        <tr>
					<th>Datos de las localizaciones</th>
					<th></th>
	    			<th></th>
	    			<th></th>
	    			<th></th>
		     	</tr>
			    <tr>
		            <th>Id</th>
		            <th>Dirección</th>
		            <th>Código Postal</th>
	    			<th>Localidad</th>
	    			<th>Provincia</th>
		     	</tr>
		    </thead>
			<tbody>
	<% 	
		for(Localizacion localizacion : listaLocalizaciones){						
	%>
				<tr>
					<td><%= localizacion.getId() %></td>
					<td><%= localizacion.getDireccion() %></td>
					<td><%= localizacion.getCp() %></td>
					<td><%= localizacion.getLocalidad() %></td>
					<td><%= localizacion.getProvincia() %></td>

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