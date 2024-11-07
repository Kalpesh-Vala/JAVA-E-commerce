/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sqldb;

import java.sql.*;
/**
 *
 * @author kalpesh
 */
public class dbConn {
    private static Connection conn;
    
    public static Connection connect() {
        try {
            if (conn == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentAj", "root", "Howareyou&143");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
