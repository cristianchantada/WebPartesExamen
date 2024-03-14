<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controllers.*" %>
<%@ page import="models.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Listado de todos los partes</title>
</head>
<body>
<%
    List<Parte> listaPartes = new ArrayList<>();
    ParteDao parteDao = new ParteDao();
    listaPartes = parteDao.getAll();
    int i = 1;
    for(Parte parte : listaPartes){
        Vehiculo vehiculo = parte.getVehiculo();
        Localizacion localizacion = parte.getLocalizacion();
        Empleado empleado = parte.getEmpleado();
        Cliente cliente = parte.getCliente();
%>
    <div class="parte-container">
        <h2>Parte número <%= i++ %> con ID <%= parte.getId() %> </h2>
        <div>
            <table>
                <thead>
                    <tr class="main-row">
                        <th colspan="10">Datos generales del parte</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class="main-row">
                        <th>Id de parte</th>
                        <th>NIF de cliente</th>
                        <th>Descripción de obra/servicio</th>
                        <th>NIF de empleado</th>
                        <th>Fecha del parte</th>
                        <th>Materiales</th>
                        <th>Servicios</th>
                        <th>Matrícula vehículo empresa</th>
                        <th>Estado del parte</th>
                        <th>Localización</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= parte.getId() %></td>
                        <td><%= parte.getCliente().getNif() %></td>
                        <td><%= parte.getDescripcion() %></td>
                        <td><%= parte.getEmpleado().getNif() %></td>
                        <td><%= parte.getFecha() %></td>
                        <td><%= parte.getMaterialDescription() %></td>
                        <td><%= parte.getServicioDescription() %></td>
                        <td><%= parte.getVehiculo().getMatricula() %></td>
                        <td><%= parte.getEstado() %></td>
                        <td><%= parte.getLocalizacion().getLocalidad() %> (<%= parte.getLocalizacion().getProvincia() %>)</td>
                    </tr>
                    <tr class="client-rows">
                        <th colspan="10">Datos del cliente de este parte</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class="client-rows">
                        <th>Nif</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Email</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><%= cliente.getNif() %></td>
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getCorreo() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="employee-rows">
                        <th colspan="10">Datos del empleado de este parte</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class="employee-rows">
                        <th>Nif</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Email</th>
                        <th>Codigo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><%= empleado.getNif() %></td>
                        <td><%= empleado.getNombre() %></td>
                        <td><%= empleado.getCorreo() %></td>
                        <td><%= empleado.getTelefono() %></td>
                        <td><%= empleado.getCodigo() %></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="location-rows">
                        <th colspan="10" >Datos de la localización de este parte</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class="location-rows">
                        <th>Id</th>
                        <th>Dirección</th>
                        <th>Código Postal</th>
                        <th>Localidad</th>
                        <th>Provincia</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><%= localizacion.getId() %></td>
                        <td><%= localizacion.getDireccion() %></td>
                        <td><%= localizacion.getCp() %></td>
                        <td><%= localizacion.getLocalidad() %></td>
                        <td><%= localizacion.getProvincia() %></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="vehicle-rows">
                        <th colspan="10">Datos del vehículo de este parte</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class="vehicle-rows">
                        <th>Matricula</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><%= vehiculo.getMatricula() %></td>
                        <td><%= vehiculo.getMarca() %></td>
                        <td><%= vehiculo.getModelo() %></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
<%
    }
%>
<a href="index.jsp" class="boton-volver">Volver</a>
</body>
</html>
