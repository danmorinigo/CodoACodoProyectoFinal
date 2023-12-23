package misClases;

import java.sql.Timestamp;

public class Venta {
	private int id;
	private int idPersona;
	private int idTipoTicket;
	private float valorTicket;
	private int cantidad;
	private Timestamp actualizado;
	
	public Venta(int id, int persona, int tipoTicket, float valorTicket, int cantidad, Timestamp actualizado) {
		this.id = id;
		this.idPersona = persona;
		this.idTipoTicket = tipoTicket;
		this.valorTicket = valorTicket;
		this.cantidad = cantidad;
		this.actualizado = actualizado;
	}

	public Venta(int persona, int tipoTicket, float valorTicket, int cantidad) {
		this.idPersona = persona;
		this.idTipoTicket = tipoTicket;
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
	public int getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}
	public int getIdTipoTicket() {
		return idTipoTicket;
	}
	public void setIdTipoTicket(int idTipoTicket) {
		this.idTipoTicket = idTipoTicket;
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
