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
EmpleadoDao empleadoDao = new EmpleadoDao();
List<Empleado> listaEmpleados = new ArrayList<>();
listaEmpleados = empleadoDao.getAll();


%>



<h1>Partes de trabajo
</h1>
<form action="vertrabajosempleado.jsp" method="post" name="trabajosempleado" id="trabajosempleado">
  <table width="50%" border="1">
    <tr>
      <th colspan="2">Consulta trabajos empleado</th></tr>
    	
    <tr>
      <td><select name="empleado" id="empleado">
		<%      
      	for(Empleado empleado: listaEmpleados){
      %>		
      		<option value="<%= empleado.getNif() %>"><%= empleado.getNif() %> , <%= empleado.getNombre()%></option>
      <%		
      	}  
      %>
      </select></td></tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="Enviar" id="Enviar" value="Enviar"></td>
    </tr>
  </table>
</form>
</body>
</html>

