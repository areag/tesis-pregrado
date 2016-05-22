<%-- 
    Document   : ReportesGan}
    Created on : 19/05/2016, 18:27:54
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.ReportesGan" %>
<jsp:useBean id="reportes" class="beans.ReportesGan" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/jspdf.min.js"></script>
        <script type="text/javascript" src="js/html2canvas.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script> 

        <script>

$(document).ready(function () {
                var div = $('#pdf');
                var cache_width = div.width() - 12;               
                var a4 = [595.28, 841.89];

                $('#crear_pdf').click(function () {
                    createPDF();                  
                });
                function createPDF() {
                    getCanvas().then(function (canvas) {
                        var
                                img = canvas.toDataURL("image/png"),
                                doc = new jsPDF({
                                    unit: 'px',
                                    format: 'a4'
                                });
                        doc.addImage(img, 'JPEG', 20, 20);
                        doc.save('Reportes_Ganaderia.pdf');
                        div.width(cache_width);
                    });
                }
                function getCanvas() {
                    div.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
                    return html2canvas(div, {
                        imageTimeout: 2000,
                        removeContainer: true
                    });
                }
});  

        </script>

        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan order by fecha asc; ");
                            if(rs.next() ) {
                                rs.last();
                            }                        
                            String fecha_ant = rs.getString("fecha");
                            
                            %>

        <title>Reportes de valuacion y existencias Ganaderas</title>
    </head>
    <body>
        <div id="contenedor" class="container">

            <div id="pdf" style="padding: 2px">
                
                 

                <div id="Tabla1">

                    <h1>Reporte de valuación y existencias Ganaderas</h1> 
                    
                    <h4> Crear reporte ganadero para la fecha: <%=fecha_ant%> </h4> 

                    <h2>Tabla 1</h2>
                    <table>
                        <thead>    
                            <tr>
                                <th>Categoria</th>                          
                                <th>Cantidad</th>
                                <th>Kg. Promedio</th>
                                <th>Precio de Plaza al Cierre</th>
                                <th>Costo Total</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th> Terneros </th>
                                <td>EFT</td>
                                <td>PROMT</td>
                                <td>PPT</td>
                                <td>EFTxPromTxPPT</td>
                            </tr>
                            <tr>
                                <th> Novillos </th>
                                <td>EFN</td>
                                <td>PROMN</td>
                                <td>PPN</td>
                                <td>=EFNxPromNxPPN</td>
                            </tr>
                            <tr>
                                <td> </td>                                    
                                <td> </td>
                                <td> </td>                                    
                                <td>Total</td>                                   
                                <td>Suma</td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <div id="Tabla2">

                    <h2>Tabla 2</h2>
                    <table>
                        <thead>    
                            <tr>
                                <th>Categoria</th>                          
                                <th>Cantidad</th>
                                <th>Kg. Promedio</th>
                                <th>Precio de Plaza al Cierre %</th>
                                <th>Costo Total</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th> Terneros </th>
                                <td>EFT</td>
                                <td>PROMT</td>
                                <td>PPT%</td>
                                <td>EFTxPromTxPPT-%</td>
                            </tr>
                            <tr>
                                <th> Novillos </th>
                                <td>EFN</td>
                                <td>PROMN</td>
                                <td>PPN</td>
                                <td>EFNxPromNxPPN-%</td>
                            </tr>
                            <tr>
                                <td> </td>                                    
                                <td> </td>
                                <td> </td>                                    
                                <td>Existencia final Total:</td>                                   
                                <td>Suma</td>
                            </tr>

                        </tbody>
                    </table>

                </div>

            </div>

            <form name="formEdicion2" action="" method="post" onreset="anular()">

                <div id="contenedorForm" class="container">

                </div>

            </form>

            <input type="button" value="Generar PDF" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  id="crear_pdf" /><br />
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />
            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />


        </div>
    </body>




</html>
