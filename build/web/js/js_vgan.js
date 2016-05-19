/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function VerificarVacios() {
    var hayError = false;
    var nroventa = document.getElementById("nroventa").value;
    var fecha = document.getElementById("fecha").value;
    var precioKg = document.getElementById("precioKg").value;
    var kgVendidos = document.getElementById("kgVendidos").value;
    var valor = document.getElementById("valor").value;

    if (nroventa.length == 0 || fecha.length == 0 || precioKg.length == 0 || kgVendidos.length == 0 || valor.length == 0) {
        hayError = true;
    }

    if (hayError) {
        alert("Complete los campos obligatorios.");
    }
    else {
        document.ventasgan.select.value = "select";
        document.ventasgan.submit();
    }

}

var editando = false;

function transformarEnEditable(nodo) {

    if (editando == false) {

        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var numeroVenta = nodosEnTr[0].textContent;
        var fecha = nodosEnTr[1].textContent;
        var dencierre = nodosEnTr[2].textContent;
        var kgTernero = nodosEnTr[3].textContent;
        var precioKg = nodosEnTr[4].textContent;
        var cantidad = nodosEnTr[5].textContent;
        var kgVendidos = nodosEnTr[6].textContent;
        var valor = nodosEnTr[7].textContent;
        var modif = nodosEnTr[8].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="numeroVenta2" id="numeroVenta2" value="' + numeroVenta + '" readonly /></td>'
                + '<td><input type="text" name="fecha2" id="fecha2" value= "' + fecha + '" /></td>'
                + '<td><input type="text" name="dencierre2" id="dencierre2" value= "' + dencierre + '" /></td>'
                + '<td><input type="text" name="kgTernero2" id="kgTernero2" value= "' + kgTernero + '" /></td>'
                + '<td><input type="text" name="precioKg2" id="precioKg2" value= "' + precioKg + '" /></td>'
                + '<td><input type="text" name="cant2" id="cant2" value="' + cantidad + '"></td>'
                + '<td><input type="text" name="kgVendidos2" id="kgVendidos2" value= "' + kgVendidos + '" /></td>'
                + '<td><input type="text" name="valor2" id="valor2" value="' + valor + '"></td>'
                + '<td>En edición</td>';


        nodoTr.innerHTML = nuevoCodigoHtml;

        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';

        editando = "true";
    }
    else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }

}

function capturarEnvio() {
    
    var nodoContenedorForm = document.getElementById('contenedorForm');
    var numeroVenta2 = document.getElementById('numeroVenta2').value;
    var fecha2 = document.getElementById('fecha2').value;
    var dencierre2 = document.getElementById('dencierre2').value;
    var kgTernero2 = document.getElementById('kgTernero2').value;
    var precioKg2 = document.getElementById('precioKg2').value;
    var cant2 = document.getElementById('cant2').value;
    var kgVendidos2 = document.getElementById('kgVendidos2').value;
    var valor2 = document.getElementById('valor2').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere....</label><br>' +
            '<input type="hidden" id="nroVentahidden" name="nroVentahidden" value="' + numeroVenta2 + '">' +
            '<input type="hidden" id="fechahidden" name="fechahidden" value="' + fecha2 + '">' +
            '<input type="hidden" id="dencierrehidden" name="dencierrehidden" value="' + dencierre2 + '">' +
            '<input type="hidden" id="kgTernerohidden" name="kgTernerohidden" value="' + kgTernero2 + '">' +
            '<input type="hidden" id="precioKghidden" name="precioKghidden" value="' + precioKg2 + '">' +
            '<input type="hidden" id="canthidden" name="canthidden" value="' + cant2 + '">' +
            '<input type="hidden" id="kgVendidoshidden" name="kgVendidoshidden" value="' + kgVendidos2 + '">' +
            '<input type="hidden" id="valorhidden" name="valorhidden" value="' + valor2 + '" onKeyPress="return soloNumeros(event)">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';

    document.forms.formEdicion2.submit();

}

function eliminar(nodo) {

    if (confirm('¿Estas seguro de eliminar esta venta?, Se eliminaran gastos asociados!!!')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var numeroVenta = nodosEnTr [0].textContent;
        alert('vas a eliminar la venta ' + numeroVenta);
        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idv" name="idv" value="' + numeroVenta + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';
        document.forms.formEdicion2.submit();
    }
}

function anular() {
    window.location.reload();
}
