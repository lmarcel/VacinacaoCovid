<%-- 
    Document   : vacina
    Created on : 01/03/2021, 18:51:10
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioVacina"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacinas cadastradas</title>
    </head>
    <body>
        
        <h1>Vacinas cadastradas</h1>
        <a href="index.html">home</a><br/>
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
                out.println("<h2>" + mensagem + "</h2>");
                session.removeAttribute("msg");
            }
        %>

        <button onclick="modalopen()">cadastrar vacina</button>

        <div id="modal" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="cadastrovacina.jsp"
                       %>
            <br/>
            <button onclick="modalclose()">fechar</button>
        </div>

        <div id="modal2" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="visualizavacina.jsp"
                       %>
            <br/>
            <button onclick="modal2close()">fechar</button>
        </div>

        <%
            List<Vacina> vacinas = RepositorioVacina.getCurrentInstance().readAll();
        %>

        <table border="1">
            <tr>
                <th>ID</th><th>Nome</th><th>Fabricante</th><th>Tempo entre aplicações</th><th>Doses</th><th>Operações</th> 
            </tr>
            <%
                for (Vacina v : vacinas) {
            %>
            <tr>
                <td><%= v.getId()%></td>
                <td><%= v.getNome()%></td>
                <td><%= v.getFabricante()%></td>
                <td><%= v.getTempoEntreAplicacoes()%></td>
                <td><%= v.getQuantidadeAplicacoes()%></td>                
                <td><a href="VacinaServlet?id=<%= v.getId()%>&redirect=visualiza">visualizar</a>
                    <a href="VacinaServlet?id=<%= v.getId()%>&redirect=atualiza">atualizar</a>
                    <a href="#" onclick="deletefunc(<%= v.getId()%>)">deletar</a>
                </td>
            </tr>

            <%
                }
            %>
        </table>

        <script>

            var modal = document.getElementById("modal");


            var modal2 = document.getElementById("modal2");

            <%
                String redirect = request.getParameter("redirect");
                if (redirect == null) {
            %>
            document.body.removeChild(modal);
            document.body.removeChild(modal2);
            <% } else if (redirect.equals("visualiza")) { %>
            document.body.removeChild(modal);
            <% } else { %>
            document.body.removeChild(modal2);
            <% }%>
            function modalclose() {
                document.body.removeChild(modal);
            }
            function modal2close() {
                document.body.removeChild(modal2);
            }

            function modalopen() {
                document.body.appendChild(modal);
            }

            function deletefunc(id) {

                fetch("VacinaServlet?id=" + id, {method: 'delete'})
                        .then(function (response) {
                            location.reload();
                        });
            };
        </script>

    </body>
</html>
