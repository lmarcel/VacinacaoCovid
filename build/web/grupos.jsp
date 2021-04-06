<%-- 
    Document   : grupo
    Created on : 01/03/2021, 18:49:41
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioGrupo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupos cadastrados</title>
    </head>
    <body>
        
        <h1>Grupos cadastrados</h1>
        <a href="index.html">home</a><br/>
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
                out.println("<h2>" + mensagem + "</h2>");
                session.removeAttribute("msg");
            }
        %>

        <button onclick="modalopen()">cadastrar Grupos</button>

        <div id="modal" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="cadastrogrupo.jsp"
                       %>
            <br/>
            <button onclick="modalclose()">fechar</button>
        </div>

        <div id="modal2" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="visualizagrupo.jsp"
                       %>
            <br/>
            <button onclick="modal2close()">fechar</button>
        </div>

        <%
            List<Grupo> grupos = RepositorioGrupo.getCurrentInstance().readAll();
        %>

        <table border="1">
            <tr>
                <th>ID</th><th>Denominação</th><th>Idade mínima</th><th>Idade máxima</th><th>Operações</th> 
            </tr>
            <%
                for (Grupo g : grupos) {
            %>
            <tr>
                <td><%= g.getId()%></td>
                <td><%= g.getDenominacao()%></td>
                <td><%= g.getIdadeMinima()%></td>
                <td><%= g.getIdadeMaxima()%></td>
                <td><a href="GrupoServlet?id=<%= g.getId()%>&redirect=visualiza">visualizar</a>
                    <a href="GrupoServlet?id=<%= g.getId()%>&redirect=atualiza">atualizar</a>
                    <a href="#" onclick="deletefunc(<%= g.getId()%>)">deletar</a>
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

                fetch("GrupoServlet?id=" + id, {method: 'delete'})
                        .then(function (response) {
                            location.reload();
                        });
            };
        </script>

    </body>
</html>
