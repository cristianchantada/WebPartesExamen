<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controllers.*" %>
<%@ page import="models.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de consulta de trabajos</title>
<link href="mi.css" rel="stylesheet" type="text/css">
</head>
<body>

<%


System.out.println(request.getParameter("empleado"));

EmpleadoDao empleadoDao = new EmpleadoDao();
ParteDao parteDao = new ParteDao();
Empleado empleado = new Empleado(request.getParameter("empleado"));
empleado = empleadoDao.get(empleado);

List<Parte> listaPartes = new ArrayList<>();
listaPartes = parteDao.getParteByEmployeeId(empleado);

%>


<h1>Informe de trabajos del empleado:
</h1>
<form action="vertrabajosempleado.jsp" method="post" name="trabajosempleado" id="trabajosempleado">
  <table width="74%" border="1">
    <tr>
      <th colspan="2">Consulta trabajos empleado</th></tr>
    <tr>
      <td>NIF del empleado : </td>
      <td><%= empleado.getNif() %></td>
    </tr>
    <tr>
      <td>Nombre:</td>
      <td><%= empleado.getNombre() %></td>
    </tr>
    <tr>
      <td>Trabajos realizados:</td>
      <td>&nbsp;</td>
    </tr>
    
    <%
    	int i = 1;
    	for(Parte parte : listaPartes){

    %>
    
    <tr>
    	<td><%= i++ %>.- <strong>Id del parte:</strong> <%= parte.getId() %> </td>
      <td><strong>Fecha: </strong><%= parte.getFecha() %> </td>
      <td><strong>Servicio realizado:</strong> <%= parte.getServicioDescription() %></td>
    </tr>
    <% } %>
    <tr>
      <td colspan="2" align="center"><input type="button" name="Enviar" id="Enviar" value="Volver" onClick="javascritp:window.history.back();"></td>
    </tr>
  </table>
  	
</form>
</body>
</html>