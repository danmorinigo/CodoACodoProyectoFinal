package misClases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TipoTicketDAO {
	Connection conexion = null;

	public TipoTicketDAO() throws ClassNotFoundException {
		Conexion con = new Conexion();
		conexion = con.getConnection();
	}

	public boolean insertarTipoTicket(TipoTicket tipoTicket) {
		PreparedStatement ps;

		try {
			ps = conexion.prepareStatement("insert into tipo_tickets(nombre, descuento)" + "values (?,?)");
			ps.setString(1, tipoTicket.getNombre());
			ps.setFloat(2, tipoTicket.getDescuento());
			ps.execute();
			return true;
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(tipoTicket + " ya se encuentra registrado.");
			return false;
		} catch (SQLException e) {
			System.out.println("en TIPOTICKET_DAO");
			System.out.println(e);
			return false;
		}

	}

	public List<TipoTicket> listarTipoTickets() {
		PreparedStatement ps;
		ResultSet rs;
		List<TipoTicket> lista = new ArrayList<>();

		try {
			ps = conexion.prepareStatement("select * from tipo_tickets");
			rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				float descuento = rs.getFloat("descuento");
				Timestamp actualizado = rs.getTimestamp("actualizado");
				TipoTicket tipoTicket = new TipoTicket(id, nombre, descuento, actualizado);
				lista.add(tipoTicket);
			}
			return lista;

		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	public float valorTicket() {
		TipoTicket valorTicket = buscarTipoTicket(1);
		return valorTicket.getDescuento();
	}
	public TipoTicket buscarTipoTicket(int codigoTicket) {
		PreparedStatement ps;
		ResultSet rs;
		TipoTicket tipoTicket = null;

		try {
			ps = conexion.prepareStatement("select * from tipo_tickets where id = " + codigoTicket);
			rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				float descuento = rs.getFloat("descuento");
				Timestamp actualizado = rs.getTimestamp("actualizado");
				tipoTicket = new TipoTicket(id, nombre, descuento, actualizado);
				
			}
			return tipoTicket;

		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	public void cargarTicketsPredefinidos() {
		this.insertarTipoTicket(new TipoTicket(1, "ValorTicket", 500));
		this.insertarTipoTicket(new TipoTicket(2, "sinDescuento", 0.0f));
		this.insertarTipoTicket(new TipoTicket(3, "Estudiante", 0.8f));
		this.insertarTipoTicket(new TipoTicket(4, "Trainee", 0.5f));
		this.insertarTipoTicket(new TipoTicket(5, "Junior", 0.15f));
	}
	public int idTipoTicket(String nombreTipoTicket) {
		PreparedStatement ps;
		ResultSet rs;
		try {
			//System.out.println(email);
			ps = conexion.prepareStatement("select * from tipo_tickets where nombre=\"" + nombreTipoTicket + "\"");
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt("id");
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		
	}
}
