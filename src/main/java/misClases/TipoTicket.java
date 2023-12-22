package misClases;

import java.sql.Timestamp;

public class TipoTicket {
	private int id;
	private String nombre;
	private float descuento;
	private Timestamp actuaLizado;
	public TipoTicket(int id, String nombre, float descuento, Timestamp actuaLizado) {
		this.id = id;
		this.nombre = nombre;
		this.descuento = descuento;
		this.actuaLizado = actuaLizado;
	}
	public TipoTicket(String nombre, float descuento) {
		this.nombre = nombre;
		this.descuento = descuento;
	}
	public TipoTicket(int id, String nombre, float descuento) {
		this.id = id;
		this.nombre = nombre;
		this.descuento = descuento;
	}
	public TipoTicket() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getDescuento() {
		return descuento;
	}
	public void setDescuento(float valor) {
		this.descuento = valor;
	}
	public Timestamp getActuaLizado() {
		return actuaLizado;
	}
	public void setActuaLizado(Timestamp actuaLizado) {
		this.actuaLizado = actuaLizado;
	}
	@Override
	public String toString() {
		return "TipoTicket [" + nombre + "]";
	}
	
}
