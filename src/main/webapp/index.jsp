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
<link rel="stylesheet" href="login.css" />
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
		LocalTime lastAccessTime = cliente.getAccessTime();

		long minutesDifference = lastAccessTime.until(LocalTime.now(), ChronoUnit.MINUTES);

		if (cliente.getAccessCounter() >= 5 && minutesDifference < 2) {
			showLimitAccess = true;
		} else if (password.equals(cliente.getPassword())) {
			response.sendRedirect("home.jsp");
			ClienteDao clienteDao2 = new ClienteDao();
			clienteDao2.updateAccessCounterToZero(cliente.getNif());
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
