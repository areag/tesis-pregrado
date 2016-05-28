/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function resizeIframe(iframe) {
    var i = 200;
    iframe.height = iframe.contentWindow.document.body.scrollHeight + i + "px";
}

function cambia() {

    window.frames.location[3].src = "Buscar.jsp";
}

jQuery(function ($) {
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '&#x3c;Ant',
        nextText: 'Sig&#x3e;',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
            'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles', 'Jueves', 'Viernes', 'S&aacute;bado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mi&eacute;', 'Juv', 'Vie', 'S&aacute;b'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S&aacute;'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''};
    $.datepicker.setDefaults($.datepicker.regional['es']);
});

$(document).ready(function () {
    $("#fecha").datepicker({showAnim: 'fadeIn'});
});

$(document).ready(function () {
    $(".fecha_gan").datepicker({showAnim: 'fadeIn'});
});



function volver() {
    window.history.back();
}

function volverInicio() {

    window.open('central.html', 'central');
}

function abrepagina() {

    var newjsp = document.form1.funciones.options[document.form1.funciones.selectedIndex].value;
    window.open(newjsp, 'central', ' ');
}


function soloNumeros(e) //SOLO NUMEROS CON BACKSPACE...ANTES NO LA TENIA
{

    var key = window.Event ? e.which : e.keyCode
    return ((key >= 48 && key <= 57) || (key >= 8 && key <= 9) || (key == 46))
}



