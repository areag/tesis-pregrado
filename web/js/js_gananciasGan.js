/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function verificarVacios() {

    var fecha_desde = document.getElementById("fecha_desde").value;
    var dia_desde = fecha_desde.substr(0 , 2);
    var mes_desde = fecha_desde.substr(3 , 2);
    var año_desde = fecha_desde.substr(6, 4);
  
    var fecha_hasta = document.getElementById("fecha_hasta").value;
     var dia_hasta = fecha_hasta.substr(0 , 2);
    var mes_hasta = fecha_hasta.substr(3 , 2);
    var año_hasta = fecha_hasta.substr(6, 4);


    if (fecha_desde == 0 || fecha_hasta == 0) {
        alert("Complete los campos Obligatorios!");
    } else if (año_desde > año_hasta) {
        alert("La fecha de inicio no puede ser mayor que la final");
    }else if(año_desde == año_hasta){
        if(mes_desde > mes_hasta){
            alert("La fecha de inicio no puede ser mayor que la final");
        }else if (mes_desde == mes_hasta){
            if (dia_desde > dia_hasta){
                alert("La fecha de inicio no puede ser mayor que la final");
            }else{
                alert ("funciona");
                document.miformGan.submit();
            }
        }
    }
        
   
   
        
   




}