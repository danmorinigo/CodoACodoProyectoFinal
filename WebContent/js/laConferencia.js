// Defino valor de ticket
const valorTicket = 200;

// Defino porcentajes de descuento según categoría
let descuentoEstudiante = 80;
let descuentoTrainee    = 50;
let descuentoJunior     = 15;


var botonCalcular = document.getElementById("botonCalcular");
botonCalcular.addEventListener('click', verificarDatos);

function verificarDatos()
{
    removerCamposInvalidos();
    var nombre = document.getElementById("nombre");
    var apellido = document.getElementById("apellido");
    var correo = document.getElementById("correo");
    var cantidad = document.getElementById("cantidad");
    
    if(nombre.value === "")
    {
    	nombre.classList.add("is-invalid");
    	alert("Escribi tu nombre....");
    	nombre.focus();
    	return;
    }
    if(apellido.value === "")
    {
    	apellido.classList.add("is-invalid");
    	alert("Escribi tu apellido....");
    	apellido.focus();
    	return;
    }
    if(correo.value === "")
    {
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
    
    if(Number.isNaN(parseInt(cantidad.value)))
    {
		cantidad.classList.add("is-invalid");
		alert("Ingresa cantidad de tickets....");
    	cantidad.focus();
    	return;
	}
	
	todosLosCamposCorrectos();
    calcular();
    
    /*
    if((((nombre != "") && (apellido != "")) && (correo != "")) && !Number.isNaN(cantidad))
    {
        todosLosCamposCorrectos();
        calcular();
    }
    else
    {
        if(nombre == "")document.getElementById("nombre").classList.add("is-invalid");
        if(apellido == "")document.getElementById("apellido").classList.add("is-invalid");
        if(correo == "")document.getElementById("correo").classList.add("is-invalid");
        if(Number.isNaN(cantidad)) document.getElementById("cantidad").classList.add("is-invalid");
        alert("FALTAN DATOS!");
    }
	*/
}

function removerCamposInvalidos()
{
	let campos = document.querySelectorAll(".form-control, .form-select");
    let i;
    for (i = 0; i < campos.length; i++) {
        campos[i].classList.remove('is-invalid');
    }
}

function todosLosCamposCorrectos()
{
    document.getElementById("nombre").classList.add("todoBien");
    document.getElementById("apellido").classList.add("todoBien");
    document.getElementById("correo").classList.add("todoBien");
    document.getElementById("cantidad").classList.add("todoBien");
    document.getElementById("categoria").classList.add("todoBien");
}
function calcular()
{
    var cantidad = parseInt(document.getElementById("cantidad").value);
    var categorias = document.getElementById("categoria");
    var categoriaActiva = parseInt(categorias.options[categorias.selectedIndex].value);
    const valorTicket = 200;
    const descuentoEstudiante = 0.8;
    const descuentoTrainee = 0.5;
    const descuentoJunior = 0.15;
    var totalSinDescuento = cantidad * valorTicket;
    var totalAPagar;
    switch(categoriaActiva)
    {
        case 1:
            totalAPagar = totalSinDescuento - (totalSinDescuento * descuentoEstudiante);
            break;
        case 2:
            totalAPagar = totalSinDescuento - (totalSinDescuento * descuentoTrainee);    
            break;
        case 3:
            totalAPagar = totalSinDescuento - (totalSinDescuento * descuentoJunior);        
            break;
    }
    document.getElementById("debePagar").value="Total a pagar: $" + totalAPagar;

}
function redireccionarLosOradores()
{
    window.location.href = "#convertirteEnOrador";
}
function redireccionarComprarTickets()
{
    href = "FrontController?accion=registrar";
}
function conoceMas()
{
    alert("Muchísima mas informacion...");
}
function Enviar(){
    alert("Enviando...");
}