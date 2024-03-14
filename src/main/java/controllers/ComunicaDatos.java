package controllers;

import java.util.List;

public interface ComunicaDatos {
    void enviaDatosServicios(List<Servicio> servicios);
    void enviaDatosMaterial(List<Material> servicios);
}
