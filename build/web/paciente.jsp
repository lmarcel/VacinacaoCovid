<%-- 
    Document   : paciente
    Created on : 05/04/2021, 19:44:25
    Author     : Almeidas
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pacientes</title>
    </head>
    <body>
        <a href="index.html" style="text-decoration: none;">Home</a><br>
        <h1>Pacientes cadastrados</h1>
        <h3><c:out value="${msg}"/></h3>
        <c:remove var="msg" scope="session"/>

        <ifpe:carregapacientes/>


        <button onclick="modalopen()">cadastrar Paciente</button>

        <div id="modal" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="cadastropaciente.jsp"
                       %>
            <br/>
            <button onclick="modalclose()">fechar</button>
        </div>
        <div id="modal2" style="position: absolute; left:100px; top: 20px; border: 1px solid black;background-color: white;">
            <%@include file="visualizapaciente.jsp" %>
            <button onclick="modal2close()">Close</button>
        </div>

        <div id="modal3" style="position: absolute; top: 200px; left: 200px; border: 1px black solid;background-color: white">
            <%@include file="aplicacao.jsp"
                       %>
            <br/>
            <button onclick="modal3close()">fechar</button>
        </div>
        <div id="modal4" style="position: absolute; left:100px; top: 20px; border: 1px solid black;background-color: white;">
            <%@include file="visualizaaplicacao.jsp" %>
            <button onclick="modal4close()">Close</button>
        </div>

        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Data de Nascimento</th>
                <th>Caracteristicas Individuais</th>
                <th>Grupo</th>
                <th>Operações</th>
                <th>Aplicações</th>
            </tr>

            <c:forEach var="pAux" items="${pacientes}">
                <tr>
                    <td>${pAux.id}</td>
                    <td>${pAux.nome}</td>

                    <td><fmt:formatDate value="${pAux.dataNascimento}" type="date"/></td>
                    <td>${pAux.caracteristicasIndividuais}</td>
                    <td>${pAux.grupo.denominacao}</td>
                    <td><a href="PacienteServlet?id=${pAux.id}&redirect=atualiza">atualizar</a><br>
                        
                        <a href="PacienteServlet?id=${pAux.id}&redirect=visualiza">visualizar</a>
                    </td>
                    <td>
                        <a href="PacienteServlet?id=${pAux.id}&redirect=aplica">aplicar</a><br>
                        <a href="PacienteServlet?id=${pAux.id}&redirect=veraplicacao">ver aplicações</a>
                    </td>

                </tr>

            </c:forEach>

        </table><br>



        <script>

            var modal = document.getElementById("modal");
            var modal2 = document.getElementById("modal2");
            var modal3 = document.getElementById("modal3");
            var modal4 = document.getElementById("modal4");

            <%
                String redirect = request.getParameter("redirect");
                if (redirect == null) {
            %>

            document.body.removeChild(modal);
            document.body.removeChild(modal2);
            document.body.removeChild(modal3);
            document.body.removeChild(modal4);
            <% } else if (redirect.equals("visualiza")) { %>
            document.body.removeChild(modal);
            document.body.removeChild(modal3);
            document.body.removeChild(modal4);
            <% } else if (redirect.equals("aplica")) { %>
            document.body.removeChild(modal);
            document.body.removeChild(modal2);
            document.body.removeChild(modal4);
            <% } else if (redirect.equals("veraplicacao")) { %>
            document.body.removeChild(modal);
            document.body.removeChild(modal3);
            document.body.removeChild(modal2);
            <% } else { %>
            document.body.removeChild(modal2);
            document.body.removeChild(modal3);
            document.body.removeChild(modal4);
            <% }%>
            function modalclose() {
                document.body.removeChild(modal);
            }
            function modal2close() {
                document.body.removeChild(modal2);
            }
            function modal3close() {
                document.body.removeChild(modal3);
            }

            function modal4close() {
                document.body.removeChild(modal4);
            }

            function modalopen() {
                document.body.appendChild(modal);
            }





            function myFunction(codigo) {
                document.getElementById("campogrupo").value = codigo;
            }



            function adicionaVacId(codigo, nome) {
                document.getElementById("idvacina").value = codigo;
                document.getElementById("nomevacina").value = nome;
            }

            
            function adicionaProId(codigo, nome) {
                document.getElementById("idprofissional").value = codigo;
                document.getElementById("nomeprofissional").value = nome;
            }





            var myDiv;
            function carregaItens(id) {
                console.log("Entrei na função");
                fetch("PacienteServlet?id=" + id, {method: "get"}).then(function (response) {

                    response.text().then(function (text) {
                        console.log(text);

                        let objeto = JSON.parse(text);

                        myDiv = document.createElement("div");

                        myDiv.setAttribute("class", "modal");

                        document.body.appendChild(myDiv);


                        myDiv.innerHTML = "<h3>Informações do paciente</h3><br>";
                        let tabela = document.createElement("table");
                        //tabela.setAttribute("border", "1");

                        myDiv.appendChild(tabela);



                        let tr1 = document.createElement("tr");

                        let th1 = document.createElement("th");
                        th1.innerHTML = "Id";

                        let td1 = document.createElement("td");
                        td1.innerHTML = objeto.id;

                        tr1.appendChild(th1);
                        tr1.appendChild(td1);

                        let tr2 = document.createElement("tr");

                        let th2 = document.createElement("th");
                        th2.innerHTML = "Nome";

                        let td2 = document.createElement("td");
                        td2.innerHTML = objeto.nome;

                        tr2.appendChild(th2);
                        tr2.appendChild(td2);



                        tabela.appendChild(tr1);
                        tabela.appendChild(tr2);


                        let botao = document.createElement("button");
                        botao.appendChild(document.createTextNode("fechar"));

                        myDiv.appendChild(botao);

                        botao.addEventListener("click", function () {

                            document.body.removeChild(myDiv);
                            myDiv = "";

                        });

                    });
                });
            }
        </script>

    </body>
</html>
