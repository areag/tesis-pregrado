/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var editando = false;


function transformarEnEditable(nodo) {

    if (editando == false) {

        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idGasto = nodosEnTr[0].textContent;
        var fecha = nodosEnTr[1].textContent;
        var comp= nodosEnTr[2].textContent;
        var kgs = nodosEnTr[3].textContent;
        var preciokgs= nodosEnTr[4].textContent;
        var obser = nodosEnTr[5].textContent;
        var costo = nodosEnTr[6].textContent;
        var modif = nodosEnTr[7].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="idga" id="idga" value="' + idGasto + '" readonly /></td>'
                + '<td><input type="text" name="fecha" id="fecha" value= "' + fecha + '" /></td>'
                + '<td><select name="select2" id="select2">'
                + '<option value="Maiz">Maiz</option>'
                + '<option value="Nucleo">Nucleo</option>'
                + '<option value="Concentrado">Concentrado</option>'
                + '<option value="Otros">Otros</option>'
                + '</select></td>'
                + '<td><input type="text" name="kg2" id="kg2" value="' + kgs + '"></td>'
                + '<td><input type="text" name="precioKg2" id="precioKg2" value="' + preciokgs + '" onkeyup="calculaValor1()"></td>'
                + '<td><input type="text" name="obser2" id="obser2" value="' + obser + '"></td>'
                + '<td><input type="text" name="costo2" id="costo2" value="' + costo + '"></td>'
                + '<td>En edición</td>';

        nodoTr.innerHTML = nuevoCodigoHtml;

        nodoContenedorForm.innerHTML = 
                '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br>'
                + '<input class="BotonTabla" type="submit" value="Aceptar">'
                +' <input class="BotonTabla" type="reset" value="Cancelar"></form>';

        editando = "true";
    }
    else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }

}

function capturarEnvio() {
    
    var nodoContenedorForm = document.getElementById('contenedorForm');
    var idGasto = document.getElementById('idga').value;
    var fecha = document.getElementById('fecha').value;
    var lista = document.getElementById('select2');
    var componente = lista.options[lista.selectedIndex].value;
    var kg = document.getElementById("kg2").value;
    var precioKg = document.getElementById("precioKg2").value;
    var ob = document.getElementById('obser2').value;
    var cos = document.getElementById('costo2').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere....</label><br>' +
            '<input type="hidden" id="idgahidden" name="idgahidden" value="' + idGasto + '">' +
            '<input type="hidden" id="fechahidden" name="fechahidden" value="' + fecha + '">' +
            '<input type="hidden" id="comphidden" name="comphidden" value="' + componente + '">' +
            '<input type="hidden" id="kghidden" name="kghidden" value="' + kg + '">' +
            '<input type="hidden" id="precioKghidden" name="precioKghidden" value="' + precioKg + '">' +
            '<input type="hidden" id="obhidden" name="obhidden" value="' + ob + '">' +
            '<input type="hidden" id="costohidden" name="costohidden" value="' + cos + '" maxlength="5" onKeyPress="return soloNumeros(event)">' +
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


  function calculaValor1() { 
                var kg = document.getElementById("kg2").value;
                var precio = document.getElementById("precioKg2").value;
                var costo1 = document.getElementById("costo2").value = parseFloat(kg) * parseFloat(precio);
                document.getElementById("costo2").value = costo1;  
            }