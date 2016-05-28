<%-- 
    Document   : ReportesGan}
    Created on : 19/05/2016, 18:27:54
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.ReportesGan" %>
<%@page import ="beans.GananciasGan" %>
<jsp:useBean id="reportes" class="beans.ReportesGan" scope="session" />
<jsp:useBean id="ganancias" class="beans.GananciasGan" scope="session" />
             


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
$(function () {
                var div = $('#pdf');
                var cache_width = div.width();               
                $('#crear_pdf').click(function () {
                    createPDF();
                });
                function createPDF() {
                    getCanvas().then(function (canvas) {
                        var img = canvas.toDataURL("image/png");
                        var doc = new jsPDF({
                            unit: 'px'
                        });
                        doc.addImage(img, 'JPEG', 20, 20);
                        doc.save('Reportes_Ganaderia.pdf');
                        div.width(cache_width);
                    });
                }
                function getCanvas() {                  
                    return html2canvas(div, {
                        imageTimeout: 2000,
                        removeContainer: true
                    });
                }
            });
            
        </script>

        <%
            int idexistencias = Integer.parseInt(request.getParameter("idexistenciasgan"));
            int eft = 0;
            int efn = 0;
            String fecha_desde = "";
            String fecha_hasta = "";
            double peso_ternero = 0;
            double peso_novillo = 0;
            double precio_ternero = 0;
            double pp_ternero = 0;
            double precio_novillo = 0;
            double pp_novillo = 0;
            double prueba;
            double costo_ternero = 0;
            double costop_ternero = 0;
            double costo_novillo = 0;
            double costop_novillo = 0;
            double costo_total = 0;
            double costop_total = 0;
            double gastos_comer = 0;
            
            
            SQL sql = new SQL();
            sql.conexion("root", "root");
            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan WHERE idexistenciasgan = " + idexistencias + ";" );
            while(rs.next()){
                fecha_desde = rs.getString("fecha_desde");
                fecha_hasta = rs.getString("fecha_hasta");
                eft = rs.getInt("eft");
                efn = rs.getInt("efn");
                peso_ternero = rs.getDouble("peso_ternero");
                peso_novillo = rs.getDouble("peso_novillo");
                precio_ternero = rs.getDouble("precio_ternero");
                precio_novillo = rs.getDouble("precio_novillo");
                
            }
            gastos_comer = ganancias.total_GCC(fecha_desde, fecha_hasta);
            
            costo_ternero = Math.round((eft * peso_ternero * precio_ternero) * 100 / 100);          
            costo_novillo = Math.round((efn * peso_novillo * precio_novillo) * 100 / 100);
            costo_total = costo_ternero + costo_novillo;
       
            pp_ternero = precio_ternero - (gastos_comer * precio_ternero / 100);
            pp_novillo = precio_novillo - (gastos_comer * precio_novillo / 100);
            
            costop_ternero = Math.round((eft * peso_ternero * pp_ternero) * 100 / 100);          
            costop_novillo = Math.round((efn * peso_novillo * pp_novillo) * 100 / 100);
            costop_total = costop_ternero + costop_novillo;
            
        %>

        <title>Reportes de valuacion y existencias Ganaderas</title>
    </head>
    <body>
        <div id="contenedor" class="container">

            <div id="pdf" style="padding: 2px">

                <%=idexistencias%>
                
                

                <div id="Tabla1">

                    <h1>Reporte de valuación y existencias Ganaderas</h1> 

                    <h4> Crear reporte ganadero para la fecha:</h4> 

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
                                <td><%=eft%></td>
                                <td><%=peso_ternero%></td>
                                <td><%=precio_ternero%></td>
                                <td><%=costo_ternero%></td>
                            </tr>
                            <tr>
                                <th> Novillos </th>
                                <td><%=efn%></td>
                                <td><%=peso_novillo%></td>
                                <td><%=precio_novillo%></td>
                                <td><%=costo_novillo%></td>
                            </tr>
                            <tr>
                                <td> </td>                                    
                                <td> </td>
                                <td> </td>                                    
                                <td>Total</td>                                   
                                <td><%=costo_total%></td>
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
                                <td><%=eft%></td>
                                <td><%=peso_ternero%></td>
                                <td><%=pp_ternero%></td>
                                <td><%=costop_ternero%></td>
                            </tr>
                            <tr>
                                <th> Novillos </th>
                                 <td><%=efn%></td>
                                <td><%=peso_novillo%></td>
                                <td><%=pp_novillo%></td>
                                <td><%=costop_novillo%></td>
                            </tr>
                            <tr>
                                <td> </td>                                    
                                <td> </td>
                                <td> </td>                                    
                                <td>Existencia final Total:</td>                                   
                                <td><%=costop_total%></td>
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
            <input type="button" name="Volver" value="Guardar" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />
            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="window.close()" />


        </div>
    </body>




</html>
