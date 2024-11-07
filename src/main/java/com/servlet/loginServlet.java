/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.CustomerDao;
import com.dao.ProductsDao;
import com.entites.Customer;
import com.entites.Products;
import com.sqldb.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
//        userDao ud = new userDao(dbConn.connect());
//        User user = ud.userLogin(email, pass);

        CustomerDao customDao = new CustomerDao(dbConn.connect());
        Customer customer = customDao.userLogin(email, pass);
        
        if(customer!=null){
//            PrintWriter out=response.getWriter();
//            out.println("sucess...");
            
            ProductsDao productdao = new ProductsDao(dbConn.connect());
            List<Products> productList = productdao.getProducts();
            
            // Shuffle and select 20 random products
            Collections.shuffle(productList);
            List<Products> limitedProductList = productList.subList(0, Math.min(10, productList.size()));
           
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", customer);
            session.setAttribute("productList", productList); // Full product list for shopping.jsp
            session.setAttribute("limitedProductList", limitedProductList); // Random 20 for dashBoard.jsp
            
            response.sendRedirect("dashBoard.jsp");
            
        }else{
//            PrintWriter out=response.getWriter();
//            out.println("Failed...");
              HttpSession session = request.getSession(false);
              if (session != null) {
                  session.setAttribute("error-msg", "Email or Password are wrong...");
              }
              response.sendRedirect("login.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
