/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.Userrequests;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "showName", urlPatterns = {"/showName"})
public class showName extends HttpServlet {

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
        String user_id = request.getParameter("user_id");
        String proposal_id = request.getParameter("proposal_id");
        Boolean visibility = Boolean.parseBoolean(request.getParameter("visibility"));
        if (user_id != null && proposal_id != null) {
            HibSession hib = new HibSession();
            Query q1 = hib.session.createQuery("from Userrequests where userId='" + proposal_id + "' AND user='" + user_id + "'");
            Userrequests existingproposal = (Userrequests) q1.uniqueResult();
            if (existingproposal != null) {
                if (visibility) {
                    existingproposal.setReceiverVisibility(true);
                    hib.session.save(existingproposal);
                    hib.transaction.commit();
                    response.getWriter().write("n1");//Now your name is visible to this person
                } else {
                    existingproposal.setReceiverVisibility(false);
                    hib.session.save(existingproposal);
                    hib.transaction.commit();
                    response.getWriter().write("n2");//Now your name is NOT visible to this person
                }
            } else {
                response.getWriter().write("e1");//Something went wrong please try again
            }
            hib.session.close();
        } else {
            response.getWriter().write("e1");//Something went wrong please try again
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
