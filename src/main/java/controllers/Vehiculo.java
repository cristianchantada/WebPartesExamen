package controllers;
import java.io.Serializable;

public class Vehiculo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String matricula;
    private String marca;
    private String modelo;
    
    public Vehiculo(String matricula) {
    	this.matricula = matricula;
    }
    
    
    public Vehiculo(String matricula, String marca, String modelo) {
        this(matricula);
        this.marca = marca;
        this.modelo = modelo;
    }

	@Override
	public String toString() {
		return "Nuevo vehículo añadido a la BD: "
				+ "\n\tMatrícula: " + matricula
				+ "\n\tMarca: " + marca
				+ "\n\tModelo: " + modelo;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	
	
}
