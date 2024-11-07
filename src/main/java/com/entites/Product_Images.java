/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entites;

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
public class Product_Images {
    public int imageId;
    public Integer productId; // Allow null for product ID
    public String imageUrl;
}
