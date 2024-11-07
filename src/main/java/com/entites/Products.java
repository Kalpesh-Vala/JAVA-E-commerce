/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entites;

import java.math.BigDecimal;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author kalpesh
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Products{
    public int productId;
    public String productName;
    public BigDecimal price;
    public String description;
    public String size;
    public String color;
    public int stock;
    public Integer categoryId; 
    public Timestamp createdAt;
    public Timestamp updatedAt;
    private String imageUrl;
}