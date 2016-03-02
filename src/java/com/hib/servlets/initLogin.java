/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import com.hib.mappings.Userlogin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "initLogin", urlPatterns = {"/initLogin"})
public class initLogin extends HttpServlet {

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
        String pwd = request.getParameter("key");
        String username = request.getParameter("username");
        HibSession hsess = new HibSession();

        if (username != null) {
            Query q1 = hsess.session.createQuery("from Userlogin where userName='" + username + "'");
            Userlogin user = (Userlogin) q1.uniqueResult();

            if (user != null && pwd != null) {
                if (pwd.equals(user.getPassword().substring(0, 5))) {
                    Query q2 = hsess.session.createQuery("from User where userlogin='" + user.getLoginId() + "'");
                    User loguser = (User) q2.uniqueResult();
                    request.getSession().setAttribute("loguser", loguser);
                    loguser.setCaste("email verified");
                    hsess.session.save(loguser);
                    hsess.transaction.commit();
                    
                    if (loguser.getFbProfile() == null) {
                        response.sendRedirect("createProfile_1.jsp");
                    } else if (loguser.getFname() == null) {
                        response.sendRedirect("createProfile.jsp");
                    } else {
                        response.sendRedirect("member.jsp");
                    }
                    
                } else {

                    hsess.transaction.commit();
                    RequestDispatcher view = request.getRequestDispatcher("Validation.jsp?err=Invalid keycode!&newuser="+username);
                    view.forward(request, response);
                }
            } else {
                RequestDispatcher view = request.getRequestDispatcher("Validation.jsp?err=Invalid User Name!&newuser="+username);
                view.forward(request, response);
                hsess.transaction.commit();
                
            }
        }
        hsess.session.close();
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
