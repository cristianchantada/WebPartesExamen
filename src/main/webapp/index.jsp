<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="controllers.*"%>
<%@ page import="models.*"%>
<%@ page import="java.io.IOException"%>
<%@page import="javax.swing.SwingConstants"%>
<%@page import="javax.swing.JOptionPane"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="index.css" />
<title>Login partes</title>
</head>
<body>

	<%
	boolean showWrongAccess = false;
	boolean showLimitAccess = false;

	if (request.getMethod().equals("POST")) {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		ClienteDao clienteDao = new ClienteDao();
		Cliente cliente = new Cliente();
		cliente = clienteDao.getClientByEmail(email);
		ClienteDao clienteDao2 = new ClienteDao();
		clienteDao2.updateAccessCounter((cliente.getAccessCounter() + 1), cliente.getNif());

		LocalTime lastAccessTime = cliente.getAccessTime();
		
		long minutesDifference = 0;
		if (lastAccessTime != null) {
			minutesDifference = lastAccessTime.until(LocalTime.now(), ChronoUnit.SECONDS);
		}

		
		if (cliente.getAccessCounter() >= 2 && minutesDifference < 60) {
			showLimitAccess = true;
		} else if (password.equals(cliente.getPassword())) {
			
			response.sendRedirect("home.jsp");
			ClienteDao clienteDao3 = new ClienteDao();
			clienteDao3.setClientAccessTime(null, cliente.getNif());
			//Cuando cliente acceda correctamente siempre contador de acceso a cero.
			ClienteDao clienteDao4 = new ClienteDao();
			clienteDao4.updateAccessCounter(0, cliente.getNif());
		} else {
			showWrongAccess = true;
		}
	}
	%>
	<div class="main-page-container">
		<form action="index.jsp" method="POST">
			<label for="email">Correo electrónico</label> <input type="email"
				id="email" name="email" required /> <label for="">Contraseña</label>
			<input type="password" id="password" name="password" required />
			<button type="submit">Iniciar sesión</button>
		</form>
	</div>
	<%
	if (showLimitAccess) {
	%>
	<p>Se ha alcanzado el límite de intentos o debes esperar al menos 2
		minutos entre intentos de acceso.</p>
	<%
	} else if (showWrongAccess) {
	%>
	<p>Email o contraseña incorrecta, por favor, inténtelo de nuevo</p>
	<%
	}
	%>
</body>
</html>
