/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import com.hib.mappings.Userrequests;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "addProposal", urlPatterns = {"/addProposal"})
public class addProposal extends HttpServlet {

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

        HibSession hib = new HibSession();
        String proposal_id = request.getParameter("proposal_id");
        String user_id = request.getParameter("user_id");

        Query q1 = hib.session.createQuery("from Userrequests where userId='" + request.getParameter("proposal_id") + "' AND user='" + request.getParameter("user_id") + "'");
        Userrequests existingproposal = (Userrequests) q1.uniqueResult();

        if (user_id.equals(proposal_id)) {
            response.getWriter().write("This is your proposal");
        } else if (existingproposal == null) {
            Userrequests addproposal = new Userrequests();
            addproposal.setUserId(Integer.parseInt(request.getParameter("proposal_id")));
            User proposal = (User) hib.session.load(User.class, Integer.parseInt(request.getParameter("user_id")));
            addproposal.setUser(proposal);
            addproposal.setTime(new Date().toLocaleString());
            addproposal.setAcceptance(false);
            addproposal.setSeen(false);
            addproposal.setReceiverVisibility(false);
            hib.session.save(addproposal);
            hib.transaction.commit();

            Query q2 = hib.session.createQuery("from User where iduser='" + user_id + "'");
            Query q3 = hib.session.createQuery("from User where iduser='" + proposal_id + "'");

            User sender = (User) q2.uniqueResult();
            User receiver = (User) q3.uniqueResult();

            String sender_id = sender.getUserNameId();           
            String receiver_email = receiver.getEmail();
            String sender_name = receiver.getFname();

            if (sender_id != null && receiver_email != null) {
                proposeEmail email=new proposeEmail(sender_id, receiver_email, sender_name);
                email.start();
            }

            response.getWriter().write("rrt kj");

        } else {
            response.getWriter().write("You already proposed to this person");

        }

        hib.session.close();

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
