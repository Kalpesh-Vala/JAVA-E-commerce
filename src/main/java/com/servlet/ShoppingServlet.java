package com.servlet;

import com.dao.ProductsDao;
import com.entites.Products;
import com.sqldb.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/shopping")
public class ShoppingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get filter parameters
        String[] categories = request.getParameterValues("category");
        String[] colors = request.getParameterValues("color");
        String[] sizes = request.getParameterValues("size");
        String[] prices = request.getParameterValues("price");
        String[] ratings = request.getParameterValues("rating");

        // Construct the SQL query dynamically based on selected filters
        StringBuilder query = new StringBuilder("SELECT p.*, pi.image_url FROM Products p ");
        query.append("LEFT JOIN Product_Images pi ON p.product_id = pi.product_id WHERE 1=1");

        if (categories != null && categories.length > 0) {
            query.append(" AND p.category_id IN (");
            for (int i = 0; i < categories.length; i++) {
                query.append("'").append(categories[i]).append("'");
                if (i < categories.length - 1) query.append(",");
            }
            query.append(")");
        }

        if (colors != null && colors.length > 0) {
            query.append(" AND p.color IN (");
            for (int i = 0; i < colors.length; i++) {
                query.append("'").append(colors[i]).append("'");
                if (i < colors.length - 1) query.append(",");
            }
            query.append(")");
        }

        if (sizes != null && sizes.length > 0) {
            query.append(" AND p.size IN (");
            for (int i = 0; i < sizes.length; i++) {
                query.append("'").append(sizes[i]).append("'");
                if (i < sizes.length - 1) query.append(",");
            }
            query.append(")");
        }

        if (prices != null && prices.length > 0) {
            query.append(" AND p.price BETWEEN ");
            for (String price : prices) {
                // Handle price range parsing here (e.g., 50-100)
                if (price.equals("under_50")) {
                    query.append("0 AND 50");
                }
                // Add more price ranges here
            }
        }

        if (ratings != null && ratings.length > 0) {
            query.append(" AND p.rating >= ");
            for (String rating : ratings) {
                query.append(rating);
            }
        }

        // Execute the query with a database connection and fetch the results
        // Assuming you have an existing connection object "conn"
        ProductsDao productsDao = new ProductsDao(dbConn.connect());
        List<Products> productList = productsDao.getProducts(query.toString());

        // Pass filtered product list to the JSP
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/shopping.jsp").forward(request, response);
    }
}
