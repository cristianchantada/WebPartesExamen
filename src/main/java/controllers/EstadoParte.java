package controllers;

public enum EstadoParte {
    EN_PROCESO("En proceso"),
    TERMINADO("Terminado");

    private final String estadoParte;

    EstadoParte(String estadoParte){
        this.estadoParte = estadoParte;
    }

}
