package misClases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class Conexion {

	public String driver = "com.mysql.cj.jdbc.Driver";

	public Connection getConnection() throws ClassNotFoundException {
		Connection conexion = null;
		try {
			Class.forName(driver);
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectofinalcac", "root", "Laguna");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return conexion;
	}

	public static void main(String[] args) throws SQLException, ClassNotFoundException {

		Connection conexion = null;
		Conexion con = new Conexion();
		conexion = con.getConnection();

		PreparedStatement ps;
		ResultSet rs;

		ps = conexion.prepareStatement("select * from personas");
		rs = ps.executeQuery();

		while (rs.next()) {
			String nombre = rs.getString("nombre");
			System.out.println("El nombre es: " + nombre);
		}

		Persona p = new Persona();
		p.setApellido("PortFolio");
		p.setNombre("Perean");
		p.setMail("Hola@byesa");
		PersonaDAO pDAO = new PersonaDAO();
		String mailReferencia = p.getMail();

		pDAO.insertarPersona(p);
		List<Persona> listadoPersonas = pDAO.listarPersonas();
		Persona queCompra = null;
		for (Persona q : listadoPersonas) {
			if (q.getMail().equals(mailReferencia)) {
				queCompra = q;
				System.out.println(q + " id -> " + q.getId());
			}
		}
		TipoTicketDAO ttDAO = new TipoTicketDAO();
		ttDAO.cargarTicketsPredefinidos();
		List<TipoTicket> listadoTipoTicket = ttDAO.listarTipoTickets();

		VentaDAO vDAO = new VentaDAO();
		float valor = 200;
		vDAO.nuevaVenta(queCompra, listadoTipoTicket.get(0), valor, 5);
		vDAO.nuevaVenta(queCompra, listadoTipoTicket.get(1), valor, 2);
		vDAO.nuevaVenta(queCompra, listadoTipoTicket.get(2), valor, 1);

		List<Venta> listadoVentas = vDAO.listarVentas();
		for (Venta v : listadoVentas) {
			float descuent = ttDAO.buscarTipoTicket(v.getTipoTicket()).getDescuento();
			float precio = v.getValorTicket();
			int cant = v.getCantidad();
			float totalSinDescuento = precio * cant;
			float totalConDescuento = (precio - (precio * descuent)) * cant;
			System.out.println("Cant: " + cant + " - Sin Descuento: " + totalSinDescuento + " - Con Descuento["
					+ (int) (descuent * 100) + "%]: " + totalConDescuento);
		}
	}

}
