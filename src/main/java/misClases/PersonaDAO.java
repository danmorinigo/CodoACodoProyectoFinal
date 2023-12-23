package misClases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO {
	Connection conexion = null;

	public PersonaDAO() throws ClassNotFoundException {
		Conexion con = new Conexion();
		conexion = con.getConnection();
	}

	public boolean insertarPersona(Persona persona) {
		PreparedStatement ps;

		try {
			ps = conexion.prepareStatement("insert into personas(nombre,apellido,mail)" + "values (?,?,?)");
			ps.setString(1, persona.getNombre());
			ps.setString(2, persona.getApellido());
			ps.setString(3, persona.getMail());
			ps.execute();
			return true;
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(persona + " ya se encuentra registrada.");
			return false;
		} catch (SQLException e) {
			System.out.println("en PERSONA_DAO");
			System.out.println(e);
			return false;
		}

	}

	public Persona crear(String nombre, String apellido, String mail) {
		Persona creada = new Persona(nombre, apellido, mail);
		return creada;
	}
	public int idPersona(String email) {
		PreparedStatement ps;
		ResultSet rs;
		try {
			System.out.println(email);
			ps = conexion.prepareStatement("select * from personas where mail=\"" + email + "\"");
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt("id");
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	public List<Persona> listarPersonas() {
		PreparedStatement ps;
		ResultSet rs;
		List<Persona> lista = new ArrayList<>();

		try {
			ps = conexion.prepareStatement("select * from personas");
			rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String mail = rs.getString("mail");
				boolean habilitado = rs.getBoolean("habilitado");
				String notas = rs.getString("notas");
				Timestamp actualizado = rs.getTimestamp("actualizado");
				Persona persona = new Persona(id, nombre, apellido, mail, habilitado, notas, actualizado);
				lista.add(persona);
			}
			return lista;

		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}

	}
	public Persona buscarPorId(int idPersona) {
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conexion.prepareStatement("select * from personas where id=\"" + idPersona + "\"");
			rs = ps.executeQuery();
			rs.next();
			int id = rs.getInt("id");
			String nombre = rs.getString("nombre");
			String apellido = rs.getString("apellido");
			String mail = rs.getString("mail");
			boolean habilitado = rs.getBoolean("habilitado");
			String notas = rs.getString("notas");
			Timestamp actualizado = rs.getTimestamp("actualizado");
			Persona persona = new Persona(id, nombre, apellido, mail, habilitado, notas, actualizado);
			return persona;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
