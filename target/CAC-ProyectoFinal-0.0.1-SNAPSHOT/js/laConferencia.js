var botonCalcular = document.getElementById("botonCalcular");
botonCalcular.addEventListener('click', verificarDatos);

// Defino porcentajes de descuento según categoría
let descuentoEstudiante = 80;
let descuentoTrainee = 50;
let descuentoJunior = 15;

var nombre = document.getElementById("nombre");
var apellido = document.getElementById("apellido");
var correo = document.getElementById("correo");
var cantidad = document.getElementById("cantidad");
var valorTicket = document.getElementById("valorDelTicket");

function verificarDatos() {
	removerCamposInvalidos();
	if (nombre.value === "") {
		nombre.classList.add("is-invalid");
		alert("Escribi tu nombre....");
		nombre.focus();
		return;
	}
	if (apellido.value === "") {
		apellido.classList.add("is-invalid");
		alert("Escribi tu apellido....");
		apellido.focus();
		return;
	}
	if (correo.value === "") {
		correo.classList.add("is-invalid");
		alert("Escribi un correo....");
		correo.focus();
		return;
	}

	// Para determinar si el correo electrónico es válido o no

	const correoValido = correo => {
		return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo);
	}

	if (!correoValido(correo.value)) {
		alert("Por favor, escribí un correo electrónico válido.");
		correo.classList.add("is-invalid");
		correo.focus();
		return;
	}

	let cantTickets = parseInt(cantidad.value);
	if (Number.isNaN(cantTickets) || cantTickets < 0) {
		cantidad.classList.add("is-invalid");
		alert("Ingresa cantidad correcta de tickets....");
		cantidad.focus();
		return;
	}

	todosLosCamposCorrectos();
	calcular();
}

function removerCamposInvalidos() {
	let campos = document.querySelectorAll(".form-control, .form-select");
	let i;
	for (i = 0; i < campos.length; i++) {
		campos[i].classList.remove('is-invalid');
		campos[i].classList.remove('todoBien');
	}
}

function todosLosCamposCorrectos() {
	let campos = document.querySelectorAll(".form-control, .form-select");
	let i;
	for (i = 0; i < campos.length; i++) {
		campos[i].classList.add("todoBien");
	}

}
function calcular() {
	let cantTickets = parseInt(cantidad.value);
	var categorias = document.getElementById("categoria");
	var categoriaActiva = parseInt(categorias.options[categorias.selectedIndex].value);
	var totalSinDescuento = cantTickets * parseInt(valorTicket.value);
	var totalAPagar;
	switch (categoriaActiva) {
		case 1:
			totalAPagar = totalSinDescuento;
			break;
		case 2:
			totalAPagar = totalSinDescuento - (totalSinDescuento * (descuentoEstudiante / 100));
			break;
		case 3:
			totalAPagar = totalSinDescuento - (totalSinDescuento * (descuentoTrainee / 100));
			break;
		case 4:
			totalAPagar = totalSinDescuento - (totalSinDescuento * (descuentoJunior / 100));
			break;
	}
	document.getElementById("debePagar").value = "Total a pagar: $" + totalAPagar;

}

function redireccionarLosOradores() {
	window.location.href = "#convertirteEnOrador";
}
function redireccionarComprarTickets() {
	href = "FrontController?accion=registrar";
}
function conoceMas() {
	alert("Muchísima mas informacion...");
}
function Enviar() {
	alert("Enviando...");
}