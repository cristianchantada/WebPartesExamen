package controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Empleado implements Serializable {

	private static final long serialVersionUID = 1L;
	private String nombre;
	private String nif;
	private String correo;
	private String telefono;
	private String codigo;

	public Empleado(String nif) {
		this.nif = nif;
	}

	public Empleado(String nif, String name, String tlf, String mail, String codigoOperario) {
		this(nif);
		this.nombre = name;
		this.correo = mail;
		this.telefono = tlf;
		this.codigo = codigoOperario;
	}

	@Override
	public String toString() {
		return "El empleado ha sido creado con los siguientes datos:" + "\n\tNombre: " + nombre + "\n\tNIF: " + nif
				+ "\n\tTeléfono: " + telefono + "\n\tCorreo electrónico: " + correo + "\n\tCódigo empleado" + codigo;
	}

	public static boolean empleadoExiste(String nif, List<Empleado> le) {
		for (Empleado e : le) {
			if (nif.equals(e.nif))
				return true;
		}
		return false;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNif() {
		return nif;
	}

	public void setNif(String nif) {
		this.nif = nif;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	
}