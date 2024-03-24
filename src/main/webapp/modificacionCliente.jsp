<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controllers.*"%>
<%@ page import="models.*"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Editar cliente</title>
</head>
<body>
	<%
	String nif = request.getParameter("clientNif");
	String email = request.getParameter("clientEmail");
	String phone = request.getParameter("clientPhone");
	String name = request.getParameter("clientName");
	
	boolean wrongNif = false;
	boolean wrongEmail = false;
	boolean wrongName = false;
	boolean wrongPhone = false;
	boolean repeatedClient = false;

	Cliente client = new Cliente(request.getParameter("clientNif"));
	Cliente clientWithOldNif = new Cliente(request.getParameter("clientOldNif"));

	ClienteDao clientDao = new ClienteDao();
	client = clientDao.get(client);

	if (request.getMethod().equals("POST")) {

		ClienteDao clientDao2 = new ClienteDao();
		List<Cliente> clientsList = clientDao2.getAll();
		boolean checker = true;

		if (Cliente.clienteExiste(nif, clientsList)) {
			System.out.println("El cliente existe en la BD");
			
			String recoveredNif = Cliente.clienteExisteNifReturn(nif, clientsList);
			System.out.println("recoveredNif = " + recoveredNif);
			System.out.println("client.getNif() = " + client.getNif());
			
			if (!recoveredNif.equals(clientWithOldNif.getNif())) {
				System.out.println("El cliente está repetido");
				repeatedClient = true;
				checker = false;
			}
			System.out.println("Actualizamos el cliente sin cambiar su DNI");
		}

		if (!Validator.nifValidator(nif)) {
			wrongNif = true;
			checker = false;
		}

		if (!Validator.emailValidator(email)) {
			wrongEmail = true;
			checker = false;
		}

		if (!Validator.phoneValidator(phone)) {
			wrongPhone = true;
			checker = false;
		}

		if (!Validator.validarNombre(name)) {
			wrongName = true;
			checker = false;
		}

		if (checker) {
			Cliente modifiedClient = new Cliente();
			modifiedClient.setNif(nif);

			ClienteDao clientDao3 = new ClienteDao();

			String[] modifiedData = { name, email, phone, nif };
			clientDao3.update(clientWithOldNif, modifiedData);
			response.sendRedirect("clientes.jsp");
		} else {
			client.setNif(clientWithOldNif.getNif());
			client.setNombre(name);
			client.setCorreo(email);
			client.setTelefono(phone);
		}
	}
	%>
	<div>
		<table>
			<thead>
				<tr>
					<th coolspan="2">Datos cliente</th>
					<th></th>

				</tr>
			</thead>
			<tbody>
				<form action="modificacionCliente.jsp" method="POST">
					<tr>
						<td><strong><label for="clientNif">Nif</label></strong></td>
						<td><input type="text" id="clientNif" name="clientNif"
							value="<%=client.getNif()%>"></td>
					</tr>
					<tr>
						<td><strong><label for="clientName">Nombre</label></td>
						</strong>
						<td><input type="text" id="clientName" name="clientName"
							value="<%=client.getNombre()%>"></td>
					</tr>
					<tr>
						<td><strong><label for="clientPhone">Teléfono</label></strong>
						</td>
						<td><input type="text" id="clientPhone" name="clientPhone"
							value="<%=client.getTelefono()%>"></td>
					</tr>
					<tr>
						<td><strong><label for="clientEmail">Correo</label></strong>
						</td>
						<td><input type="text" id="clientEmail" name="clientEmail"
							value="<%=client.getCorreo()%>"></td>
					</tr>
					<tr>
						<td><input type="hidden" id="clientOldNif"
							name="clientOldNif" value="<%=client.getNif()%>"></td>
					</tr>

					<tr>
						<td>
							<button type="submit" class="boton-modificar">Modificar usuario</button>
						</td>
				</form>
				</tr>
				<tr>
					<td></td>


					<td><a href="clientes.jsp" class="boton-volver">Volver</a></td>
				</tr>
			</tbody>
		</table>
		
 		 <% if(repeatedClient){ %>
			<p style="color: red;">Este cliente ya existe en la BD, no puede volver a insertarlo</p>
		 <%}%>
		
		 <% if(wrongNif){ %>
			<p style="color: red;">El formato del NIF no es correcto, por favor, vuelva a intentarlo</p>
		 <%}%>
		 
 		 <% if(wrongName){ %>
			<p style="color: red;">El nombre de usuario no puede contener dígitos ni estar vacío</p>
		 <%}%>
		 
 		 <% if(wrongEmail){ %>
			<p style="color: red;">El formato del email no es correcto, por favor, vuelva a intentarlo</p>
		 <%}%>
		 
 		 <% if(wrongPhone){ %>
			<p style="color: red;">El formato de teléfono no es correcto, por favor, vuelva a intentarlo</p>
		 <%}%>
		
	</div>
</body>
</html>