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
        var gasto = nodosEnTr[2].textContent;
        var obser = nodosEnTr[3].textContent;
        var costo = nodosEnTr[4].textContent;
        var modif = nodosEnTr[5].textContent;



        var nuevoCodigoHtml = '<td><input type="text" name="idg" id="idg" value="' + idGasto + '" readonly /></td>'
                + '<td><input type="text" name="fecha" id="fecha" value= "' + fecha + '" /></td>'
                + '<td><select name="select2" id="select2">'
                + '<option value="Error al cargar el gasto">» Seleccionar «</option>' 
                + '<option value="Suministros">Suministros</option>'
                + '<option value="Sanidad">Sanidad</option>'
                + '<option value="Honorarios Laborales">Honorarios Laborales</option>'
                + '<option value="Otros Gastos">Otros Gastos</option>'
                + '</select></td>'
                + '<td><input type="text" name="obser2" id="obser2" value="' + obser + '"></td>'
                + '<td><input type="text" name="costo2" id="costo2" value="' + costo + '"></td>'
                + '<td>En edición</td>';


        nodoTr.innerHTML = nuevoCodigoHtml;

        nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';

        editando = "true";
    } else {
        alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
    }

}

function capturarEnvio() {
    var nodoContenedorForm = document.getElementById('contenedorForm');
    var idGasto = document.getElementById('idg').value;
    var fecha = document.getElementById('fecha').value;
    var lista = document.getElementById('select2');
    var tipoGasto = lista.options[lista.selectedIndex].value;
    var ob = document.getElementById('obser2').value;
    var cos = document.getElementById('costo2').value;

    nodoContenedorForm.innerHTML = '<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="idgchidden" name="idgchidden" value="' + idGasto + '">' +
            '<input type="hidden" id="fechahidden" name="fechahidden" value="' + fecha + '">' +
            '<input type="hidden" id="gastohidden" name="gastohidden" value="' + tipoGasto + '">' +
            '<input type="hidden" id="obhidden" name="obhidden" value="' + ob + '">' +
            '<input type="hidden" id="costohidden" name="costohidden" value="' + cos + '" onKeyPress="return soloNumeros(event)">' +
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



function habilitarInput() {

    var lista = document.getElementById("gasto").selectedIndex;
    div1 = document.getElementById("gastoprod");
    div2 = document.getElementById("gastoalimentacion");

    if (lista >= 1 && lista <= 4)
    {
        window.parent.document.getElementById('central').height = '550px';
        div1.style.display = 'block';
        div2.style.display = 'none';

    } else if (lista == 5) {
        window.parent.document.getElementById('central').height = '700px';
        div1.style.display = 'none';
        div2.style.display = 'block';

    } else {
        div1.style.display = 'none';
        div2.style.display = 'none';
    }

}

function VerificarVacios() {
    var hayError = false;
    var fecha = document.getElementById("fecha").value;
    var lista = document.getElementById("gasto").selectedIndex;

    if (lista == 0) {
        alert("Selecciona un tipo de Gasto!");
    } else {


        if (lista >= 1 && lista <= 4) {
            var costo = document.getElementById("costo").value;

            if (fecha.length == 0 || costo.length == 0) {
                hayError = true;
                alert('Complete los campos obligatorios');

            } else if (hayError == false) {
                var gasto = document.getElementById("gasto").value;
                var ob = document.getElementById("ob").value;
                var select = document.gastosgan.select.value = "select";

                newwindow = window.open("ResultadoGastosGanaderia.jsp?&gasto=" + gasto
                        + "&ob=" + ob
                        + "&costo=" + costo
                        + "&fecha=" + fecha
                        + "&select=" + select, 'central');
            }

        } else if (lista == 5) {
            var kilo = document.getElementById("kg").value;
            var preciokilo = document.getElementById("valorKg").value;

            if (fecha.length == 0 || kilo.length == 0 || preciokilo.length == 0) {
                hayError = true;
                alert('Complete los campos obligatorios');
            } else if (hayError == false) {
                var gastoalim = document.getElementById("gastoalim").value;
                var ob1 = document.getElementById("ob1").value;
                var costo1 = document.getElementById("costo1").value;
                var select = document.gastosgan.select.value = "select";


                newwindow = window.open("ResulGastosAlimGanaderia.jsp?&kilo=" + kilo
                        + "&fecha=" + fecha
                        + "&preciokilo=" + preciokilo
                        + "&gastoalim=" + gastoalim
                        + "&ob1=" + ob1
                        + "&costo1=" + costo1
                        + "&select=" + select, 'central');

            }
        }
    }
}




