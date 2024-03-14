package controllers;

public class Material {
	
	private int id;
	private String desc;
	private int ctdad;
	
	public Material() {}
	
	public Material(String desc, int ctdad) {
		this.desc = desc;
		this.ctdad = ctdad;
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

	public int getCtdad() {
		return ctdad;
	}

	public void setCtdad(int ctdad) {
		this.ctdad = ctdad;
	}

	

}
