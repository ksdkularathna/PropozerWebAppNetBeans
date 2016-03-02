/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import com.hib.mappings.Userrequests;
import com.hib.mappings.Userthreads;
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
@WebServlet(name = "acceptProposal", urlPatterns = {"/acceptProposal"})
public class acceptProposal extends HttpServlet {

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
        Boolean acceptance = Boolean.parseBoolean(request.getParameter("acceptance"));
        String user_id = request.getParameter("user_id");
        String proposal_id = request.getParameter("proposal_id");
        if (user_id != null && proposal_id != null) {
            // selecting the proposal from a one end
            Query q1 = hib.session.createQuery("from Userrequests where userId='" + user_id + "' AND user='" + proposal_id + "'");
            Userrequests existingproposal = (Userrequests) q1.uniqueResult();
            if (existingproposal != null) {
                existingproposal.setAcceptance(acceptance);
                hib.session.save(existingproposal);
                // Selecting the proposal at the other end
                Query q2 = hib.session.createQuery("from Userrequests where userId='" + proposal_id + "' AND user='" + user_id + "'");
                Userrequests senderproposal = (Userrequests) q2.uniqueResult();
                if (senderproposal != null) {
                    senderproposal.setAcceptance(true);
                    hib.session.save(senderproposal);
                    //creating the chat thread                    
                    Userthreads chat_thread = new Userthreads();
                    User user1 = (User) hib.session.load(User.class, Integer.parseInt(user_id));
                    User user2 = (User) hib.session.load(User.class, Integer.parseInt(proposal_id));
                    chat_thread.setUserByUser1(user1);//assigning the thread to the two persons
                    chat_thread.setUserByUser2(user2);
                    hib.session.save(chat_thread);
                    
                } else {
                    Userrequests addproposal = new Userrequests();
                    addproposal.setUserId(Integer.parseInt(proposal_id));
                    User proposal = (User) hib.session.load(User.class, Integer.parseInt(user_id));
                    addproposal.setUser(proposal);
                    addproposal.setTime(new Date().toLocaleString());
                    addproposal.setAcceptance(true);
                    addproposal.setSeen(false);
                    addproposal.setReceiverVisibility(false);
                    hib.session.save(addproposal);

                    //creating the chat thread                    
                    Userthreads chat_thread = new Userthreads();
                    User user1 = (User) hib.session.load(User.class, Integer.parseInt(user_id));
                    User user2 = (User) hib.session.load(User.class, Integer.parseInt(proposal_id));
                    chat_thread.setUserByUser1(user1);//assigning the thread to the two persons
                    chat_thread.setUserByUser2(user2);
                    hib.session.save(chat_thread);

                    response.getWriter().write("Proposal Accepted");//Proposal Accepted

                }
                hib.transaction.commit();

            } else {
                response.getWriter().write("e1");//Something went wrong please try again

            }
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
