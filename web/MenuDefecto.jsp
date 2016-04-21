<%-- 
    Document   : MenuDefecto
    Created on : 04-ene-2016, 18:12:26
    Author     : instrumentos2
--%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>JSP Page</title>
        


        <%
            SQL r = new SQL();
            Object ses = session.getAttribute("connection");

            if (ses == null) {
                ses = "1";
            }
            if (!ses.equals("1")) {

                String user = request.getParameter("usuario");
                String pass = request.getParameter("password");
                String resul = r.conexion(user, pass);

                if (resul.equals("MySQL OK")) {

                    session.setAttribute("user_session", user);
                    session.setAttribute("pass_session", pass);
                    session.setAttribute("connection", "1");
                    session.setAttribute("privilegio", r.lista.get(2));
                    
                    out.print("<script>");
                    out.print("window.open('Buscar.jsp', 'login')");
                    out.print("</script>");

                    out.print("<script>");
                    out.print("window.open('DatosUsuario.jsp?&Usuario= Bienvenido: " + r.lista.get(0) + " " + r.lista.get(1) + "','loginresult')");
                    out.print("</script>");
                    
                    out.print("<script>");
                    out.print("document.getElementById('footer').style.display='none';");
                    out.print("</script>");
                    

                } else {
                    if (resul.equals("Bloqueado")) {
                        session.setAttribute("connection", "2");
                        out.println("<script>");
                        out.println("window.open('DatosUsuario.jsp?&Usuario=Usuario: " + user + " - Bloqueado!&Error=1','loginresult')");
                        out.println("</script>");

                    } else {

                        session.setAttribute("connection", "2");
                        out.println("<script>");
                        out.println("window.open('DatosUsuario.jsp?&Usuario=Error: " + user + "&Error=1','loginresult')");                        
                        out.println("</script>");
                    }

                }
            } else {

            }


        %>
     
        
    <div id="lista">
        
        <%if(session.getAttribute("connection").equals("1")){%>
    <ul >
        <%            Object priv = session.getAttribute("privilegio"); // VER BIEN LOS CSS
            if (priv.equals("admin")) {
        %>
        <li>
            USUARIOS
        </li>

        <li onclick="window.open('OpcionesGanaderia.jsp','central')" style="cursor: pointer"> 
            GANADERIA
        </li>
        <li  onclick="window.open('OpcionesAgricultura.jsp','central')" style="cursor: pointer"> 
            AGRICULTURA
        </li>
        <li>
            EMPRESA
        </li>

        <%} else if (priv.equals("Encargado") || priv.equals("Contador") || priv.equals("Dueño")) {

        %>
        <li onclick="window.open('OpcionesGanaderia.jsp','central')" style="cursor: pointer">
            GANADERIA
        </li>
        <li  onclick="window.open('OpcionesAgricultura.jsp','central')" style="cursor: pointer">
            AGRICULTURA
        </li>
        <li>
            EMPRESA
        </li> 
        <%} else {
        %>
        <li onclick="window.open('OpcionesGanaderia.jsp','central')" style="cursor: pointer">
            GANADERIA
        </li>
        <li  onclick="window.open('OpcionesAgricultura.jsp','central')" style="cursor: pointer">
            AGRICULTURA
        </li>
        <%
            }
            }else{
            session.setAttribute("connection", "2");
               %>
            
        <%}
        %>


    </ul>
</div>
</head>
<body>
    
</body>

</html>
