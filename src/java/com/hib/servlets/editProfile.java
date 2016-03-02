/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "editProfile", urlPatterns = {"/editProfile"})
public class editProfile extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            HibSession hib = new HibSession();
            String user_id = request.getParameter("user_id");
            
            if (user_id != null) {

                Query q = hib.session.createQuery("from User where iduser='" + user_id + "'");
                User user = (User) q.uniqueResult();
                String user_name_id;
                user.setFname(request.getParameter("fname"));
               //user.setLname(request.getParameter("lname"));
               //user.setWorkplace(request.getParameter("workplace"));
                user.setEmail(request.getParameter("email"));
                //user.setCountry(request.getParameter("country"));
                user.setCity(request.getParameter("city"));
                user.setGender(request.getParameter("gender"));
                user.setHeight(BigDecimal.valueOf(Double.parseDouble(request.getParameter("height"))));
                user.setAge(Integer.parseInt(request.getParameter("age")));
                //user.setMaritalStatus(request.getParameter("m_status"));
                user.setReligion(request.getParameter("religion"));
               //user.setCaste(request.getParameter("caste"));
                user.setMothertongue(request.getParameter("m_tongue"));
                user.setProfession(request.getParameter("profession"));
                user.setWorkplace(request.getParameter("workplace"));
                user.setIncome(request.getParameter("income"));
                user.setEducationLevel(request.getParameter("edu_level"));
                user.setYourself(request.getParameter("yourself"));
                user.setBackground(request.getParameter("background"));
                user.setEducationStatus(request.getParameter("edu_status"));
                //user.setWealth(request.getParameter("wealth"));
                user.setExpectations(request.getParameter("expectation"));                

                if (request.getParameter("gender").equals("Male")) {
                    user_name_id = "P" + (user.getIduser() + 1000) + "M";
                } else {
                    user_name_id = "P" + (user.getIduser() + 1000) + "F";
                }
                
                user.setUserNameId(user_name_id);
                hib.session.save(user);
                hib.transaction.commit();
                request.getSession().setAttribute("loguser", user);
                response.sendRedirect("member.jsp");

            } else {
                hib.transaction.commit();
                response.sendRedirect("login.jsp?msg=Something went wrong please login ");

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
