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
String clienteNif = request.getParameter("cliente");
String empleadoNif = request.getParameter("empleado");
String vehiculoMatricula = request.getParameter("vehiculo");
String obraDescripcion = request.getParameter("obra");
String localizacion = request.getParameter("localizacion");
String fecha = request.getParameter("fecha");
String materiales = request.getParameter("materiales");

%>


<h1>Informe de trabajos del empleado:
</h1>
<form action="vertrabajosempleado.jsp" method="post" name="trabajosempleado" id="trabajosempleado">
  <table width="74%" border="1">
    <tr>
      <th colspan="2">Consulta trabajos empleado</th></tr>
    <tr>
      <td>NIF del empleado : </td>
      <td>00000032D</td>
    </tr>
    <tr>
      <td>Nombre:</td>
      <td>N00000000</td>
    </tr>
    <tr>
      <td>Trabajos realizados:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>1: 0000-00-00 </td>
      <td>Revision TV del Salon de Actos</td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="button" name="Enviar" id="Enviar" value="Volver" onClick="javascritp:window.history.back();"></td>
    </tr>
  </table>
</form>
</body>
</html>