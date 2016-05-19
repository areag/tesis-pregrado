var editando = false;
function verificarVacios() {
    var hayError = false;
    var gasto = document.getElementById("selecgc").value;
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

        document.miform.submit();
    }
}
function transformarEnEditable(nodo) {
    //el nodo recibido es SPAN
    if (editando == false) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodoContenedorForm = document.getElementById('contenedorForm'); //Nodo DIV
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idGasto = nodosEnTr [0].textContent;
        var gasto = nodosEnTr[1].textContent;
        var obser = nodosEnTr[2].textContent;
        var costo = nodosEnTr[3].textContent;
        var modif = nodosEnTr[4].textContent;
        var nuevoCodigoHtml = '<td><input type="text name="idg" id="idg" value="' + idGasto + '" readonly></td> <td><select id="selec" name="selec" class="Texto">' +
                '<option value="Flete">Flete</option>' +
                '<option value="Limpieza y clasificacion">Limpieza y clasificación</option>' +
                '<option value="Cargadora">Cargadora</option>' +
                '<option value="Regalias">Regalías</option>' +
                '<option value="Secada">Secada</option>' +
                '<option value="Paritarias">Paritarias</option>' +
                '<option value="Analisis">Análisis</option>' +
                '<option value="Sellado">Sellado</option>' +
                '<option value="Impuestos">Impuestos</option>' +
                '<option value="10">Otro</option>' +
                '</select></td>' +
                '<td><input type="text" name="obser2" id="obser2" value="' + obser + '" size="20"</td>' +
                '<td><input type="text" name="costo2" id="costo2" value="' + costo + '" size="5"</td>' +
                '<td colspan="2">En edición</td>';
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
    var nodoContenedorForm = document.getElementById('contenedorForm'); //Nodo DIV
    var lista = document.getElementById("selec");
    var tipoGasto = lista.options[lista.selectedIndex].value;
    var ob = document.getElementById('obser2').value;
    var cos = document.getElementById('costo2').value;
    var idGasto = document.getElementById('idg').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="idgc" name="idgc" value="' + idGasto + '">' +
            '<input type="hidden" id="gasto" name="gasto" value="' + tipoGasto + '">' +
            '<input type="hidden" id="ob" name="ob" value="' + ob + '">' +
            '<input type="hidden" id="costo" name="costo" value="' + cos + '">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';

    document.forms.formEdicion2.submit();
}
function anular() {
    window.location.reload();
}
function eliminar(nodo){
    if (confirm('¿Está seguro de eliminar este Gasto?')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idgc = nodosEnTr [0].textContent;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idgc" name="idgc" value="' + idgc + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';
        document.forms.formEdicion2.submit();
    }
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

