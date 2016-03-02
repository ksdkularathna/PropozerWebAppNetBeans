/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "searchByID", urlPatterns = {"/searchByID"})
public class searchByID extends HttpServlet {

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
        try {
            String user_id = request.getParameter("username_id").toUpperCase();
            User user = (User) request.getSession().getAttribute("loguser");
            HibSession hib = new HibSession();
            User search_fields = new User();
            search_fields.setGender("Any");
            search_fields.setYourself("Any"); //optionally stored the value in this variable
            search_fields.setBackground("Any"); //optionally stored the value in this variable
            search_fields.setFname("Any");       //optionally stored the value in this variable
            search_fields.setLname("Any");         //optionally stored the value in this variable
            search_fields.setCountry("Any");
            search_fields.setCity("Any");
            search_fields.setMaritalStatus("Any");
            search_fields.setReligion("Any");
            search_fields.setMothertongue("Any");
            search_fields.setEducationLevel("Any");

            String hquery = "from User where userNameId='" + user_id + "' ";

            if (user != null) {
                hquery += "AND iduser!='" + user.getIduser() + "' ";
            }
            Query q1 = hib.session.createQuery(hquery);
            List<User> list = q1.list();
            // hib.session.save(search_fields);
            request.getSession().setAttribute("search_fields", search_fields);
            request.getSession().setAttribute("list", list);
            response.sendRedirect("searchResults.jsp");
            hib.session.close();

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
