package misClases;

import java.sql.Timestamp;


public class Persona {
	private int id;
	private String nombre;
	private String apellido;
	private String mail;
	private boolean habilitado;
	private String notas;
	private Timestamp actualizado;
	
	public Persona(int id, String nombre, String apellido, String mail, boolean habilitado, String notas,
			Timestamp actualizado) {
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.mail = mail;
		this.habilitado = habilitado;
		this.notas = notas;
		this.actualizado = actualizado;
	}
	
	public Persona() {
	}


	@Override
	public String toString() {
		return "Persona con [mail=" + mail + "]";
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
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public boolean isHabilitado() {
		return habilitado;
	}
	public void setHabilitado(boolean habilitado) {
		this.habilitado = habilitado;
	}
	public String getNotas() {
		return notas;
	}
	public void setNotas(String notas) {
		this.notas = notas;
	}
	public Timestamp getActualizado() {
		return actualizado;
	}
	public void setActualizado(Timestamp actualizado) {
		this.actualizado = actualizado;
	}

}
