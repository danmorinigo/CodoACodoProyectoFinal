<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
	<title>Integrador FrontEnd</title>
</head>

<body>
	<a name="laConferencia"></a>
	<header class="sticky-top">
		<nav class="navbar navbar-expand-md colorFondoEncabezado pt-0 pb-2" aria-label="Thirteenth navbar example">
			<div class="container-xl">
				<a class="navbar-brand me-3 text-white" href="#">
					<img src="img/codoacodo.png" alt="Logo" width="100px" class="d-inline-block">
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
							<a class="" href="#laConferencia">La conferencia</a>
						</li>
						<li class="nav-item">
							<a class="" href="#losOradores">Los oradores</a>
						</li>
						<li class="nav-item">
							<a class="" href="#lugarYFecha">El lugar y la fecha</a>
						</li>
						<li class="nav-item">
							<a class="" href="#convertirteEnOrador">Conviértete en orador</a>
						</li>
						<li class="nav-item">
							<a id="linkComprarTickets" href="FrontController?accion=registrar">Comprar tickets</a>
						</li>
						<li class="nav-item">
							<a id="linkBackOffice" href="FrontController?accion=backOffice">Back Office</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main>

		<div id="carouselExampleAutoplaying"
			class="carousel slide position-relative d-flex align-items-center justify-content-end"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/ba1.jpg" class="d-block w-100 opaco" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/ba2.jpg" class="d-block w-100 opaco" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/ba3.jpg" class="d-block w-100 opaco" alt="...">
				</div>
			</div>

			<div class="position-absolute text-end col-md-6 col-12 text-light px-5">
				<div class="d-none d-md-block pt-3 mt-3">
					<h1>
						Conf Bs As
					</h1>
					<p>
						Bs As llega por primera vez a Argentina. Un evento para compartir con
						nuestra comunidad el conocimiento y experiencia de los expertos que
						están creando el futuro de Internet. Ven a conocer a miembros del
						evento, a otros estudiantes de Codo a Codo y los oradores de primer
						nivel que tenemos para ti. ¡Te esperamos!
					</p>
				</div>
				<div class="d-none d-sm-block d-md-none text-center mt-5">
					<h1>
						Conf Bs As
					</h1>
					<p>
						Por primera vez a Argentina. Veni a conocer los miembros del
						evento, estudiantes y oradores de primer
						nivel que tenemos para ti. ¡Te esperamos!
					</p>
				</div>
				<div class="d-block d-sm-none text-center mb-0 pb-0 mt-5">
					<p class="mb-0 pt-3">
						Conoce los miembros del
						evento. ¡Te esperamos!
					</p>
				</div>
				<div class="pt-1 d-grid gap-2 d-md-block">
				<p>
					<a class="btn btn-outline-light mb-3" href="#convertirteEnOrador">Quiero ser orador</a> <a class="btn btn-success ms-2 mb-3" href="FrontController?accion=registrar">Comprar tickets</a>
				</p>
				</div>
			</div>
		</div>

		<a name="losOradores"></a>
		<div class="container p-3" style="max-width: 70%;">
			<p style="text-align: center; font-size:0.7rem;">CONOCE A LOS<br>
				<spam style="font-size:1.5rem;">ORADORES<spam></spam>
			</p>

			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="card">
						<img src="img/steve.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<a href="#" class="btn tamanioBotonesCard javaScript px-1 pt-0 pb-0">JavaScript</a>
							<a href="#" class="btn tamanioBotonesCard react px-1 pt-0 pb-0">React</a>
							<h5 class="card-title">Steve Jobs</h5>
							<p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
								tempore neque iure magni id deserunt adipisci ratione mollitia illum nesciunt odit
								possimus, provident nobis totam vel. Voluptatum aliquid tenetur eos.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="img/bill.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<a href="#" class="btn tamanioBotonesCard javaScript px-1 pt-0 pb-0">JavaScript</a>
							<a href="#" class="btn tamanioBotonesCard react px-1 pt-0 pb-0">React</a>
							<h5 class="card-title">Bill Gates</h5>
							<p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eum, eius
								incidunt qui velit tempore a earum nemo ab cum, labore cupiditate quod ex veritatis
								facilis quaerat dolores, obcaecati nam. Vel, asperiores iure. Eius cum quidem
								perferendis odio corrupti vel placeat.</p>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card">
						<img src="img/ada.jpeg" class="card-img-top" alt="...">
						<div class="card-body">
							<a href="#" class="btn tamanioBotonesCard negocios px-1 pt-0 pb-0">Negocios</a>
							<a href="#" class="btn tamanioBotonesCard startUps px-1 pt-0 pb-0">Startups</a>
							<h5 class="card-title">Ada Lovelace</h5>
							<p class="card-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Omnis
								explicabo quibusdam incidunt amet atque ipsam recusandae voluptatum dolor saepe
								delectus, tempora quas. Tenetur blanditiis tempora nisi doloribus rerum, optio aperiam
								eaque excepturi, iste eius, commodi adipisci alias praesentium.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<a name="lugarYFecha"></a>
		<div class="container-fluid p-0">
			<div class="row g-0 m-0">
				<div class="col-md-6 border border-white">
					<img src="img/honolulu.jpg" alt="" class="img-fluid m-0">
				</div>
				<div class="col-md-6 p-2 border border-white" style="background-color:rgb(49, 48, 48);">
					<div class="card-body text-white">
						<h5 class="card-title">Bs As - Octubre</h5>
						<p class="card-text mt-2 mb-4">
							Buenos Aires es la provincia y localidad más grande del estado de Argentina, en los Estados
							Unidos.
							Honolulu es la más sureña de entre las principales ciudades estadounidenses. Aunque el
							nombre de Honolulu
							se refiere al área urbana en la costa sureste de la isla de Oahu, la ciudad y el condado de
							Honolulu
							han formado una ciudad-condado consolidada que cubre toda la ciudad (aproximadamente 600
							km<sup>2</sup> de superficie).
						</p>
						<button type="button" class="btn btn-outline-light" onclick="conoceMas()">Conocé más</button>
					</div>
				</div>
			</div>

		</div>

		<a name="convertirteEnOrador"></a>
		<div class="container mt-3 p-0" style="max-width: 650px;">
			<div class="container text-center">
				<p style="font-size:0.7rem;">CONVIÉRTETE EN UN<br>
					<spam style="font-size:1.7rem;">ORADOR</spam>
				</p>
				<p>Anótate como orador para dar una <abbr title="Lo que significa">charla ignite</abbr>. Cuéntanos de
					qué quieres hablar.</p>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-6">
						<input class="form-control" type="text" placeholder="Nombre" aria-label="default input example">
					</div>
					<div class="col-6">
						<input class="form-control" type="text" placeholder="Apellido"
							aria-label="default input example">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12">
						<textarea class="form-control form-control-lg" placeholder="Sobre qué quieres hablar?"
							id="exampleFormControlTextarea1" rows="8"></textarea>
						<div id="passwordHelpBlock" class="form-text">
							Recuerda incluir un título para tu charla
						</div>
						<div class="d-grid gap-2 mt-4">
							<button class="btn btn-success btn-lg" type="button" onclick="Enviar()">Enviar</button>
						</div>
					</div>


				</div>
			</div>
		</div>

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