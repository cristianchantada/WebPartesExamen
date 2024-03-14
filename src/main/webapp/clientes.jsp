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
<title>Listar todos los clientes</title>
</head>
<body>	
	<%
		List<Cliente> listaClientes = new ArrayList<>();
		ClienteDao clienteDao = new ClienteDao();
		listaClientes = clienteDao.getAll();
	%>	<div>
		<table>
		    <thead>
		        <tr>
		            <th>Datos clientes</th>
		            <th></th>
		            <th></th>
		            <th></th>		      
		     	</tr>
			    <tr>
		            <th>Nif</th>
		            <th>Nombre</th>
		            <th>Correo</th>
		            <th>Email</th>
		     	</tr>
		    </thead>
			<tbody>
	<% 			
		for(Cliente cliente : listaClientes){						
	%>
				<tr>
					<td><%= cliente.getNif() %></td>
					<td><%= cliente.getNombre() %></td>
					<td><%= cliente.getCorreo() %></td>
					<td><%= cliente.getTelefono() %></td>
				</tr>			
	<%		
		}
	%>
				<tr>
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