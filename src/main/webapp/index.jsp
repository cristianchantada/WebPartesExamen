<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
		if (request.getMethod().equals("POST")) {
			
			System.out.println("Aquí entro 1");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			System.out.println("Aquí entro 2");
			ClienteDao clienteDao = new ClienteDao();
			Cliente cliente = new Cliente();
			cliente = clienteDao.getClientByEmail(email);
	
			System.out.println("empleado getPassword() = " + cliente.getPassword());
			System.out.println("password = " + password);
			
			if (password.equals(cliente.getPassword())) {
				
				System.out.println("Aquí entro 3");
				
				response.sendRedirect("home.jsp");
			} else {
				showWrongAccess = true;
			}
		}
	%>
		<div class="main-page-container">
			<form action="index.jsp" method="POST">
				<label for="email">Correo electrónico</label> 
				<input type="email" id="email" name="email" required /> 
				<label for="">Contraseña</label>
				<input type="password" id="password" name="password" required/>
				<button type="submit">Iniciar sesión</button>
			</form>
		</div>
	<%
		if (showWrongAccess) {
	%>
		<p>Email o contraseña incorrecta, por favor, inténtelo de nuevo</p>
	<%
		}
	%>
</body>
</html>
