<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="misClases.Venta"%>
<%@page import="misClases.VentaDAO"%>
<%@page import="misClases.Persona"%>
<%@page import="misClases.PersonaDAO"%>
<%@page import="misClases.TipoTicketDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Back Office</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
		<h1 class="text-primary" >Panel de Tickets</h1>
		<div class="row">
				<table class="table table-striped" >
					<thead>
						<th>Id Venta</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Mail</th>
						<th>Cantidad</th>
						<th>Tipo</th>
						<th>Total</th>
						<th>Eliminar</th>					
					</thead>					 
				<%
				
				List<Venta> ventas=null;
				
				VentaDAO vDAO = new VentaDAO();
				TipoTicketDAO ttDAO = new TipoTicketDAO();
				PersonaDAO pDAO = new PersonaDAO();
				Persona persona = null;
				ventas = vDAO.listarVentas();
				float totalFacturado=0;
				
				for(int x=0; x < ventas.size(); x++)
				{
				String rutaE="FrontController?accion=eliminar&id="+ventas.get(x).getId();
				persona = pDAO.buscarPorId(ventas.get(x).getIdPersona());
				String nombre = persona.getNombre();
				String apellido = persona.getApellido();
				String tipoTicket = ttDAO.buscarTipoTicket(ventas.get(x).getIdTipoTicket()).getNombre();
				float descuento = ttDAO.buscarTipoTicket(ventas.get(x).getIdTipoTicket()).getDescuento();
				float total = (ventas.get(x).getValorTicket() - (ventas.get(x).getValorTicket() * descuento))* ventas.get(x).getCantidad();
				%>
				<tr>
					<td><%=ventas.get(x).getId()%></td>
					<td><%=nombre%></td>
					<td><%=apellido%></td>
					<td><%=persona.getMail()%></td>
					<td><%=ventas.get(x).getCantidad()%></td>
					<td><%=tipoTicket%></td>
					<td><%=total%></td>
					<td class="text-center" ><a href=<%=rutaE%>><i class="fa-solid fa-file"></i></a></td>
				</tr>
				<%
				totalFacturado += total;
				}
				%>
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="text-danger" ><%=totalFacturado%></td>
					<td></td>				
				</tr>
				
		</table>
		
		
		<a class="btn btn-success col-2 m-2" href="FrontController">Volver</a>
		
		</div>	
</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>