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
@WebServlet(name = "backupLogin", urlPatterns = {"/backupLogin"})
public class backupLogin extends HttpServlet {

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
        String pwd = request.getParameter("keycode");
        String username = request.getParameter("username");
        HibSession hsess = new HibSession();

        if (username != null && pwd != null) {
            Query q1 = hsess.session.createQuery("from Userlogin where userName='" + username + "'");
            Userlogin user = (Userlogin) q1.uniqueResult();

            if (user != null) {
                if (pwd.equals(user.getPassword())) {
                    Query q2 = hsess.session.createQuery("from User where userlogin='" + user.getLoginId() + "'");
                    User loguser = (User) q2.uniqueResult();
                    request.getSession().setAttribute("loguser", loguser);
                    if (loguser.getFname()==null) {
                        response.sendRedirect("createProfile.jsp");
                    } else {                      
                        response.sendRedirect("member.jsp");
                    }
                    hsess.transaction.commit();
                } else {
                    response.sendRedirect("login.jsp?err=Invalid key!");
                    hsess.transaction.commit();
                }
            } else {
                response.sendRedirect("login.jsp?err=Invalid User Name!");
                hsess.transaction.commit();
                hsess.session.close();
            }
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
