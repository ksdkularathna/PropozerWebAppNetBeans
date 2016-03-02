/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import com.hib.mappings.Userlogin;
import com.hib.mappings.Usertypes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "signup_1", urlPatterns = {"/signup_1"})
public class signup_1 extends HttpServlet {

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
       // try {
            HibSession sess = new HibSession();
            String username = request.getParameter("username");
            Query q = sess.session.createQuery("from Userlogin where userName='" + username + "'");

            Userlogin signinuser = (Userlogin) q.uniqueResult();

            if (signinuser == null) {

                //String pro_pic = request.getParameter("pro_pic");
                Userlogin newuser = new Userlogin();
                newuser.setUserName(username);
                String password = request.getParameter("password");
                PWDEncrypt obj = new PWDEncrypt();
                newuser.setPassword(obj.md5(password));
                
                sess.session.save(newuser);

                Query q3 = sess.session.createQuery("from Usertypes where typeId=1");
                Usertypes utype = (Usertypes) q3.uniqueResult();

                User user = new User();

                //user.setFbEmail(request.getParameter("fb_email"));
                //user.setFbProfile(request.getParameter("fb_profile"));
                user.setUserlogin(newuser);
                user.setUsertypes(utype);
                /*if (pro_pic != null) {
                 user.setPropicture(pro_pic.getBytes());
                 }*/
                user.setEmail(username);
                user.setActivateStatus(Boolean.FALSE);
                user.setDate(new Date().toLocaleString());
                //user.setCaste("email verified"); // remove this when verification adding
                sess.session.save(user);
                sess.transaction.commit();
                //response.sendRedirect("index.jsp?newuser=" + username + "&err=Signup Successful. Please login");               
                //sendingin the verification email
                verifyEmail email=new verifyEmail(username,obj.md5(password).substring(0, 5));
                email.start();
                
                //RequestDispatcher view = request.getRequestDispatcher("Validation.jsp?newuser=" + username+"&err=");
                //view.forward(request, response);
                response.sendRedirect("Validation.jsp?newuser=" + username);
                sess.session.close();

            } else {
                sess.transaction.commit();
                response.sendRedirect("signup_1.jsp?err=Account exists for this email. Please choose another");
                //RequestDispatcher view = request.getRequestDispatcher("signup_1.jsp?err=Account exists for this email. Please choose another");
                //view.forward(request, response);
                sess.session.close();

            }

       // } catch (Exception e) {
         //   e.printStackTrace();
        //}
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
