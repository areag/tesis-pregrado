<%-- 
    Document   : EditGananciasGan
    Created on : 27/04/2016, 19:34:56
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GananciasGan" %>
<jsp:useBean id="ganancias" class="beans.GananciasGan" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ganancias Ganaderia</title>

        <%!
            String idgananciasgan;
            boolean resultado;
            String r1;
            String r2;
            String desvio;

                                            %>
                                            
        <%
            desvio = request.getParameter("desvio");

            if ("eliminar".equals(desvio)) {
                int idgananciasgan = Integer.parseInt(request.getParameter("idgananciasgan"));
                GananciasGan gan = new GananciasGan();
                resultado = gan.eliminarGanancia(idgananciasgan);
                if (resultado == true) {
                    r1 = "alert('Ganancia Cargadas Exitosamente!!!!!')";
                    r2 = "window.open('RegistroGananciasGan.jsp','central')";

                } else {
                    r1 = "alert('Error, verifique las fechas!!!')";
                    r2 = "window.open('RegistroGananciasGan.jsp', 'central')";

                }
            }
        %>
        <script>
            <%=r1%>
            <%=r2%>
        </script> 

    </head>
    <body>
    
    </body>
</html>
