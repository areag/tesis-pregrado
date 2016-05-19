/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function VerificarVacios(){
    var hayError = false;
    var nrocompra = document.getElementById("nrocompra").value;
    var fecha = document.getElementById("fecha").value;
    var precioKg = document.getElementById("precioKg").value;
    var costo = document.getElementById("costo").value;
    
    if(nrocompra.length == 0 || fecha.length == 0 || precioKg.length == 0 || costo.length == 0){
        hayError = true;                   
    }
    
    if(hayError){
        alert("Complete los campos obligatorios.");
    }
    else{
        document.comprasgan.select.value="select";
        document.comprasgan.submit();
    }
       
}

var editando = false;

function transformarEnEditable(nodo) {

    if (editando == false) {

        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var numeroCompra = nodosEnTr[0].textContent;
        var fecha = nodosEnTr[1].textContent;
        var kgTernero = nodosEnTr[2].textContent;
        var precioKg = nodosEnTr[3].textContent;
        var cantidad = nodosEnTr[4].textContent;
        var costo = nodosEnTr[5].textContent;
        var modif = nodosEnTr[6].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="numeroCompra2" id="numeroCompra2" value="' + numeroCompra + '" readonly /></td>'
                + '<td><input type="text" name="fecha2" id="fecha2" value= "' + fecha + '" /></td>'
                + '<td><input type="text" name="kgTernero2" id="kgTernero2" value= "' + kgTernero + '" /></td>'
                + '<td><input type="text" name="precioKg2" id="precioKg2" value= "' + precioKg + '" /></td>'
                + '<td><input type="text" name="cant2" id="cant2" value="' + cantidad + '"></td>'
                + '<td><input type="text" name="costo2" id="costo2" value="' + costo + '"></td>'
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
    var numeroCompra2 = document.getElementById('numeroCompra2').value;
    var fecha2 = document.getElementById('fecha2').value;
    var kgTernero2 = document.getElementById('kgTernero2').value;
    var precioKg2 = document.getElementById('precioKg2').value;
    var cant2 = document.getElementById('cant2').value;
    var costo2 = document.getElementById('costo2').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="nroComprahidden" name="nroComprahidden" value="' + numeroCompra2 + '">' +
            '<input type="hidden" id="fechahidden" name="fechahidden" value="' + fecha2 + '">' +
            '<input type="hidden" id="kgTernerohidden" name="kgTernerohidden" value="' + kgTernero2 + '">' +
            '<input type="hidden" id="precioKghidden" name="precioKghidden" value="' + precioKg2 + '">' +
            '<input type="hidden" id="canthidden" name="canthidden" value="' + cant2 +'">'+
            '<input type="hidden" id="costohidden" name="costohidden" value="' + costo2 + '" onKeyPress="return soloNumeros(event)">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';
           
    document.forms.formEdicion2.submit();

}

function eliminar(nodo) {

    if (confirm('¿Estas seguro de eliminar esta compra?, Se eliminaran gastos asociados!!!')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var numeroCompra = nodosEnTr [0].textContent;
        alert('vas a eliminar la compra ' + numeroCompra);
        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idc" name="idc" value="' + numeroCompra + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';
        document.forms.formEdicion2.submit();
    }
}

function anular() {
    window.location.reload();    
}

