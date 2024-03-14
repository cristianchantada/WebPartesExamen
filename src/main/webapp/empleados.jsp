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
<title>Listar todos los empleados</title>
</head>
<body>	
	<%
		List<Empleado> listaEmpleados = new ArrayList<>();
		EmpleadoDao empleadoDao = new EmpleadoDao();
		listaEmpleados = empleadoDao.getAll();
	%>	
		<div>
		<table>
		    <thead>
		        <tr>
		            <th>Datos Empleados</th>
	    			<th></th>
	    			<th></th>
	    			<th></th>
	    			<th></th>
		     	</tr>
			    <tr>
		            <th>Nif</th>
		            <th>Nombre</th>
		            <th>Correo</th>
		            <th>Email</th>
		            <th>Codigo</th>		            
		     	</tr>
		    </thead>
			<tbody>
	<% 		
		for(Empleado empleado : listaEmpleados){						
	%>
				<tr>
					<td><%= empleado.getNif() %></td>
					<td><%= empleado.getNombre() %></td>
					<td><%= empleado.getCorreo() %></td>
					<td><%= empleado.getTelefono() %></td>
					<td><%= empleado.getCodigo() %></td>
				</tr>			
	<%		
		}
	%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>		
					<td class="return-link">
						<a href="index.jsp" class="boton-volver">Volver</a>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
</body>
</html>