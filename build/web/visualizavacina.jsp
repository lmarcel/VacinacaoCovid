<%-- 
    Document   : visualizavacina
    Created on : 02/03/2021, 11:51:15
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Vacina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacina cadastrada</title>
    </head>
    <body>
        <h1>Vacina cadastrada</h1>
         <% 
            Vacina vac = (Vacina)request.getAttribute("vacina");
            if( vac != null){
        %>
        <table>
            <tr>
                <th>ID</th><td><%= vac.getId()%></td>
            </tr>
            <tr>
                <th>Nome</th><td><%= vac.getNome()%></td>
            </tr>
            <tr>
                <th>Fabricante</th><td><%= vac.getFabricante() %></td>
            </tr>
            <tr>
                <th>Tempo entre aplicações</th><td><%= vac.getTempoEntreAplicacoes()%></td>
            </tr>
            <tr>
                <th>Quantidade de aplicações</th><td><%= vac.getQuantidadeAplicacoes() %></td>
            </tr>            
        </table>
            <% }%>
    </body>
</html>
