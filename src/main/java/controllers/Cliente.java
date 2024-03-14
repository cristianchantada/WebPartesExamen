package controllers;

import java.util.List;

public class Cliente {

	private String nif;
	private String nombre;
	private String email;
	private String telefono;

	public Cliente() {
	}

	public Cliente(String nif) {
		this.nif = nif;
	}

	public Cliente(String nif, String nombre, String email, String telefono) {
		this(nif);
		this.nombre = nombre;
		this.email = email;
		this.telefono = telefono;
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
		return email;
	}

	public void setCorreo(String correo) {
		this.email = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Override
	public String toString() {
		return "El cliente ha sido creado con los siguientes datos:" + "\n\tNombre: " + nombre + "\n\tNIF: " + nif
				+ "\n\tTeléfono: " + telefono + "\n\tCorreo electrónico: " + email;
	}

	public static boolean clienteExiste(String nif, List<Cliente> lc) {
		if (lc != null) {
			for (Cliente c : lc) {
				if (nif.equals(c.nif))
					return true;
			}
			return false;
		}
		return false;
	}

}
