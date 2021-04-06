<%-- 
    Document   : cadastrogrupo
    Created on : 01/03/2021, 21:18:23
    Author     : Almeidas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Grupo</title>
    </head>
    <body>
        <h1>Cadastro de Grupo</h1>
         <form method="post" action="GrupoServlet">
            
            Denominação: <input type="text" name="denominacao" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?grupo.denominacao:''}"/><br/>
            Idade mínima: <input type="text" name="idadeMinima" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?grupo.idadeMinima:''}"/><br/>
            Idade máxima: <input type="text" name="idadeMaxima" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?grupo.idadeMaxima:''}"/><br/>
            ID: <input type="text" name="id" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?grupo.id:''}"/><br/>
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}" value="atualizar"/>
            
            <input type="submit" value="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}"/><br/>
           
        </form>
    </body>
</html>
