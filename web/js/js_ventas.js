
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
   
    var fecha = document.getElementById("fecha").value;
    var kg = document.getElementById("kg").value;
    var vv = document.getElementById("valorVenta").value;
    if (kg.length == 0 || vv.length == 0) {
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
        document.ventas.variableDesvio.value = "guardar";
        document.ventas.submit();
    }
}
function transformarEnEditable(nodo){
if (editando == false) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idventa = nodosEnTr [0].textContent;
        var fecha = nodosEnTr[2].textContent;
        var kg = nodosEnTr[3].textContent;
        var pm = nodosEnTr[4].textContent;
        var porcen = nodosEnTr[5].textContent;
        var comprador = nodosEnTr[6].textContent;
        var valor = nodosEnTr[7].textContent;//en tr[8] boton editar, en tr[9] boton eliminar
        var nodoContenedorForm = document.getElementById('contenedorForm');
        
        var nuevoCodigoHtml = '<td><input type="text" id="idventa" name="idventa" value="' + idventa + '" readonly> </td>' +               
                '<td> <select id="producto" name="producto" class="Texto">' +
                '<option value="1">» Seleccionar «</option>' +
                '<option value="Soja">Soja</option>' +
                '<option value="Maiz">Maíz</option>' +
                '<option value="Trigo">Trigo</option>' +
                '<option value="Cebada">Cebada</option>' +
                '<option value="Centeno">Centeno</option>' +
                '<option value="Sorgo">Sorgo</option>' +
                '<option value="Otro">Otro</option>' +
                '</select></td>' +
                '<td><input type="text" id="fecha" name="fecha" class="ComboMedio" readonly="readonly" value="' + fecha + '"/> </td>' +
                '<td><input type="text" id="kg" name="kg" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + kg + '"/> </td>' +
                '<td><input type="text" id="pm" name="pm" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + pm + '"/> </td>' +
                '<td><input type="text" name="porcen" id="porcen" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + porcen + '"/> </td>' +
                '<td><input type="text" name="comp" id="comp" class="ComboMedio" value="'+comprador+'"/> </td>' +
                '<td><input type="text" name="valor" id="valor" class="ComboMedio" onKeyPress="return soloNumeros(event)" value="' + valor + '"/> </td>' +
                '<td colspan="2"> En edicion </td>';
        nodoTr.innerHTML = nuevoCodigoHtml;
        nodoContenedorForm.innerHTML ='<label class="etiquetaLargaTabla">Pulse Aceptar para guardar los cambios o cancelar para anularlos </label> <br/>'
                + '<input class="BotonTabla" type="submit" value="Aceptar"> <input class="BotonTabla" type="reset" value="Cancelar"></form><br/>';
 editando = true;
} else{
     alert('Solo se puede editar una línea. Recargue la página para poder editar otra');
}
}
function confirEnvio() {
   
    var nodoContenedorForm = document.getElementById('contenedorForm'); //Nodo DIV
    var lista = document.getElementById("producto");
    var producto = lista.options[lista.selectedIndex].value;

    var idventa = document.getElementById('idventa').value;
    var fecha = document.getElementById('fecha').value;
    var kg = document.getElementById('kg').value;
    var pm = document.getElementById("pm").value;
    var porcen = document.getElementById('porcen').value;
    var comprador = document.getElementById('comp').value;
    var valor = document.getElementById('valor').value;

    nodoContenedorForm.innerHTML ='<label class="etiquetaLargaTabla">Por favor espere.....</label><br>' +
            '<input type="hidden" id="idventa" name="idventa" value="' + idventa + '">' +
            '<input type="hidden" id="producto" name="producto" value="' + producto + '">' +
            '<input type="hidden" id="fecha" name="fecha" value="' + fecha + '">' +
            '<input type="hidden" id="kg" name="kg" value="' + kg + '">' +
            '<input type="hidden" id="pm" name="pm" value="' + pm + '">' +
            '<input type="hidden" id="porcen" name="porcen" value="' + porcen + '">' +
            '<input type="hidden" id="comprador" name="comprador" value="' + comprador + '">' +
            '<input type="hidden" id="valor" name="valor" value="' + valor + '">' +
            '<input type="hidden" id="desvio" name="desvio" value="editar">';
    
    document.forms.formEdicionVentas.submit();
}

function eliminar(nodo) {
    
    if (confirm('¿Estas seguro de eliminar esta venta?')) {
        var nodoTd = nodo.parentNode;
        var nodoTr = nodoTd.parentNode;
        var nodosEnTr = nodoTr.getElementsByTagName('td');
        var idventa = nodosEnTr [0].textContent;
        var nodoContenedorForm = document.getElementById('contenedorForm');
        nodoContenedorForm.innerHTML = '<input type="hidden" id="idv" name="idv" value="' + idventa + '">' +
                '<input type="hidden" id="desvio" name="desvio" value="eliminar">';
        document.forms.formEdicionVentas.submit();
    }
    }
function anular() {
    window.location.reload();
}