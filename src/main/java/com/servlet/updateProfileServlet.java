/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.CustomerDao;
import com.entites.Customer;
import com.mysql.cj.Session;
import com.sqldb.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kalpesh
 */
@WebServlet(name = "updateProfileServlet", urlPatterns = {"/updateProfileServlet"})
public class updateProfileServlet extends HttpServlet {

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

        HttpSession session = request.getSession();
        Customer loggedInUser = (Customer) session.getAttribute("currentUser");

        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String address = request.getParameter("add");
        String phoneNumber = request.getParameter("phone");
        String gender = request.getParameter("gender"); 
        String dobStr = request.getParameter("dob");

        // Initialize dob as null
        Date dob = null;

        // Validate and parse the date of birth
        if (dobStr != null && !dobStr.isEmpty()) {
            try {
                // Convert the string to java.sql.Date
                dob = Date.valueOf(dobStr);
                //not possible because of frontend formte but we keept here just in case
            } catch (IllegalArgumentException e) {
                System.out.println("Invalid date format: " + dobStr);
                session.setAttribute("msg_error", "Invalid date format for DOB. Please use yyyy-MM-dd.");
                response.sendRedirect("profile.jsp");
                return; 
            }
        }

        // Set fields to null if no input is provided
        loggedInUser.setFirstName(firstName != null && !firstName.isEmpty() ? firstName : null);
        loggedInUser.setLastName(lastName != null && !lastName.isEmpty() ? lastName : null);
        loggedInUser.setAddress(address != null && !address.isEmpty() ? address : null);
        loggedInUser.setGender(gender != null && !gender.isEmpty() ? gender : null);
        loggedInUser.setDateOfBirth(dob);

        // Initialize DAO and attempt to update the profile
        CustomerDao customerDao = new CustomerDao(dbConn.connect());

        try {
            boolean updateSuccess = customerDao.userProfileUpdate(loggedInUser);

            if (updateSuccess) {
                session.setAttribute("msg_updated", "Profile updated successfully!");
                response.sendRedirect("profile.jsp");
            } else {
                session.setAttribute("msg_error", "User Profile update failed.");
                response.sendRedirect("profile.jsp");
            }
        } catch (Exception e) {
            // Handle exceptions and set an error message
            session.setAttribute("msg_error", "Something went wrong on the server: " + e.getMessage());
            response.sendRedirect("profile.jsp");
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
