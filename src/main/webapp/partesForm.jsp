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
<link rel="stylesheet" href="mi.css">
<title>Insert title here</title>
</head>
<body>

<%

	EmpleadoDao empleadoDao = new EmpleadoDao();
	ClienteDao clienteDao = new ClienteDao();
	VehiculoDao vehiculoDao = new VehiculoDao();
	LocalizacionDao localizacionDao = new LocalizacionDao();
	
	List<Empleado> listaEmpleados = new ArrayList<>();
	List<Cliente> listaClientes = new ArrayList<>();
	List<Vehiculo> listaVehiculos = new ArrayList<>();
	List<Localizacion> listaLocalizaciones = new ArrayList<>();
	
	listaEmpleados = empleadoDao.getAll();
	listaClientes = clienteDao.getAll();
	listaVehiculos = vehiculoDao.getAll();
	listaLocalizaciones = localizacionDao.getAll();
	
	
	// Estos Strings para cuando se pida insertar parte, ahora no hacen nada
	String clienteNif = request.getParameter("cliente");
	String empleadoNif = request.getParameter("empleado");
	String vehiculoMatricula = request.getParameter("vehiculo");
	String obraDescripcion = request.getParameter("obra");
	String localizacion = request.getParameter("localizacion");
	String fecha = request.getParameter("fecha");
	String materiales = request.getParameter("materiales");
		
%>


<h1>Partes de trabajo
</h1>
<form action="" method="post" name="Clientes" id="Clientes">
  <table width="81%" border="1">
    <tr>
      <th colspan="2">Alta de parte</th></tr>
    <tr>
      <td>Cliente: </td>
      <td><select name="cliente" id="cliente">
		<%      
      	for(Cliente cliente: listaClientes){
      %>		
      		<option value="<%= cliente.getNif() %>"><%= cliente.getNif() %> , <%= cliente.getNombre()%></option>
      <%		
      	}  
      %>
      </select></td>   
    </tr>
    <tr>
      <td>Obra/servicio: </td>
      <td><input type="text" name="obra" id="nombre3"></td>
    </tr>
    <tr>
      <td>Empleado: </td>
      <td><select name="empleado" id="empleado">
		<%      
      	for(Empleado empleado: listaEmpleados){
      %>		
      		<option value="<%= empleado.getNif() %>"><%= empleado.getNif() %> , <%= empleado.getNombre()%></option>
      <%		
      	}  
      %>
      </select></td>
    </tr>
    <tr>
      <td>Localizacion:</td>
            <td><select name="localizacion" id="vehiculo">
		<%      
      	for(Localizacion localizacion2: listaLocalizaciones){
      %>		
      		<option value="<%= localizacion2.getId() %>"><%= localizacion2.getLocalidad() %> , <%= localizacion2.getProvincia()%>, <%= localizacion2.getDireccion()%></option>
      <%		
      	}  
      %>
      </select></td></tr>
    <tr>
      <td>Fecha:</td>
      <td><input type="text" name="fecha" id="fecha"></td>
    </tr>
    <tr>
      <td>Materiales:</td>
      <td><textarea name="materiales" cols="40" rows="10" id="materiales"></textarea></td>
    </tr>
    <tr>
      <td>Servicios:</td>
      <td><textarea name="servicios" cols="40" rows="10" id="servicios"></textarea></td>
    </tr>
    <tr>
      <td>Vehiculo:</td>
      <td><select name="vehiculo" id="vehiculo">
		<%      
      	for(Vehiculo vehiculo: listaVehiculos){
      %>		
      		<option value="<%= vehiculo.getMatricula() %>"><%= vehiculo.getMatricula() %> , <%= vehiculo.getModelo()%></option>
      <%		
      	}  
      %>
      </select></td>
    </tr>
    <tr>
      <td>Observaciones:</td>
      <td><input type="text" name="telefono5" id="telefono5"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="Enviar" id="Enviar" value="Dar parte de Alta"></td>
    </tr>
  </table>
</form>
</body>
</html>