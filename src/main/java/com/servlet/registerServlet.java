/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.CustomerDao;
import com.entites.Customer;
import com.sqldb.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLIntegrityConstraintViolationException;
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
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

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
        
        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
//        User usr = new User();
//        usr.setUsername(uname);
//        usr.setEmail(email);
//        usr.setPassword(pass);

        Customer customer = new Customer();
        customer.setUsername(uname);
        customer.setEmail(email);
        customer.setPassword(pass);
                
//        userDao udao = new userDao(dbConn.connect());

        CustomerDao customDao = new CustomerDao(dbConn.connect());
        
        try{
//            boolean b = udao.userRegistration(usr);
                boolean b = customDao.userRegistration(customer);
            
            if(b){
                HttpSession session = request.getSession();
                session.setAttribute("msg_registerd", "Successfully Registered...");
                response.sendRedirect("register.jsp");
            }
            else{
                HttpSession session = request.getSession();
                session.setAttribute("msg_error", "User registration failed.");
                response.sendRedirect("register.jsp");
            }
        }catch(SQLIntegrityConstraintViolationException e){
            // Handle duplicate entry for username or email
            HttpSession session = request.getSession();
            session.setAttribute("msg_error", "Username or email already exists.");
            response.sendRedirect("register.jsp");
        }catch(Exception e){
            HttpSession session = request.getSession();
            session.setAttribute("msg_error", "Something went wrong on the server...");
            response.sendRedirect("register.jsp");
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
