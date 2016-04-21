/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function VerificarVacios() {

    var hayError = false;
    var fecha = document.getElementById("fecha").value;
    var porcentaje = document.getElementById("porcentaje").value;
    var precio_ternero = document.getElementById("precio_ternero").value;
    var precio_novillo = document.getElementById("precio_novillo").value;
    var incremento = document.getElementById("incremento").value;
    var disminucion = document.getElementById("disminucion").value;
    var peso_ternero = document.getElementById("peso_ternero").value;
    var peso_novillo = document.getElementById("peso_novillo").value;
    var muerte_ternero = document.getElementById("muerte_ternero").value;
    var muerte_novillo = document.getElementById("muerte_novillo").value;

    if (fecha.length == 0 || porcentaje.length == 0 || precio_ternero.length == 0 ||
            precio_novillo.length == 0 || incremento.length == 0 || disminucion.length == 0 ||
            peso_ternero.length == 0 || peso_novillo.length == 0 || muerte_ternero.length == 0 || muerte_novillo == 0) {
        
        hayError = true;
    }

    if (hayError) {
        alert("Complete los campos obligatorios.");
    } else {
        document.existenciasgan.select.value = "select";
        document.existenciasgan.submit();
    }
}