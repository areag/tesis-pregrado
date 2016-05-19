<%-- 
    Document   : ReportesGan}
    Created on : 19/05/2016, 18:27:54
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Reportes de valuacion y existencias Ganaderas</title>
    </head>
    <body>
       <div id="contenedor" class="container">

            <div id="Tabla1">


                <h1>Reporte de valuación y existencias Ganaderas</h1> <br />

                
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


            <form name="formEdicion2" action="EditGananciasGan.jsp" method="post" onreset="anular()">

                <div id="contenedorForm" class="container">

                </div>

            </form>
            <br>
            
            <input type="button" value="Imprimir??" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" /><br />
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />
            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />
    
            

        </div>
    </body>
</html>
