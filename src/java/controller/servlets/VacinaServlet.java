/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlets;

import br.recife.edu.ifpe.model.classes.Vacina;
import br.recife.edu.ifpe.model.repositorios.RepositorioVacina;
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
@WebServlet(name = "VacinaServlet", urlPatterns = {"/VacinaServlet"})
public class VacinaServlet extends HttpServlet {

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

        Vacina g = RepositorioVacina.getCurrentInstance().read(id);

        request.setAttribute("vacina", g);

        getServletContext().getRequestDispatcher("/vacinas.jsp").forward(request, response);
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
        String nome = request.getParameter("nome");
        String fabricante = request.getParameter("fabricante");
        String tempoEntreAplicacoes = request.getParameter("tempoEntreAplicacoes");
        int quantidadeAplicacoes = Integer.parseInt(request.getParameter("quantidadeAplicacoes"));

        String a = request.getParameter("atualizar");

        Vacina v = new Vacina();
        v.setId(id);
        v.setFabricante(fabricante);
        v.setNome(nome);
        v.setQuantidadeAplicacoes(quantidadeAplicacoes);
        v.setTempoEntreAplicacoes(tempoEntreAplicacoes);



        HttpSession session = request.getSession();

        if (a == null) {
            RepositorioVacina.getCurrentInstance().insert(v);

            session.setAttribute("msg", "vacina " + v.getNome() + " foi cadastrada.");

        } else {
            RepositorioVacina.getCurrentInstance().update(v);
            session.setAttribute("msg", "vacina " + v.getNome() + " foi atualizada.");
        }
        response.sendRedirect("vacinas.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doDelete(request, response); //To change body of generated methods, choose Tools | Templates.
        int id = Integer.parseInt(request.getParameter("id"));

        Vacina v = RepositorioVacina.getCurrentInstance().read(id);
        RepositorioVacina.getCurrentInstance().delete(v);

        HttpSession session = request.getSession();

        session.setAttribute("msg", "A vacina " + v.getNome() + " foi deletada");

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
