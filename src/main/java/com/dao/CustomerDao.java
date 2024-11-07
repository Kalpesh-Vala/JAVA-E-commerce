/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entites.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 *
 * @author kalpesh
 */
public class CustomerDao {
    private Connection conn;
    
    public CustomerDao(Connection conn){
        super();
        this.conn = conn;
    }
    
    public boolean userRegistration(Customer customer) throws SQLIntegrityConstraintViolationException, SQLException{
        boolean b=false;
            
        try{
            String str = "insert into Customer(username, email, password) values(?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(str);
            ps.setString(1, customer.getUsername());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPassword());
            
            int result = ps.executeUpdate();
            if(result>0){
                b=true;
            }
        }catch(SQLIntegrityConstraintViolationException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }
    
    public Customer userLogin(String mail, String pass) throws SQLException{
        Customer customer=null;
        
        try{
            String str="Select * from Customer where email = ? and password = ?";
        
            PreparedStatement ps = conn.prepareStatement(str);

            ps.setString(1, mail);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                customer = new Customer(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("address"),
                    rs.getString("phone_number"),
                    rs.getString("gender"),
                    rs.getDate("dob")
                );
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        
        return customer;
    }
    
    public boolean userProfileUpdate(Customer customer) throws SQLException {
        boolean isUpdated = false;

        try {
            String query = "UPDATE Customer SET first_name = ?, last_name = ?, address = ?, phone_number = ?, gender = ?, dob = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);

            // Set the parameters based on the provided Customer object
            ps.setString(1, customer.getFirstName());
            ps.setString(2, customer.getLastName());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getPhoneNumber());
            ps.setString(5, customer.getGender());
            ps.setDate(6, customer.getDateOfBirth());
            ps.setInt(7, customer.getId()); // Assuming the `id` is the unique identifier for the Customer

            // Execute the update
            int result = ps.executeUpdate();
            if (result > 0) {
                isUpdated = true; // If the update was successful, set the flag to true
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow the exception to handle it in the calling method
        }

        return isUpdated;
    }

}
