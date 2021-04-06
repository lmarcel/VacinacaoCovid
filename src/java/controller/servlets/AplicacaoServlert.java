/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlets;

import br.recife.edu.ifpe.model.classes.Aplicacao;
import br.recife.edu.ifpe.model.classes.Grupo;
import br.recife.edu.ifpe.model.classes.Paciente;
import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import br.recife.edu.ifpe.model.classes.Vacina;
import br.recife.edu.ifpe.model.repositorios.RepositorioGrupo;
import br.recife.edu.ifpe.model.repositorios.RepositorioPaciente;
import br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem;
import br.recife.edu.ifpe.model.repositorios.RepositorioVacina;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Almeidas
 */
@WebServlet(name = "AplicacaoServlert", urlPatterns = {"/AplicacaoServlert"})
public class AplicacaoServlert extends HttpServlet {




    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        


        int id = Integer.parseInt(request.getParameter("id"));



        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");

        String a = request.getParameter("atualizar");
        String b = request.getParameter("aplicar");

        Paciente p = RepositorioPaciente.getCurrentInstance().read(id);

        if (b != null) {
            int idvacina = Integer.parseInt(request.getParameter("idvacina"));
            int idprofissional = Integer.parseInt(request.getParameter("idprofissional"));
            String descricaoaplicacao = request.getParameter("descricaoaplicacao");
            ProfissionalEnfermagem profissional = RepositorioProfissionalEnfermagem.getCurrentInstance().read(idprofissional);
            Vacina vacina = RepositorioVacina.getCurrentInstance().read(idvacina);

            DateFormat dateFormatHora = new SimpleDateFormat("HH:mm:ss");
            Date date = new Date(System.currentTimeMillis());

            Aplicacao aplicacao = new Aplicacao();

            aplicacao.setAplicador(profissional);
            aplicacao.setVacina(vacina);
            aplicacao.setDescricao(descricaoaplicacao);
            aplicacao.setData(date);
            aplicacao.setHora(dateFormatHora.format(date));

            p.setAplicacoes(Arrays.asList(aplicacao));
        }
        response.sendRedirect("paciente.jsp");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
