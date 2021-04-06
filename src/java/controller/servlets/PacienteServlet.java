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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Almeidas
 */
@WebServlet(name = "PacienteServlet", urlPatterns = {"/PacienteServlet"})
public class PacienteServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));

        Paciente paciente = RepositorioPaciente.getCurrentInstance().read(id);

        request.setAttribute("paciente", paciente);

        getServletContext().getRequestDispatcher("/paciente.jsp").forward(request, response);

        String responseJSON = "{\"id\":" + paciente.getId() + ","
                + "\"nome\":\"" + paciente.getNome() + "\"}";
        /* +"\",\"itens\":[";
        for(ItemEntrada item : loteEntrada.getItens()){
            responseJSON += "{\"codigo\":"+item.getCodigo()+",\"nomeProduto\":\""+item.getProduto().getNome()+"\"}";
            if(loteEntrada.getItens().indexOf(item) != loteEntrada.getItens().size()-1){
               responseJSON += ",";
            }
        }
        responseJSON += "]}";*/

        response.setContentType("text/plain");

        try (PrintWriter out = response.getWriter()) {
            out.println(responseJSON);
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
        int codigo = Integer.parseInt(req.getParameter("id"));

        String operacao = req.getParameter("operacao");

        HttpSession session = req.getSession();

        Paciente p = new Paciente();

        if (p == null) {
            p = new Paciente();

            session.setAttribute("paciente", p);
        }
        List<Grupo> grupos = RepositorioGrupo.getCurrentInstance().readAll();
        if (operacao.equals("mais")) {

            //boolean controle = false;
            for (Grupo i : grupos) {
                if (i.getId() == codigo) {
                    //i.setQuantidade(i.getQuantidade() + 1);
                    //p.setGrupo(i);
                    //   controle = true;
                    session.setAttribute("selectgroup", i.getDenominacao());

                    break;
                }
            }

        }
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

        String nome = request.getParameter("nome");
        String caracteristicas = request.getParameter("caracteristicasIndividuais");
        int id = Integer.parseInt(request.getParameter("id"));
        String dataNascimento = request.getParameter("datanascimento");

        int idgrupo = Integer.parseInt(request.getParameter("groupId"));

        List<Grupo> grupos = RepositorioGrupo.getCurrentInstance().readAll();

        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");

        String a = request.getParameter("atualizar");
        String b = request.getParameter("aplicar");

        Paciente p = new Paciente();
        p.setNome(nome);
        p.setId(id);
        p.setCaracteristicasIndividuais(caracteristicas);

        try {
            p.setDataNascimento(formatoData.parse(dataNascimento));
        } catch (ParseException ex) {
            Logger.getLogger(PacienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (Grupo g : grupos) {

            if (g.getId() == idgrupo) {
                p.setGrupo(g);
            }
        }

        HttpSession session = request.getSession();

        if (a == null) {
            RepositorioPaciente.getCurrentInstance().insert(p);

            session.setAttribute("msg", "Paciente " + p.getNome() + " foi cadastrado.");

        } else {
            RepositorioPaciente.getCurrentInstance().update(p);
            session.setAttribute("msg", "Paciente " + p.getNome() + " foi atualizado.");
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
