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


var editando = false;


function transformarEnEditable(nodo) {

    if (editando == false) {

        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idexistenciasgan = nodosEnTr[0].textContent;
        var fecha = nodosEnTr[1].textContent;
        var porcentaje = nodosEnTr[2].textContent;
        var precio_ternero = nodosEnTr[3].textContent;
        var precio_novillo = nodosEnTr[4].textContent;
        var incremento = nodosEnTr[5].textContent;
        var disminucion = nodosEnTr[6].textContent;
        var peso_ternero = nodosEnTr[7].textContent;
        var peso_novillo = nodosEnTr[8].textContent;
        var muerte_ternero = nodosEnTr[9].textContent;
        var muerte_novillo = nodosEnTr[10].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="idexistenciasgan" id="idexistenciasgan" value="' + idexistenciasgan + '" readonly /></td>'
                + '<td><input type="text" name="fecha" id="fecha" value= "' + fecha + '" /></td>'
                + '<td><input type="text" name="porcentaje" id="porcentaje" value= "' + porcentaje + '" /></td>'
                + '<td><input type="text" name="precio_ternero" id="precio_ternero" value= "' + precio_ternero + '" /></td>'
                + '<td><input type="text" name="precio_novillo" id="precio_novillo" value= "' + precio_novillo + '" /></td>'
                + '<td><input type="text" name="incremento" id="incremento" value= "' + incremento + '" /></td>'
                + '<td><input type="text" name="disminucion" id="disminucion" value= "' + disminucion + '" /></td>'
                + '<td><input type="text" name="peso_ternero" id="peso_ternero" value= "' + peso_ternero + '" /></td>'
                + '<td><input type="text" name="peso_novillo" id="peso_novillo" value= "' + peso_novillo + '" /></td>'
                + '<td><input type="text" name="muerte_ternero" id="muerte_ternero" value="' + muerte_ternero + '"></td>'
                + '<td><input type="text" name="muerte_novillo" id="muerte_novillo" value="' + muerte_novillo + '"></td>'
                + '<td>En edición</td>';


        nodoTr.innerHTML = nuevoCodigoHtml;

        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';

        editando = "true";
    } else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }

}

// de aca para abajo

function capturarEnvio() {
    var nodoContenedorForm = document.getElementById('contenedorForm');
        var idexistenciasgan = document.getElementById('idexistenciasgan').value;
        var fecha = document.getElementById('fecha').value;
        var porcentaje = document.getElementById('porcentaje').value;
        var precio_ternero = document.getElementById('precio_ternero').value;
        var precio_novillo = document.getElementById('precio_novillo').value;
        var incremento = document.getElementById('incremento').value;
        var disminucion = document.getElementById('disminucion').value;
        var peso_ternero = document.getElementById('peso_ternero').value;
        var peso_novillo = document.getElementById('peso_novillo').value;
        var muerte_ternero = document.getElementById('muerte_ternero').value;
        var muerte_novillo = document.getElementById('muerte_novillo').value;
        
        
 
    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="idexistenciasgan" name="idexistenciasgan" value="' + idexistenciasgan + '">' +
            '<input type="hidden" id="fecha" name="fecha" value="' + fecha + '">' +
            '<input type="hidden" id="porcentaje" name="porcentaje" value="' + porcentaje + '">' +
            '<input type="hidden" id="precio_ternero" name="precio_ternero" value="' + precio_ternero + '">' +
            '<input type="hidden" id="precio_novillo" name="precio_novillo" value="' + precio_novillo + '">' +
            '<input type="hidden" id="incremento" name="incremento" value="' + incremento + '">' +
            '<input type="hidden" id="disminucion" name="disminucion" value="' + disminucion + '">' +
            '<input type="hidden" id="peso_ternero" name="peso_ternero" value="' + peso_ternero + '">' +
            '<input type="hidden" id="peso_novillo" name="peso_novillo" value="' + peso_novillo + '">' +
            '<input type="hidden" id="muerte_ternero" name="muerte_ternero" value="' + muerte_ternero + '">' +
            '<input type="hidden" id="muerte_novillo" name="muerte_novillo" value="' + muerte_novillo + '">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';
    
   
 
    document.forms.formEdicion2.submit();

}

function eliminar(nodo) {

    if (confirm('¿Estas seguro de eliminar este gasto?')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idgasto = nodosEnTr [0].textContent;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idg" name="idg" value="' + idgasto + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';
        document.forms.formEdicion2.submit();
    }
}

function anular() {
    location.reload();

}
