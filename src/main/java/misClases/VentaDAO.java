package misClases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {
	Connection conexion = null;

	public VentaDAO() throws ClassNotFoundException {
		Conexion con = new Conexion();
		conexion = con.getConnection();
	}

	public boolean nuevaVenta(Persona persona, TipoTicket tipoTicket, float valorTicket, int cantidad) {
		PreparedStatement ps;

		if (persona.isHabilitado()) {
			try {
				ps = conexion
						.prepareStatement("insert into tickets_vendidos(persona, tipo_ticket, valor_ticket, cantidad)"
								+ "values (?, ?, ?, ?)");
				ps.setInt(1, persona.getId());
				ps.setInt(2, tipoTicket.getId());
				ps.setFloat(3, valorTicket);
				ps.setInt(4, cantidad);
				ps.execute();
				return true;
			} catch (SQLIntegrityConstraintViolationException e) {
				System.out.println("Esto ya se encuentra registrado!");
				return false;
			} catch (SQLException e) {
				System.out.println("en VENTAS_DAO");
				System.out.println(e);
				return false;
			}

		} else {
			System.out.println("No puede comprar");
			return false;
		}
	}

	public List<Venta> listarVentas() {
		PreparedStatement ps;
		ResultSet rs;
		List<Venta> lista = new ArrayList<>();

		try {
			ps = conexion.prepareStatement("select * from tickets_vendidos");
			rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int persona = rs.getInt("persona");
				int tipoTicket = rs.getInt("tipo_ticket");
				float valorTicket = rs.getFloat("valor_ticket");
				int cantidad = rs.getInt("cantidad");
				Timestamp actualizado = rs.getTimestamp("actualizado");

				Venta venta = new Venta(id, persona, tipoTicket, valorTicket, cantidad, actualizado);
				lista.add(venta);
			}
			return lista;

		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}

	}
}
