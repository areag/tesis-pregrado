<%-- 
    Document   : ResulGananciasGan
    Created on : 23/04/2016, 20:35:52
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GananciasGan" %>
<jsp:useBean id="ganancias" class="beans.GananciasGan" scope="session" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <link href="css/FormCarga.css" rel="stylesheet"> 

        <script type="text/javascript" src="js/js_gananciasGan.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>



        <%!

            String r1 = "";
            String r2 = "";
            boolean resultado;
            double ingreso_bruto = 0;
            double total_GCV = 0;
            double ingreso_neto = 0;          
            double total_GG = 0;          
            double total_GCC = 0;
            double gastos_GR = 0;
            double ganancia = 0;
            
            %>
        <%
            String fecha_desde = request.getParameter("fecha_desde");
            String dia_desde = fecha_desde.substring(0, 2);
            String mes_desde = fecha_desde.substring(3, 5);
            String año_desde = fecha_desde.substring(6, 10);
            fecha_desde = año_desde + "/" + mes_desde + "/" + dia_desde;

            String fecha_hasta = request.getParameter("fecha_hasta");
            String dia_hasta = fecha_hasta.substring(0, 2);
            String mes_hasta = fecha_hasta.substring(3, 5);
            String año_hasta = fecha_hasta.substring(6, 10);
            fecha_hasta = año_hasta + "/" + mes_hasta + "/" + dia_hasta;


        %>

        <title>Generar Ganancias</title>

    </head>
    <body>
        <div id="contenedor" class="container">
            
           <h3>Ganancias Generadas desde: <%=fecha_desde%> hasta: <%=fecha_hasta%>  </h3>
           
                        <%
                            try {
                                ingreso_bruto = ganancias.ingreso_bruto(fecha_desde, fecha_hasta);
                                total_GCV = ganancias.total_GCV(fecha_desde, fecha_hasta);
                                ingreso_neto = ganancias.ingreso_neto();
                                total_GG = ganancias.total_GG(fecha_desde, fecha_hasta);
                                gastos_GR = ganancias.gastos_GR(fecha_desde, fecha_hasta);
                                total_GCC = ganancias.total_GCC(fecha_desde, fecha_hasta);
                                ganancia = ganancias.ganancia(); 
                                
                            } catch (Exception e) {                          
                                out.print("Ocurrio una excepcion: " + e.getMessage()) ;
                          }

                        %>
      
            <div class="form" style ="border-top : 2px solid #1de341;"> <br />
                
                <form id="nuevaGanancia" name="nuevaGanancia" method="post" action="RegistroGananciasGan.jsp" class="formularios" target="central">

                <label for="ib" class="Texto"> Ingreso Bruto: </label>
                <input type="text" name="ib" id="ib" class="ComboMedio" value="<%=ingreso_bruto%>" readonly="readonly"> <label for="ib" class="Texto">$</label> <br /><br />

                <label for="total_GCV" class="Texto"> Total de Gastos de Comercialización Ventas: </label>
                <input type="text" name="total_GCV" id="total_GCV" class="ComboMedio" value="<%=total_GCV%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <label for="in" class="Texto"> Ingreso Neto: </label>
                <input type="text" name="in" id="in" class="ComboMedio" value="<%=ingreso_neto%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <label for="total_GG" class="Texto"> Total Gastos Ganadería: </label>
                <input type="text" name="total_GG" id="total_GG" class="ComboMedio" value="<%=total_GG%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <label for="gr" class="Texto"> Gastos Reposición: </label>
                <input type="text" name="gr" id="gr" class="ComboMedio" value="<%=gastos_GR%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <label for="total_GCC" class="Texto"> Total Gastos de Comercialización de Compra: </label>
                <input type="text" name="total_GCC" id="total_GCC" class="ComboMedio" value="<%=total_GCC%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <label for="ganancia" class="Texto"> Ganancia: </label>
                <input type="text" name="ganancia" id="ganancia" class="ComboMedio" value="<%=ganancia%>" readonly="readonly"><label for="ib" class="Texto">$</label> <br /><br />

                <input type="button" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="cargarGanancia()"/><br />
                
                <input type="hidden" name="fecha_desde" value="<%=fecha_desde%>">
                <input type="hidden" name="fecha_hasta" value="<%=fecha_hasta%>">
                <input type="hidden" name="select" value="select">
                
                
                </form>
                
                
                
                
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />

                <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />
            </div>


        </div>

        <script>
            <%=r1%>
            <%=r2%>
        </script> 

    </body>
</html>
