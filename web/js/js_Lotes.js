var editando = false;
function habilitarInput(valor) {
    if (valor == 7) {
        document.getElementById("cultivoname").disabled = false;

    } else {
        document.getElementById("cultivoname").disabled = true;

    }
}
function VerificarVacios() {

    var hayError = false;
    document.lotes.variableDesvio.value = "guardar";

    var nombre = document.getElementById("nombre").value;
    var hp = document.getElementById("hp").value;
    if (nombre.length == 0 || hp.length == 0) {
        hayError = true;
    }
    var cultivo = document.getElementById("cultivo").value;
    if (cultivo == 7) {
        cultivo = document.getElementById("cultivoname").value;
        if (cultivo.length == 0) {
            hayError = true;
        }
    }
    if (hayError) {
        alert('Complete los campos obligatorios');
    } else {
        document.lotes.submit();
        //newwindow = window.open("ResultadoLotes.jsp?&nombre=" + nombre +"&hp=" + hp +"&cultivo=" + cultivo +"&variableDesvio=" + desvio, "'central'");
    }
}
function transformarEnEditable(nodo) {
    if (editando == false) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idLote = nodosEnTr [0].textContent;
        var nombre = nodosEnTr[1].textContent;
        var hp = nodosEnTr[3].textContent;
        var rb = nodosEnTr[4].textContent;
        var exisIni = nodosEnTr[5].textContent;
        var porcen = nodosEnTr[6].textContent;//en tr[8] boton editar, en tr[9] boton eliminar
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nuevoCodigoHtml = '<td><input type="text" id="idlote" name="idlote" size="1" value="' + idLote + '" readonly> </td>' +
                '<td> <input type="text" id="nombre" name="nombre" value="' + nombre + '"</td>' +
                '<td> <select id="cultivo" name="cultivo" class="Texto">' +
                '<option value="1">» Seleccionar «</option>' +
                '<option value="Soja">Soja</option>' +
                '<option value="Maiz">Maíz</option>' +
                '<option value="Trigo">Trigo</option>' +
                '<option value="Cebada">Cebada</option>' +
                '<option value="Centeno">Centeno</option>' +
                '<option value="Sorgo">Sorgo</option>' +
                '<option value="Otro">Otro</option>' +
                '</select></td>' +
                '<td><input type="text" id="hp" name="hp" size="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + hp + '"/> </td>' +
                '<td><input type="text" id="rb" name="rb" maxlength="7" size="3" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + rb + '"/> </td>' +
                '<td><input type="text" id="exisIni" name="exisIni" maxlength="7" size="3" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + exisIni + '"/> </td>' +
                '<td><input type="text" name="porcen" id="porcen" class="ComboMedio" size="3" onKeyPress="return soloNumeros(event)" value="' + porcen + '"/> </td>' +
                '<td> <select id="propia" name="propia" class="Texto"> ' +
                '<option value="1">» Seleccionar «</option> <option value="t">Propio</option> <option value="f">Alquilado</option> </select></td>' +
                '<td colspan="2"> En edicion </td>';

        nodoTr.innerHTML = nuevoCodigoHtml;
        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';

        editando = "true";
    } else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }
}
function confirEnvio() {
    var nodoContenedorForm = document.getElementById('contenedorForm'); //Nodo DIV
    var lista = document.getElementById("cultivo");
    var cultivo = lista.options[lista.selectedIndex].value;
   
    var lista2 = document.getElementById("propia");

    var propia = lista2.options[lista2.selectedIndex].value;
   
    var idLote = document.getElementById('idlote').value;
 
    var nombre = document.getElementById('nombre').value;

    var hp = document.getElementById('hp').value;

    var rb = document.getElementById("rb").value;
   
    var exisIni = document.getElementById('exisIni').value;
  
    var porcen = document.getElementById('porcen').value;
    

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="idlotehidden" name="idlotehidden" value="' + idLote + '">' +
            '<input type="hidden" id="nombrehidden" name="nombrehidden" value="' + nombre + '">' +
            '<input type="hidden" id="cultivohidden" name="cultivohidden" value="' + cultivo + '">' +
            '<input type="hidden" id="hphidden" name="hphidden" value="' + hp + '">' +
            '<input type="hidden" id="rbhidden" name="rbhidden" value="' + rb + '">' +
            '<input type="hidden" id="exisInihidden" name="exisInihidden" value="' + exisIni + '">' +
            '<input type="hidden" id="porcenhidden" name="porcenhidden" value="' + porcen + '">' +
            '<input type="hidden" id="prohidden" name="prohidden" value="' + propia + '">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';

    document.forms.formEdicionLotes.submit();
}

function anular() {
    window.location.reload();
}
function eliminar(nodo) {
    if (confirm('¿Estas seguro de eliminar este lote?')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idLote = nodosEnTr [0].textContent;

        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idl" name="idl" value="' + idLote + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar"> ';

        document.forms.formEdicionLotes.submit();
    }
}