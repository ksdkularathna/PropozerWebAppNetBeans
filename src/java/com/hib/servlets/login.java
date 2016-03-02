/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.HibernateUtil;
import com.hib.mappings.User;
import com.hib.mappings.Userlogin;
import com.hib.mappings.Userrequests;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sampath Dhananjaya
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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

        String pwd = request.getParameter("password");
        String username = request.getParameter("username");
        PWDEncrypt obj = new PWDEncrypt();
        pwd = obj.md5(pwd);
        HibSession hsess = new HibSession();

        if (username != null && pwd != null) {
            Query q1 = hsess.session.createQuery("from Userlogin where userName='" + username + "'");
            Userlogin user = (Userlogin) q1.uniqueResult();

            if (user != null) {
                if (pwd.equals(user.getPassword())) {
                    Query q2 = hsess.session.createQuery("from User where userlogin='" + user.getLoginId() + "'");
                    User loguser = (User) q2.uniqueResult();
                    if (loguser.getCaste() == null) {
                        response.sendRedirect("Validation.jsp?newuser=" + user.getUserName());
                    } else if (loguser.getFname() != null) {
                        request.getSession().setAttribute("loguser", loguser);
                        response.sendRedirect("member.jsp");
                    } else if (loguser.getFbProfile() == null) {
                        request.getSession().setAttribute("loguser", loguser);
                        response.sendRedirect("createProfile_1.jsp");
                    } else {
                        request.getSession().setAttribute("loguser", loguser);
                        response.sendRedirect("createProfile.jsp");
                    }
                }
                hsess.transaction.commit();
            } else {
                //response.sendRedirect("index.jsp?err=Invalid Password!");
                hsess.transaction.commit();
                RequestDispatcher view = request.getRequestDispatcher("index.jsp?err=Invalid Password!");
                view.forward(request, response);
            }
        } else {
            hsess.transaction.commit();
            RequestDispatcher view = request.getRequestDispatcher("index.jsp?err=Invalid User Name!");
            view.forward(request, response);
            //response.sendRedirect("index.jsp?err=Invalid User Name!");

        }
    

    hsess.session.close ();

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
