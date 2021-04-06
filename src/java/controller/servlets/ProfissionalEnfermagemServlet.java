/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlets;

import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProfissionalEnfermagemServlet", urlPatterns = {"/ProfissionalEnfermagemServlet"})
public class ProfissionalEnfermagemServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        String redirect = request.getParameter("redirect");

        ProfissionalEnfermagem g = RepositorioProfissionalEnfermagem.getCurrentInstance().read(id);

        request.setAttribute("profissionalEnfermagem", g);

        getServletContext().getRequestDispatcher("/profissionalEnfermagem.jsp").forward(request, response);

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
        String coren = request.getParameter("coren");
        int anoFormacao = Integer.parseInt(request.getParameter("anoFormacao"));
        String contato = request.getParameter("contato");
        int id = Integer.parseInt(request.getParameter("id"));

        String a = request.getParameter("atualizar");

        ProfissionalEnfermagem g = new ProfissionalEnfermagem();
        
        g.setAnoFormacao(anoFormacao);
        g.setContato(contato);
        g.setCoren(coren);
        g.setId(id);
        g.setNome(nome);

        HttpSession session = request.getSession();

        if (a == null) {
            RepositorioProfissionalEnfermagem.getCurrentInstance().insert(g);

            session.setAttribute("msg", "profissional de Enfermagem " + g.getNome() + " foi cadastrado.");

        } else {
            RepositorioProfissionalEnfermagem.getCurrentInstance().update(g);
            session.setAttribute("msg", "profissional de Enfermagem " + g.getNome() + " foi atualizado.");
        }
        response.sendRedirect("profissionalEnfermagem.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doDelete(request, response); //To change body of generated methods, choose Tools | Templates.
        int id = Integer.parseInt(request.getParameter("id"));

        ProfissionalEnfermagem p = RepositorioProfissionalEnfermagem.getCurrentInstance().read(id);
        RepositorioProfissionalEnfermagem.getCurrentInstance().delete(p);

        HttpSession session = request.getSession();

        session.setAttribute("msg", "o profissional de Enfermagem " + p.getNome() + " foi deletado");

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
