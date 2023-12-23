package misClases;

import java.io.IOException;
//import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String accion = null;
		
		Persona persona = null;
		PersonaDAO pDAO = null;
		TipoTicketDAO tDAO = null;
		VentaDAO vDAO = null;
		
		RequestDispatcher dispatcher = null;

		accion = request.getParameter("accion");

		if (accion == null || accion.isEmpty()) {
			dispatcher = request.getRequestDispatcher("vistas/index.jsp");
		} else if (accion.equals("registrar")) {
			dispatcher = request.getRequestDispatcher("vistas/compraTickets.jsp");
		} else if (accion.equals("comprar")) {
			try {
				pDAO = new PersonaDAO();
				tDAO = new TipoTicketDAO();
				vDAO = new VentaDAO();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			String nombre=request.getParameter("nombre");
			String apellido=request.getParameter("apellido");
			String mail=request.getParameter("correo");
			int cantidad = Integer.parseInt(request.getParameter("cantidad"));
			int tipoDeTicket = Integer.parseInt(request.getParameter("categoria"));
			String nombreTipoTicket = null;
			switch (tipoDeTicket){
				case 1:
					nombreTipoTicket = "sinDescuento";
					break;
				case 2:
					nombreTipoTicket = "Estudiante";
					break;
				case 3:
					nombreTipoTicket = "Trainee";
					break;
				case 4:
					nombreTipoTicket = "Junior";
					break;
					
			}
			persona = pDAO.crear(nombre, apellido, mail);
			pDAO.insertarPersona(persona);
			int idPersona = pDAO.idPersona(mail);
			int idTipoTicket = tDAO.idTipoTicket(nombreTipoTicket);
			float valorTicket = tDAO.valorTicket();
			boolean ventaLograda = vDAO.nuevaVenta(idPersona, idTipoTicket, valorTicket, cantidad);
			if(ventaLograda) {
				dispatcher = request.getRequestDispatcher("vistas/ventaLograda.jsp");
			}else {
				dispatcher = request.getRequestDispatcher("vistas/ventaNoLograda.jsp");
			}
		}

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
