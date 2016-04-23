/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function verificarVacios() {

    var hayError = false;
    var fecha_desde = document.getElementById("fecha_desde").value;
    var dia= fecha_desde.substr(0 , 2);
    alert (dia);
    var fecha_hasta = document.getElementById("fecha_hasta").value;


    if (fecha_desde == 0 || fecha_hasta == 0) {
        hayError = true;
    }

    if (hayError) {
        alert("Complete los campos Obligatorios!");
    } else {
        //document.miformGan.submit();
    }


    alert(fecha_desde);
    alert(fecha_hasta);


}