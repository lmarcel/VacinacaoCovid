<%-- 
    Document   : visualizaprofissionalEnfermagem
    Created on : 02/03/2021, 11:51:31
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <% 
            ProfissionalEnfermagem prof = (ProfissionalEnfermagem)request.getAttribute("profissionalEnfermagem");
            if( prof != null){
        %>
        <table>
            <tr>
                <th>ID</th><td><%= prof.getId()%></td>
            </tr>
            <tr>
                <th>Nome</th><td><%= prof.getNome()%></td>
            </tr>
            <tr>
                <th>Coren</th><td><%= prof.getCoren() %></td>
            </tr>
            <tr>
                <th>Ano de formação</th><td><%= prof.getAnoFormacao()%></td>
            </tr>
            <tr>
                <th>contato</th><td><%= prof.getContato() %></td>
            </tr>            
        </table>
            <% }%>
    </body>
</html>
