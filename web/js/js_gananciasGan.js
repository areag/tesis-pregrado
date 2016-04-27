/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var editando = false;

function verificarVacios() {

    var fecha_desde = document.getElementById("fecha_desde").value;
    var dia_desde = fecha_desde.substr(0, 2);
    var mes_desde = fecha_desde.substr(3, 2);
    var año_desde = fecha_desde.substr(6, 4);

    var fecha_hasta = document.getElementById("fecha_hasta").value;
    var dia_hasta = fecha_hasta.substr(0, 2);
    var mes_hasta = fecha_hasta.substr(3, 2);
    var año_hasta = fecha_hasta.substr(6, 4);



    if (fecha_desde.length != 0 || fecha_hasta.length != 0) {
        if (año_desde > año_hasta) {
            alert("La fecha de inicio no puede ser mayor que la final 1");
        } else if (año_desde < año_hasta) {

            newwindow = window.open("ResulGananciasGan.jsp?&fecha_desde=" + fecha_desde + "&fecha_hasta=" + fecha_hasta, "central");
        } else if (año_desde == año_hasta) {
            if (mes_desde > mes_hasta) {
                alert("La fecha de inicio no puede ser mayor que la final 2 ");
            } else if (mes_desde < mes_hasta) {
                newwindow = window.open("ResulGananciasGan.jsp?&fecha_desde=" + fecha_desde + "&fecha_hasta=" + fecha_hasta, "central");
            } else if (mes_desde == mes_hasta) {
                if (dia_desde > dia_hasta) {
                    alert("La fecha de inicio no puede ser mayor que la final 3");
                } else if (dia_desde <= dia_hasta) {
                    newwindow = window.open("ResulGananciasGan.jsp?&fecha_desde=" + fecha_desde + "&fecha_hasta=" + fecha_hasta, "central");
                }
            }
        }
    } else {
        alert("Complete los campos Obligatorios!");
    }
}

function cargarGanancia() {

    var ganancia = document.getElementById("ganancia");

    if (ganancia.length == 0) {
        alert("Va a cargar una ganancia igual a 0")
    }
    document.nuevaGanancia.submit();
}



function capturarEnvio(nodo) {

    var nodoTd = nodo.parentNode;
    var nodoTr = nodoTd.parentNode;
    var nodosEnTr = nodoTr.getElementsByTagName('td');
    var fecha_desde = nodosEnTr[1].textContent;
    var fecha_hasta = nodosEnTr[2].textContent;

    newwindow = window.open("verDetalleGanGan.jsp?&fecha_desde=" + fecha_desde + "&fecha_hasta=" + fecha_hasta, "central");

}


