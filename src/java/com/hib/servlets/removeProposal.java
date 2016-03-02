/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

 import com.hib.mappings.Userrequests;
import com.hib.mappings.Userthreads;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;

/**
 *
 * @author Sampath Dhananjaya
 */
@WebServlet(name = "removeProposal", urlPatterns = {"/removeProposal"})
public class removeProposal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String proposal_id = request.getParameter("proposal_id");
        String user_id = request.getParameter("user_id");
        if (user_id != null && proposal_id != null) {
            HibSession hib = new HibSession();
            Query q1 = hib.session.createQuery("from Userrequests where userId='" + proposal_id + "' AND user='" + user_id + "'");
            Query q2 = hib.session.createQuery("from Userrequests where userId='" + user_id + "' AND user='" + proposal_id + "'");

            Userrequests proposal = (Userrequests) q1.uniqueResult();
            Userrequests accepted_proposal = (Userrequests) q2.uniqueResult();

            if (proposal != null) {
                hib.session.delete(proposal);
                if (accepted_proposal != null) {
                    hib.session.delete(accepted_proposal);
                    
                    Userthreads chat_thread = (Userthreads) hib.session.createQuery("from Userthreads where (userByUser1='" + user_id + "' and userByUser2='" + proposal_id + "') OR (userByUser1='" + proposal_id + "' and userByUser2='" + user_id + "')").uniqueResult();
                    if (chat_thread != null) {
                        hib.session.delete(chat_thread);
                    }
                    
                }
                //response.getWriter().print("Proposal Removed");//Proposal Removed
            } else {
                response.getWriter().write("Proposal already removed");//Proposal already have deleted
            }
            hib.transaction.commit();
            hib.session.close();
        } else {
            response.getWriter().write("Something went wrong. Please try again");//Something went wrong. Please try again
        }

    }

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
        processRequest(request, response);
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
