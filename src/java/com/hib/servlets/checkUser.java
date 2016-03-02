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
@WebServlet(name = "checkUser", urlPatterns = {"/checkUser"})
public class checkUser extends HttpServlet {

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
        String input_name = request.getParameter("input_name");
        if (input_name != null) {
            HibSession hib = new HibSession();
            Query q1 = hib.session.createQuery("from Userlogin where userName='" + input_name + "'");
            Query q2 = hib.session.createQuery("from User where fbProfile='" + input_name + "'");
            Userlogin ul = (Userlogin) q1.uniqueResult();
            User fb_ul = (User) q2.uniqueResult();
            if (ul == null && fb_ul == null) {
                out.write("fail");
            } else if(ul==null&&fb_ul!=null) {
                PasswordReset thread=new PasswordReset(fb_ul.getUserlogin().getUserName(),fb_ul.getUserlogin().getPassword(),fb_ul.getEmail());              
                thread.start();
                out.write("ok");
            } else if(ul!=null&&fb_ul==null) {
                Query q3 = hib.session.createQuery("from User where userlogin='" + ul.getLoginId() + "'");
                User user=(User) q3.uniqueResult();
                PasswordReset thread=new PasswordReset(ul.getUserName(),ul.getPassword(),user.getEmail());
                thread.start();
                out.write("ok");
            }else{
                PasswordReset thread=new PasswordReset(fb_ul.getUserlogin().getUserName(),fb_ul.getUserlogin().getPassword(),fb_ul.getEmail());              
                thread.start();
                out.write("ok");
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
