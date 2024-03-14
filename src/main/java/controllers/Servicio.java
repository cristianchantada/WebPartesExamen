package controllers;

import java.io.*;
import java.util.Date;

public class Servicio implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String desc;
	private String he;
	private String hs;
	private Date fecha;

	public Servicio() {}
	
	public Servicio(String desc, String he, String hs, Date fecha) {
		this.desc = desc;
		this.he = he;
		this.hs = hs;
		this.fecha = fecha;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getHe() {
		return he;
	}

	public void setHe(String he) {
		this.he = he;
	}

	public String getHs() {
		return hs;
	}

	public void setHs(String hs) {
		this.hs = hs;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

}