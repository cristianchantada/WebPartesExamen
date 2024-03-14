package models;

import controllers.EstadoParte;
import controllers.Mensaje;
import controllers.Partes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartesDao implements DaoInterface<Partes> {

    private Connection conn;
    private PreparedStatement preparedStatement;
    private ResultSet rs;

    public PartesDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/partes";
            String user = "root";
            String password = "0000";
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("Failed to initialize PartesDao: " + e.getMessage());
        }
    }

    @Override
    public List<Partes> getAll() {
        List<Partes> partesList = new ArrayList<>();
        String sql = "SELECT * FROM partes";
        try {
            preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Partes partes = new Partes();
                partes.setId(rs.getInt("id"));
                partes.setCliente(rs.getString("cliente"));
                partes.setObra(rs.getString("obra"));
                partes.setEmpleado(rs.getString("empleado"));
                partes.setFecha(rs.getDate("fecha"));
                partes.setMateriales(rs.getString("materiales"));
                partes.setServicios(rs.getString("servicios"));
                partes.setVehiculo(rs.getString("vehiculo"));
                partes.setEstado(EstadoParte.valueOf(rs.getString("estado")));
                partes.setLocalizacion(rs.getInt("localizacion"));
                partesList.add(partes);
            }
        } catch (SQLException e) {
            System.out.println("SQL exception in PartesDao.getAll: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return partesList;
    }

    @Override
    public void save(Partes partes) {
        String sql = "INSERT INTO partes (cliente, obra, empleado, fecha, materiales, servicios, vehiculo, estado, localizacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, partes.getCliente());
            preparedStatement.setString(2, partes.getObra());
            preparedStatement.setString(3, partes.getEmpleado());
            preparedStatement.setDate(4, new java.sql.Date(partes.getFecha().getTime()));
            preparedStatement.setString(5, partes.getMateriales());
            preparedStatement.setString(6, partes.getServicios());
            preparedStatement.setString(7, partes.getVehiculo());
            preparedStatement.setString(8, partes.getEstado().name());
            preparedStatement.setInt(9, partes.getLocalizacion());
            preparedStatement.executeUpdate();
            Mensaje.verMensaje("Parte insertado correctamente");
        } catch (SQLException e) {
            System.out.println("Error al insertar el parte en PartesDao: " + e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public void update(Partes partes, String[] params) {
        String sql = "UPDATE partes SET cliente = ?, obra = ?, empleado = ?, fecha = ?, materiales = ?, servicios = ?, vehiculo = ?, estado = ?, localizacion = ? WHERE id = ?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, partes.getCliente());
            preparedStatement.setString(2, partes.getObra());
            preparedStatement.setString(3, partes.getEmpleado());
            preparedStatement.setDate(4, new java.sql.Date(partes.getFecha().getTime()));
            preparedStatement.setString(5, partes.getMateriales());
            preparedStatement.setString(6, partes.getServicios());
            preparedStatement.setString(7, partes.getVehiculo());
            preparedStatement.setString(8, partes.getEstado().name());
            preparedStatement.setInt(9, partes.getLocalizacion());
            preparedStatement.setInt(10, partes.getId());
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                Mensaje.verMensaje("Parte actualizado correctamente");
            } else {
                Mensaje.verMensaje("No se encontró ningún parte con el ID proporcionado");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el parte en PartesDao: " + e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public void delete(Partes partes) {
        String sql = "DELETE FROM partes WHERE id = ?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, partes.getId());
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                Mensaje.verMensaje("Parte eliminado correctamente");
            } else {
                Mensaje.verMensaje("No se encontró ningún parte con el ID proporcionado");
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar el parte en PartesDao: " + e.getMessage());
        } finally {
            closeConnection();
        }
    }

    @Override
    public Partes get(Partes partes) {
        Partes foundPartes = null;
        String sql = "SELECT * FROM partes WHERE id = ?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, partes.getId());
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                foundPartes = new Partes();
                foundPartes.setId(rs.getInt("id"));
                foundPartes.setCliente(rs.getString("cliente"));
                foundPartes.setObra(rs.getString("Obra"));
                foundPartes.setEmpleado(rs.getString("empleado"));
                foundPartes.setFecha(rs.getDate("fecha"));
                foundPartes.setMateriales(rs.getString("materiales"));
                foundPartes.setServicios(rs.getString("servicios"));
                foundPartes.setVehiculo(rs.getString("vehiculo"));
                foundPartes.setEstado(EstadoParte.valueOf(rs.getString("estado")));
                foundPartes.setLocalizacion(rs.getInt("localizacion"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el parte en PartesDao: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return foundPartes;
    }

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión en PartesDao: " + e.getMessage());
        }
    }
}
