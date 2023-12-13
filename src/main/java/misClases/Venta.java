package misClases;

import java.sql.Timestamp;

public class Venta {
	private int id;
	private int persona;
	private int tipoTicket;
	private float valorTicket;
	private int cantidad;
	private Timestamp actualizado;
	
	public Venta(int id, int persona, int tipoTicket, float valorTicket, int cantidad, Timestamp actualizado) {
		this.id = id;
		this.persona = persona;
		this.tipoTicket = tipoTicket;
		this.valorTicket = valorTicket;
		this.cantidad = cantidad;
		this.actualizado = actualizado;
	}

	public Venta(int persona, int tipoTicket, float valorTicket, int cantidad) {
		this.persona = persona;
		this.tipoTicket = tipoTicket;
		this.valorTicket = valorTicket;
		this.cantidad = cantidad;
	}

	public Venta() {
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPersona() {
		return persona;
	}
	public void setPersona(int persona) {
		this.persona = persona;
	}
	public int getTipoTicket() {
		return tipoTicket;
	}
	public void setTipoTicket(int tipoTicket) {
		this.tipoTicket = tipoTicket;
	}
	public float getValorTicket() {
		return valorTicket;
	}
	public void setValorTicket(float valorTicket) {
		this.valorTicket = valorTicket;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public Timestamp getActualizado() {
		return actualizado;
	}
	public void setActualizado(Timestamp actualizado) {
		this.actualizado = actualizado;
	}
}
