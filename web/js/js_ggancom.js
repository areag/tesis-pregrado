/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    document.getElementById("gcgan").reset();
}


function habilitarInput(valor) {
    if (valor == 10) {
        document.getElementById("desc").disabled = false;
        document.getElementById('etiquetaOtros').classList.remove('TextoDes');
        document.getElementById('etiquetaOtros').classList.add('Texto');
    } else {
        document.getElementById("desc").disabled = true;
        document.getElementById('etiquetaOtros').classList.remove('Texto');
        document.getElementById('etiquetaOtros').classList.add('TextoDes');

    }
}

function verificarVacios() {
    var hayError = false;
    var gasto = document.getElementById("selecgcgan").value;
    if (gasto == 10) {
        gasto = document.getElementById("desc").value;
        if (gasto.length == 0) {
            hayError = true;
        }
    }
    var costo = document.getElementById("costo").value;
    if (costo.length == 0) {
        hayError = true;
    }
    if (hayError) {
        alert('Complete los campos obligatorios');
    } else {

        document.gcgan.submit();
    }
}

var editando = false;

function transformarEnEditable(nodo) {

    if (editando == false) {

        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var numeroGasto = nodosEnTr[0].textContent;
        var gasto = nodosEnTr[1].textContent;
        var observacion = nodosEnTr[2].textContent;
        var costo = nodosEnTr[3].textContent;
        var modif = nodosEnTr[4].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="numeroGasto2" id="numeroGasto2" value="' + numeroGasto + '" readonly /></td>'
          + '<td><select name="select2" id="select2">'
                + '<option value="Flete">Flete</option>'
                + '<option value="Comision">Comision</option>'
                + '<option value="Guia">Guia</option>'
                + '<option value="Otro">Otro</option>'
                + '</select></td>'              
                + '<td><input type="text" name="observacion2" id="observacion2" value= "' + observacion + '" /></td>'
                + '<td><input type="text" name="costo2" id="costo2" value="' + costo + '"></td>'
                + '<td>En edición</td>';


        nodoTr.innerHTML = nuevoCodigoHtml;

        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label>  <br />'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';

        editando = "true";
    }
    else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }

}

function capturarEnvio() {
    var nodoContenedorForm = document.getElementById('contenedorForm');
    var numeroGasto2 = document.getElementById('numeroGasto2').value;
    var gasto2 = document.getElementById('select2').value;
    var observacion2 = document.getElementById('observacion2').value;
    var costo2 = document.getElementById('costo2').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="nroGastohidden" name="nroGastohidden" value="' + numeroGasto2 + '">' +
            '<input type="hidden" id="gastohidden" name="gastohidden" value="' + gasto2 + '">' +
            '<input type="hidden" id="obhidden" name="obhidden" value="' + observacion2 + '">' +
            '<input type="hidden" id="costohidden" name="costohidden" value="' + costo2 + '" onKeyPress="return soloNumeros(event)">' +
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
    window.location.reload();    
}
