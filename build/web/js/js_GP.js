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
    if (valor == 9) {
        document.getElementById("Laboreos").disabled = false;
        document.getElementById("Laboreos").classList.remove('TextoDes');
        document.getElementById("Laboreos").classList.add('Texto');
        document.getElementById('etiquetaLaboreos').classList.remove('TextoDes');
        document.getElementById('etiquetaLaboreos').classList.add('Texto');
    } else {
        document.getElementById("Laboreos").disabled = true;
        document.getElementById("Laboreos").classList.remove('Texto');
        document.getElementById("Laboreos").classList.add('TextoDes');
        document.getElementById('etiquetaLaboreos').classList.remove('Texto');
        document.getElementById('etiquetaLaboreos').classList.add('TextoDes');
    }
    if (valor == 8) {
        document.getElementById("Insumos").disabled = false;
        document.getElementById("Insumos").classList.remove('TextoDes');
        document.getElementById("Insumos").classList.add('Texto');
        document.getElementById('etiquetaInsumos').classList.remove('TextoDes');
        document.getElementById('etiquetaInsumos').classList.add('Texto');
    } else {
        document.getElementById("Insumos").disabled = true;
        document.getElementById("Insumos").classList.remove('Texto');
        document.getElementById("Insumos").classList.add('TextoDes');
        document.getElementById('etiquetaInsumos').classList.remove('Texto');
        document.getElementById('etiquetaInsumos').classList.add('TextoDes');

    }
}

function verificarVacios() {

    var hayError = false;
    var gasto = document.getElementById("selecgp").value;
    var desc = " ";
    if (gasto == 1) {
        hayError = true;
    }
    if (gasto == 10) {
        desc = document.getElementById("desc").value;
        if (desc.length == 0) {
            hayError = true;
        }
    }
    if (gasto == 8) {
        desc = document.getElementById("Insumos").value;
        if (desc == 1) {
            hayError = true;
        }
    }
    if (gasto == 9) {
        desc = document.getElementById("Laboreos").value;
        if (desc == 1) {
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

        document.miformgp.variableDesvio.value = "guardar";
        document.miformgp.submit();
    }

}


function eliminar(nodo) {

    if (confirm('¿Estas seguro de eliminar?')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idGasto = nodosEnTr [0].textContent;
        var nodoContenedorForm2 = document.getElementById('contenedorForm');
        nodoContenedorForm2.innerHTML = '<input type="hidden" id="idgp" name="idgp" value="' + idGasto + '"></form>' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';

        document.forms.formEdicion2.submit();
    }

}

var editando = false;
function transformarEnEditable(nodo) {
    if (editando == false) {


        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idGasto = nodosEnTr [0].textContent;
        var obser = nodosEnTr[3].textContent;
        var costo = nodosEnTr[4].textContent;
        var fecha = nodosEnTr[5].textContent;//en tr[6] boton editar, en tr[7] boton eliminar
        var nodoContenedorForm = document.getElementById('contenedorForm');
        var nuevoCodigoHtml = '<td><input type="text" id="idgasto" name="idgasto" size="2" value="' + idGasto + '" readonly> </td>' +
                '<td> <select id="selec" name="selec" class="Texto">' +
                '<option value="1">» Seleccionar «</option>' +
                '<option value="Arrendamiento">Arrendamiento</option>' +
                '<option value="Gasoil">Gasoil</option>' +
                '<option value="UTA">UTA</option>' +
                '<option value="Seguros">Seguros</option>' +
                '<option value="Impuestos">Impuestos</option>' +
                '<option value="Insumo">Insumos</option>' +
                '<option value="Laboreo">Laboreos</option>' +
                '<option value="Otro">Otro</option>' +
                '</select</td>' +
                '<td> <select id="selecDesc" name="selecDesc" class="Texto">' +
                '<option value="1">» Seleccionar «</option>' +
                '<option value="Semilla">Semilla</option>' +
                '<option value="Fertilizante">Fertilizante</option>' +
                '<option value="Curasemilla">Curasemilla</option>' +
                '<option value="Insecticida">Insecticida</option>' +
                '<option value="Herbicida">Herbicida</option>' +
                '<option value="Fungicida">Fungicida</option>' +
                '<option value="Inoculante">Inoculante</option>' +
                '<option value="Siembra Directa">Siembra Directa</option>' +
                '<option value="Siembra Convencional">Siembra Conven.</option>' +
                '<option value="Desmalezada">Desmalezada</option>' +
                '<option value="Pulverizacion">Pulverizacion</option>' +
                '<option value="Fumigacion aerea">Fumigacion aerea</option>' +
                '<option value="Fumigacion terrestre">Fumigacion terrestre</option>' +
                '<option value="Arada">Arada</option>' +
                '<option value="Cosecha">Cosecha</option>' +
                '<option value="Otro">Otro</option>' +
                '</select></td>' +
                '<td><input id="obser" name="obser" maxlength="45" size="8" class="ComboMedio" value="' + obser + '"/> </td>' +
                '<td><input id="costo" name="costo" maxlength="7" size="7" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + costo + '"/> </td>' +
                '<td> <input type="text" name="fecha" id="fecha" readonly="readonly" value="' + fecha + '"/> </td>' +
                '<td colspan="2"> En edicion </td>';

        nodoTr.innerHTML = nuevoCodigoHtml;
        nodoContenedorForm.innerHTML ='<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';
    } else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }
}
function confirEnvio() {
    var nodoContenedorForm = document.getElementById('contenedorForm'); //Nodo DIV
    var lista = document.getElementById("selec");
    var tipoGasto = lista.options[lista.selectedIndex].value;
    var lista2 = document.getElementById("selecDesc");
    var desc = lista2.options[lista.selectedIndex].value;

    if (tipoGasto == '1' || desc == '1') {
        alert('Seleccione una opción de las listas desplegables');
    } else {

        var ob = document.getElementById('obser').value;
        var cos = document.getElementById('costo').value;
        var idGasto = document.getElementById('idgasto').value;
        var fe = document.getElementById("fecha").value;

        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
                '<input type="hidden" id="idgp" name="idgp" value="' + idGasto + '">' +
                '<input type="hidden" id="gasto" name="gasto" value="' + tipoGasto + '">' +
                '<input type="hidden" id="desc" name="desc" value="' + desc + '">' +
                '<input type="hidden" id="ob" name="ob" value="' + ob + '">' +
                '<input type="hidden" id="costo" name="costo" value="' + cos + '">' +
                '<input type="hidden" id="fecha" name="fecha" value="' + fe + '">'+
                '<input type="hidden" id="desvio" name="desvio" value="editar">';

        document.forms.formEdicion2.submit();
    }
}
function anular() {
    window.location.reload();
}


