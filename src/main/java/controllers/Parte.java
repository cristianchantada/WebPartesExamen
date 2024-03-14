package controllers;
import java.io.Serializable;
import java.util.Date;

public class Parte implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String descripcion;
    private Date fecha;
    private String observaciones;
    private EstadoParte estado = EstadoParte.EN_PROCESO;
    private Cliente cliente;
    private Empleado empleado;
    private Vehiculo vehiculo; //opcional
    private Servicio servicio; //opcional
    private Material material; //opcional
    private Localizacion localizacion;
    
    private String materialDescription;
    private String servicioDescription;

    public Parte() {}
    
    public Parte(int id) {
    	this.id = id;
    }

    public Parte(int id, Date fecha, Cliente cliente, Empleado empleado, Vehiculo vehiculo, Servicio servicio) {
        this(id);
        this.fecha = fecha;
        this.cliente = cliente;
        this.empleado = empleado;
        this.vehiculo = vehiculo;
        this.servicio = servicio;
    }

    @Override
    public String toString() {
        return "----- Parte con fecha" + fecha + "-------\n" +
                "\t\tObservaciones:" + observaciones + "\n" +
                "\t\tEstado:\n\t\t\t" + estado + "\n" +
                "\t\tCliente:\n\t\t\t" + cliente + "\n" +
                "\t\tEmpleado:\n\t\t\t" + empleado + "\n" +
                "\t\tVehiculo:\n\t\t\t" + vehiculo + "\n" +
                "\t\tServicio:\n\t\t\t" + servicio + "\n" +
                "\t\tMaterial:\n\t\t\t" + material + "\n" +
                "\t\tlocalizacion\t\t\t: " + localizacion + "\n\n";
    }
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public EstadoParte getEstado() {
		return estado;
	}

	public void setEstado(EstadoParte estado) {
		this.estado = estado;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Empleado getEmpleado() {
		return empleado;
	}

	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}

	public Servicio getServicio() {
		return servicio;
	}

	public void setServicio(Servicio servicio) {
		this.servicio = servicio;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public Localizacion getLocalizacion() {
		return localizacion;
	}

	public void setLocalizacion(Localizacion localizacion) {
		this.localizacion = localizacion;
	}

	public String getMaterialDescription() {
		return materialDescription;
	}

	public void setMaterialDescription(String materialDescription) {
		this.materialDescription = materialDescription;
	}

	public String getServicioDescription() {
		return servicioDescription;
	}

	public void setServicioDescription(String servicioDescription) {
		this.servicioDescription = servicioDescription;
	}
    
	
    
    
}