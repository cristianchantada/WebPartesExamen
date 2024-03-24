<%@page import="javax.swing.SwingConstants"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controllers.*"%>
<%@ page import="models.*"%>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
    <script>
        function reloadPage() {
            location.reload();
        }
    </script>
<title>Listar todos los clientes</title>
</head>
<body>	
	<%
		List<Cliente> listaClientes = new ArrayList<>();
		ClienteDao clienteDao = new ClienteDao();
		listaClientes = clienteDao.getAll();
		
		if (request.getMethod().equals("POST")){
			
			String[] options = {"Sí", "No", "Cancelar"};
			int selectedOption = JOptionPane.showConfirmDialog(null, "¿Está seguro eue desea eliminar el cliente?"
					, "Eliminar cliente"
					, JOptionPane.YES_NO_OPTION
			);
			
			switch(selectedOption){
				case JOptionPane.YES_OPTION:
					Cliente deletedClient = new Cliente(request.getParameter("deletedClientNif"));
					ClienteDao clientDao2 = new ClienteDao();
					clientDao2.delete(deletedClient);
				%>	
				 <script>
                    window.location.href = "clientes.jsp";
                 </script> 
                 <%
				case JOptionPane.NO_OPTION:
					break;
			}
		}
	%>	<div>
		<table>
		    <thead>
		        <tr>
		            <th>Datos clientes</th>
		            <th></th>
		            <th></th>
		            <th></th>
         		    <th></th>
		            <th></th>			      
		     	</tr>
			    <tr>
		            <th>Nif</th>
		            <th>Nombre</th>
		            <th>Correo</th>
		            <th>Teléfono</th>
            		<th></th>
		            <th></th>
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
					<td>
						<form action="modificacionCliente.jsp">
							<input type="hidden" name="clientNif" value="<%= cliente.getNif() %>">
							<button type="submit">
								<img src="./img/editIcon.png" alt="Icono de enviar">
							</button>
						</form>
					</td>
					<td>
						<form action="clientes.jsp" method="POST">
							<input type="hidden" name="deletedClientNif" value="<%= cliente.getNif() %>">
							<button type="submit">
								<img src="./img/deleteIcon.png" alt="Icono de borrar">
							</button>
						</form>
					</td>
				</tr>			
	<%		
		}
	%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<a href="home.jsp" class="boton-volver">Volver</a>
					</td>
				</tr>
			</tbody>
		</table>		
		</div>
</body>
</html>