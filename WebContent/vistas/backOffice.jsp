<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				
				List<Ticket> resultado=null;
				TicketDAO ticket=new TicketDAO();
				resultado=ticket.listarTickets();
				int totalFacturado=0;
				
				for(int x=0;x<resultado.size();x++)
				{
				String rutaE="FrontController?accion=eliminar&id="+resultado.get(x).getId();
				
				String tipoTicket;
				
				if(resultado.get(x).getTipo_ticket()==1)
				{
					tipoTicket="Estudiante";
				}
				else if(resultado.get(x).getTipo_ticket()==2)
				{
					tipoTicket="Trainee";
				}
				else
				{
					tipoTicket="Junior";
				}				
				%>
				<tr>
					<td><%=resultado.get(x).getId()%></td>
					<td><%=resultado.get(x).getNombre()%></td>
					<td><%=resultado.get(x).getApellido()%></td>
					<td><%=resultado.get(x).getMail()%></td>
					<td><%=resultado.get(x).getCant()%></td>
					<td><%=tipoTicket%></td>
					<td><%=resultado.get(x).getTotal_facturado()%></td>
					<td class="text-center" ><a href=<%=rutaE%>><i class="fa-solid fa-file"></i></a></td>
				</tr>
				<%
				totalFacturado+=resultado.get(x).getTotal_facturado();
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
		
		
		<a class="btn btn-success col-2 m-2" href="FrontController?accion=volver">Volver</a>
		
		</div>	
</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>