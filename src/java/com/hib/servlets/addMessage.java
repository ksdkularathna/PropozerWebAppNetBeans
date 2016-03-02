/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.Chatmessages;
import com.hib.mappings.User;
import com.hib.mappings.Userthreads;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Boolean.FALSE;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Sampath Dhananjaya
 */
@WebServlet(name = "addMessage", urlPatterns = {"/addMessage"})
public class addMessage extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String sender_id = request.getParameter("user_id");
        String receiver_id = null;
        String thread_id = request.getParameter("thread_id");
        String msg = request.getParameter("msg");

        if (sender_id != null && thread_id != null) {
            HibSession hib = new HibSession();
            Query q1 = hib.session.createQuery("from Userthreads where iduserThreads='" + thread_id + "'");
            Userthreads thread = (Userthreads) q1.uniqueResult();
            if (sender_id.equals(thread.getUserByUser1().getIduser().toString())) {
                receiver_id = thread.getUserByUser2().getIduser().toString();
            } else {
                receiver_id = thread.getUserByUser1().getIduser().toString();
            }
            Chatmessages message=new Chatmessages();
            User sender=(User) hib.session.load(User.class, Integer.parseInt(sender_id));
            User receiver=(User) hib.session.load(User.class, Integer.parseInt(receiver_id));
            Userthreads chat_thread=(Userthreads) hib.session.load(Userthreads.class, Integer.parseInt(thread_id));
            message.setUserByMsgFrom(sender);
            message.setUserByMsgTo(receiver);
            message.setMessage(msg);
            message.setDate(new Date().toLocaleString());
            message.setSeen(false);
            message.setUserthreads(chat_thread);
            hib.session.save(message);
            hib.transaction.commit();
            hib.session.close();
            
 
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
