/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entites.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kalpesh
 */
public class ProductsDao {

    private Connection conn;
    
    public ProductsDao(Connection conn){
        super();
        this.conn = conn;
    }
    
    
    public List<Products> getProducts() {
        List<Products> productList = new ArrayList<>();
        String query = "SELECT p.*, pi.image_url FROM Products p " + "LEFT JOIN Product_Images pi ON p.product_id = pi.product_id";

        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Products product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setDescription(rs.getString("description"));
                product.setSize(rs.getString("size"));
                product.setColor(rs.getString("color"));
                product.setStock(rs.getInt("stock"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setCreatedAt(rs.getTimestamp("created_at"));
                product.setUpdatedAt(rs.getTimestamp("updated_at"));
                product.setImageUrl(rs.getString("image_url")); 
                
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions as appropriate
        }

        return productList;
    }
    
    
     // Modified method to accept a custom query
    public List<Products> getProducts(String query) {
        List<Products> productList = new ArrayList<>();

        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Products product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setDescription(rs.getString("description"));
                product.setSize(rs.getString("size"));
                product.setColor(rs.getString("color"));
                product.setStock(rs.getInt("stock"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setCreatedAt(rs.getTimestamp("created_at"));
                product.setUpdatedAt(rs.getTimestamp("updated_at"));
                product.setImageUrl(rs.getString("image_url"));

                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions as appropriate
        }

        return productList;
    }
}
