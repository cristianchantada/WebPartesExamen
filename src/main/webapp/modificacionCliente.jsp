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
			if (Cliente.clienteExisteNifReturn(nif, clientsList).equals(client.getNif())) {
		System.out.println("El cliente está repetido");
		Mensaje.verMensaje("Este cliente ya existe en la BD, no puede volver a insertarlo");
		checker = false;
			}
			System.out.println("Actualizamos el cliente sin cambiar su DNI");
		}

		if (!Validator.nifValidator(nif)) {
			Mensaje.verMensaje("El NIF no es correcto, por favor, buelva a intentarlo");
			checker = false;
		}

		if (!Validator.emailValidator(email)) {
			Mensaje.verMensaje("El formato de email no es válido, por favor, vuelva a introducirlo");
			checker = false;
		}

		if (!Validator.phoneValidator(phone)) {
			Mensaje.verMensaje("El número de teléfono no es válido, por favor, vuelva a introducirlo");
			checker = false;
		}

		if (!Validator.validarNombre(name)) {
			Mensaje.verMensaje("El nombre del cliente no es válido, por favor, inténtelo de nuevo");
			checker = false;
		}

		if (checker) {
			Cliente modifiedClient = new Cliente();
			modifiedClient.setNif(nif);

			ClienteDao clientDao3 = new ClienteDao();

			String[] modifiedData = { name, email, phone, nif };
			clientDao3.update(clientWithOldNif, modifiedData);
			Mensaje.verMensaje("Cliente actualizado correctamente");

		}
		response.sendRedirect("clientes.jsp");
	}
	%>
	<div>
		<table>
			<thead>
				<tr>
					<th>Datos cliente</th>
					<th></th>
					<th></th>
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

							<button type="submit">Modificar usuario</button>

						</td>
				</form>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="clientes.jsp" class="boton-volver">Volver</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>