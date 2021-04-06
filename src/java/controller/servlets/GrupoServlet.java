/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlets;

import br.recife.edu.ifpe.model.classes.Grupo;
import br.recife.edu.ifpe.model.repositorios.RepositorioGrupo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "GrupoServlet", urlPatterns = {"/GrupoServlet"})
public class GrupoServlet extends HttpServlet {

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

        Grupo g = RepositorioGrupo.getCurrentInstance().read(id);

        request.setAttribute("grupo", g);

        getServletContext().getRequestDispatcher("/grupos.jsp").forward(request, response);

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
        String denominacao = request.getParameter("denominacao");
        int idadeMinima = Integer.parseInt(request.getParameter("idadeMinima"));
        int idadeMaxima = Integer.parseInt(request.getParameter("idadeMaxima"));

        String a = request.getParameter("atualizar");

        Grupo g = new Grupo();
        g.setDenominacao(denominacao);
        g.setId(id);
        g.setIdadeMaxima(idadeMaxima);
        g.setIdadeMinima(idadeMinima);

        HttpSession session = request.getSession();

        if (a == null) {
            RepositorioGrupo.getCurrentInstance().insert(g);

            session.setAttribute("msg", "grupo " + g.getDenominacao() + " foi cadastrado.");

        } else {
            RepositorioGrupo.getCurrentInstance().update(g);
            session.setAttribute("msg", "grupo " + g.getDenominacao() + " foi atualizado.");
        }
        response.sendRedirect("grupos.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doDelete(request, response); //To change body of generated methods, choose Tools | Templates.
        int id = Integer.parseInt(request.getParameter("id"));

        Grupo f = RepositorioGrupo.getCurrentInstance().read(id);
        RepositorioGrupo.getCurrentInstance().delete(f);

        HttpSession session = request.getSession();

        session.setAttribute("msg", "O grupo " + f.getDenominacao() + " foi deletado");

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
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
