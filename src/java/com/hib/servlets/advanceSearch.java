/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.HibernateUtil;
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
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sampath Dhananjaya
 */
@WebServlet(name = "advanceSearch", urlPatterns = {"/advanceSearch"})
public class advanceSearch extends HttpServlet {

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

        String gender = request.getParameter("gender");
        String height_from = request.getParameter("height_from");
        String height_to = request.getParameter("height_to");
        String age_from = request.getParameter("age_from");
        String age_to = request.getParameter("age_to");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String m_status = request.getParameter("m_status");
        String religion = request.getParameter("religion");
        //String caste = request.getParameter("caste");
        String m_tongue = request.getParameter("m_tongue");
        String edu_level = request.getParameter("edu_level");
        User user = (User) request.getSession().getAttribute("loguser");

        HibSession hib = new HibSession();
        User search_fields = new User();

        search_fields.setGender(gender);
        search_fields.setYourself(height_from); //optionally stored the value in this variable
        search_fields.setBackground(height_to); //optionally stored the value in this variable
        search_fields.setFname(age_from);       //optionally stored the value in this variable
        search_fields.setLname(age_to);         //optionally stored the value in this variable
        search_fields.setCountry(country);
        search_fields.setCity(city);
        search_fields.setMaritalStatus(m_status);
        search_fields.setReligion(religion);
        //search_fields.setCaste(caste);
        search_fields.setMothertongue(m_tongue);
        search_fields.setEducationLevel(edu_level);
        
        String hquery = "from User where gender='" + gender + "' ";
        
        if(user!=null){
            hquery += "AND iduser!='"+user.getIduser()+"' ";
        }
        if ((!height_from.equals("Any")) && (!height_to.equals("Any"))) {
            hquery += "AND height>='" + height_from + "' AND height<='" + height_to + "' ";
        }
        if ((height_from.equals("Any")) && (!height_to.equals("Any"))) {
            hquery += "AND height<='" + height_to + "' ";
        }
        if ((!height_from.equals("Any")) && (height_to.equals("Any"))) {
            hquery += "AND height>='" + height_from + "' ";
        }
        if ((!age_from.equals("Any")) && (!age_to.equals("Any"))) {
            hquery += "AND age>='" + age_from + "' AND age<='" + age_to + "' ";
        }
        if ((age_from.equals("Any")) && (!age_to.equals("Any"))) {
            hquery += "AND age<='" + age_to + "' ";
        }
        if ((!age_from.equals("Any")) && (age_to.equals("Any"))) {
            hquery += "AND age>='" + age_from + "' ";
        }
        if (!country.equals("Any")) {
            hquery += "AND country='" + country + "' ";
        }
        if (!city.equals("Any")) {
            hquery += "AND city='" + city + "' ";
        }
        if (!m_status.equals("Any")) {
            hquery += "AND maritalStatus='" + m_status + "' ";
        }
        if (!religion.equals("Any")) {
            hquery += "AND religion='" + religion + "' ";
        }
        
        if (!m_tongue.equals("Any")) {
            hquery += "AND mothertongue='" + m_tongue + "' ";
        }
        if (!edu_level.equals("Any")) {
            hquery += "AND educationLevel='" + edu_level + "' ";
        }
        hquery +="AND activateStatus='1' order by iduser desc";

        Query q1 = hib.session.createQuery(hquery);
        List<User> list = q1.list();
        // hib.session.save(search_fields);
        request.getSession().setAttribute("search_fields", search_fields);
        request.getSession().setAttribute("list", list);
        response.sendRedirect("searchResults.jsp");
        hib.session.close();

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
