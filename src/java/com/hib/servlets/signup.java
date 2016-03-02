/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.HibernateUtil;
import com.hib.mappings.User;
import com.hib.mappings.Usergrantprivileges;
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
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sampath Dhananjaya
 */
@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class signup extends HttpServlet {

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

        try {
            HibSession sess = new HibSession();
            String username = request.getParameter("username");
            Query q = sess.session.createQuery("from Userlogin where userName='" + username + "'");
            Query q2 = sess.session.createQuery("from User where fbProfile='" + request.getParameter("fb_profile") + "'");

            User fb_account = (User) q2.uniqueResult();
            Userlogin signinuser = (Userlogin) q.uniqueResult();

            if (fb_account == null) {

                if (signinuser == null) {

                    String pro_pic = request.getParameter("pro_pic");
                    Userlogin newuser = new Userlogin();
                    newuser.setUserName(username);
                    String password = request.getParameter("password");
                    PWDEncrypt obj = new PWDEncrypt();
                    newuser.setPassword(obj.md5(password));
                    sess.session.save(newuser);

                    Query q3 = sess.session.createQuery("from Usertypes where typeId=1");
                    Usertypes utype = (Usertypes) q3.uniqueResult();

                    User user = new User();

                    user.setFbEmail(request.getParameter("fb_email"));
                    user.setFbProfile(request.getParameter("fb_profile"));
                    user.setCaste("fb verified");
                    user.setUserlogin(newuser);
                    user.setUsertypes(utype);
                    user.setActivateStatus(Boolean.FALSE);
                    user.setDate(new Date().toLocaleString());
                    if (pro_pic != null) {
                        user.setPropicture(pro_pic.getBytes());
                    }
                    sess.session.save(user);
                    sess.transaction.commit();
                    //response.sendRedirect("index.jsp?newuser=" + username + "&err=Signup Successful. Please login");
                    RequestDispatcher view = request.getRequestDispatcher("index.jsp?newuser=" + username + "&err=Signup Successful. Please login");
                    view.forward(request, response);
                    sess.session.close();

                } else {
                    sess.transaction.commit();
                    //response.sendRedirect("signup.jsp?err=User name exist please choose another");
                    RequestDispatcher view = request.getRequestDispatcher("signup.jsp?err=User name exist please choose another");
                    view.forward(request, response);
                    sess.session.close();

                }

            } else {
                sess.transaction.commit();
                //response.sendRedirect("signup.jsp?err=This FB profile already has an account ");
                RequestDispatcher view = request.getRequestDispatcher("signup.jsp?err=This FB profile already has an account");
                view.forward(request, response);
                sess.session.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
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
