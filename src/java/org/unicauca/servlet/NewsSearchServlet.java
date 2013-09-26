/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.unicauca.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.unicauca.client.NewsWebService;
import org.unicauca.client.NewsWebService_Service;

/**
 *
 * @author JuanSebastian
 */
@WebServlet(name = "NewsSearchServlet", urlPatterns = {"/NewsSearchServlet"})
public class NewsSearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nextPage;
        HttpSession session = request.getSession(true);

        if (request.getParameter("SearchNews") != null) {
            try {
                NewsWebService_Service service = new NewsWebService_Service();
                NewsWebService port = service.getNewsWebServicePort();
                List<String> news = port.getNews(request.getParameter("query"));
                session.setAttribute("news", news);
                nextPage = "/result.jsp";
                reSend(request, response, nextPage);
            } catch (Exception ex) {
                Logger.getLogger(NewsSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (request.getParameter("back") != null) {
                nextPage = "index.jsp";
                reSend(request, response, nextPage);
            }
        }
    }

    public void reSend(HttpServletRequest request, HttpServletResponse response, String npage) {
        try {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(npage);
            dispatcher.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(NewsSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(NewsSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
