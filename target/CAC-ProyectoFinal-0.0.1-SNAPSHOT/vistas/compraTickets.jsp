<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="misClases.TipoTicketDAO"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
	<title>Comprar Tickets</title>
</head>

<body>
	<header class="sticky-top">
		<nav class="navbar navbar-expand-md colorFondoEncabezado pt-0 pb-2" aria-label="Thirteenth navbar example">
			<div class="container-xl">
				<a class="navbar-brand ms-3 me-3 text-white" href="#">
					Conf Bs As
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarsExample11" aria-controls="navbarsExample11" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse d-md-flex" id="navbarsExample11">
					<ul class="navbar-nav flex-grow-1 justify-content-end align-items-end text-end linkEncabezado">
						<li class="nav-item">
							<a class="" href="FrontController#laConferencia">La conferencia</a>
						</li>
						<li class="nav-item">
							<a class="" href="FrontController#losOradores">Los oradores</a>
						</li>
						<li class="nav-item">
							<a class="" href="FrontController#lugarYFecha">El lugar y la fecha</a>
						</li>
						<li class="nav-item">
							<a class="" href="FrontController#convertirteEnOrador">Conviértete en orador</a>
						</li>
						<li class="nav-item">
							<a id="linkBackOffice" href="#">Back Office</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main class="container mt-4 text-center " style="max-width: 740px;">
		<div class="d-flex mb-1 justify-content-between">
			<div class="p-2 border flex-grow-1 border-primary ">
				<p class="estiloCabeceraDescuentos">Estudiante</p>
				<p>Tienen un descuento</p>
				<p class="estiloDescuentos">80%</p>
				<p class="estiloRecordatorio">*presentar documentación</p>
			</div>
			<div class="p-2  flex-grow-1 border border-success mx-1">
				<p class="estiloCabeceraDescuentos">Trainee</p>
				<p>Tienen un descuento</p>
				<p class="estiloDescuentos">50%</p>
				<p class="estiloRecordatorio">*presentar documentación</p>
			</div>
			<div class="p-2  flex-grow-1 border border-warning">
				<p class="estiloCabeceraDescuentos">Junior</p>
				<p>Tienen un descuento</p>
				<p class="estiloDescuentos">15%</p>
				<p class="estiloRecordatorio">*presentar documentación</p>
			</div>
		</div>
		VENTA
		<% 
				TipoTicketDAO tipoTicketDAO = new TipoTicketDAO();
				tipoTicketDAO.cargarTicketsPredefinidos();
				int valorTicket = (int)tipoTicketDAO.valorTicket();
		%>
		<p class="valorTicket">VALOR DE TICKET $<%=valorTicket%></p>
		<form action="FrontController?accion=comprar" method="post">
			<input id="valorDelTicket" type="hidden" value=<%=valorTicket%>>
			<div class="row">
				<div class="col-6 mb-1">
					<input class="form-control" id="nombre" name="nombre" type="text" placeholder="Nombre"
						aria-label="default input example">
				</div>
				<div class="col-6 mb-1">
					<input class="form-control" id="apellido" name="apellido" type="text" placeholder="Apellido"
						aria-label="default input example">
				</div>
			</div>
			<div class="row">
				<div class="col-12 mb-2">
					<input class="form-control" id="correo" name="correo" type="text" placeholder="Correo"
						aria-label="default input example">
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-6 text-start">
					<label for="cantidad" class="form-label">Cantidad</label>
					<input id="cantidad" name="cantidad" class="form-control" type="number" min="0"
						placeholder="cantidad" aria-label="default input example">
				</div>
				<div class="col-6 text-start">
					<label for="categoria" class="form-label">Categoria</label>
					<select id="categoria" name="categoria" class="form-select" aria-label="Default select example">
						<option value="1" selected>Sin descuento</option>
						<option value="2">Estudiante</option>
						<option value="3">Trainee</option>
						<option value="4">Junior</option>
					</select>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-12">
					<input id="debePagar" name="debePagar" class="form-control bg-primary-subtle mb-1 p-3" type="text"
						value="Total a pagar: $" aria-label="readonly input example" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-3 d-grid">
					<a id="botonVolver" class="btn btn-secondary" href="FrontController">Volver</a>
				</div>
				<div class="col-3 d-grid">
					<button type="reset" class="btn btn-secondary">Borrar</button>
				</div>
				<div class="col-6 d-grid">
					<a id="botonCalcular" class="btn btn-primary">Calcular</a>
				</div>
			</div>
			<div class="row">
				<div class="col-12 d-grid mt-2">
					<button type="submit" class="w-100 btn btn-success" >Comprar</button>
				</div>
			</div>
			
		</form>
	</main>
	<footer class="container-fluid mt-3 d-flex align-items-center text-center">
		<div class="container pt-3 pb-3">
			<div class="row d-flex align-items-center">
				<div class="col m-1">
					<a href="#">Preguntas<br>frecuentes</a>
				</div>
				<div class="col m-1">
					<a href="#">Contáctanos</a>
				</div>
				<div class="col m-1">
					<a href="#">Prensa</a>
				</div>
				<div class="col m-1">
					<a href="#">Conferencias</a>
				</div>
				<div class="col m-1">
					<a href="#">Términos y condiciones</a>
				</div>
				<div class="col m-1">
					<a href="#">Privacidad</a>
				</div>
				<div class="col m-1">
					<a href="#">Estudiantes</a>
				</div>
			</div>
		</div>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="js/laConferencia.js"></script>
</body>

</html>