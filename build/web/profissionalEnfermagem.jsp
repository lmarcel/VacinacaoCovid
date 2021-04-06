<%-- 
    Document   : profissionalenfermagem
    Created on : 01/03/2021, 18:50:58
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profissionais de enfermagem cadastrados</title>
    </head>
    <body>
        
        <h1>Profissionais de enfermagem cadastrados</h1>
        <a href="index.html">home</a><br/>
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
                out.println("<h2>" + mensagem + "</h2>");
                session.removeAttribute("msg");
            }
        %>

        <button onclick="modalopen()">cadastrar Profissional</button>

        <div id="modal" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="cadastroprofissionalEnfermagem.jsp"
                       %>
            <br/>
            <button onclick="modalclose()">fechar</button>
        </div>

        <div id="modal2" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="visualizaprofissionalEnfermagem.jsp"
                       %>
            <br/>
            <button onclick="modal2close()">fechar</button>
        </div>

        <%
            List<ProfissionalEnfermagem> profissionaisEnfermagem = RepositorioProfissionalEnfermagem.getCurrentInstance().readAll();
        %>

        <table border="1">
            <tr>
                <th>ID</th><th>Nome</th><th>Coren</th><th>Ano de formação</th><th>Contato</th><th>Operações</th> 
            </tr>
            <%
                for (ProfissionalEnfermagem p : profissionaisEnfermagem) {
            %>
            <tr>
                <td><%= p.getId()%></td>
                <td><%= p.getNome()%></td>
                <td><%= p.getCoren()%></td>
                <td><%= p.getAnoFormacao()%></td>
                <td><%= p.getContato()%></td>
                <td><a href="ProfissionalEnfermagemServlet?id=<%= p.getId()%>&redirect=visualiza">visualizar</a>
                    <a href="ProfissionalEnfermagemServlet?id=<%= p.getId()%>&redirect=atualiza">atualizar</a>
                    <a href="#" onclick="deletefunc(<%= p.getId()%>)">deletar</a>
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

                fetch("ProfissionalEnfermagemServlet?id=" + id, {method: 'delete'})
                        .then(function (response) {
                            location.reload();
                        });
            };
        </script>

    </body>
</html>
