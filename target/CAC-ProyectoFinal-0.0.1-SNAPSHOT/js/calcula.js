var botonResumen = document.getElementById("botonCalcular");
botonResumen.addEventListener('click', verificarDatos);

function verificarDatos()
{
    var nombre = document.getElementById("nombre").value;
    var apellido = document.getElementById("apellido").value;
    var correo = document.getElementById("correo").value;
    var cantidad = parseInt(document.getElementById("cantidad").value);
    if((((nombre != "") && (apellido != "")) && (correo != "")) && !Number.isNaN(cantidad))
    {
        todosLosCamposCorrectos();
        calcular();
    }
    else
    {
        if(nombre == "")document.getElementById("nombre").classList.add("faltanDatos");
        if(apellido == "")document.getElementById("apellido").classList.add("faltanDatos");
        if(correo == "")document.getElementById("correo").classList.add("faltanDatos");
        if(Number.isNaN(cantidad)) document.getElementById("cantidad").classList.add("faltanDatos");
        
        //var x = document.getElementById("nombre");
        //x.classList.add("faltanDatos");
        alert("FALTAN DATOS!");
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
    window.location.href = "compraTickets.html";
}
function conoceMas()
{
    alert("Muchísima mas informacion...");
}
function Enviar(){
    alert("Enviando...");
}