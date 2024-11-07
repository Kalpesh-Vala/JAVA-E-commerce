<%-- 
    Document   : dashBoard
    Created on : Oct 20, 2024, 10:22:14 AM
    Author     : kalpesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clothing Store</title>
        <link href="./assets/css/dashBoard.css" rel="stylesheet">
        <style>


            /* Top panel adjustments */
            .card {
                margin: 0; /* Reset margins for better spacing */
            }

            /* Media queries for responsive laout */
            @media (max-width: 768px) {
                .col-sm-6 {
                    flex: 0 0 50%; /* Two products in one row on small screens */
                    max-width: 50%;
                }

                /* Adjust the top panel for smaller screens */
                .card-body h5 {
                    font-size: 1.2rem; /* Slightly smaller font for filter options */
                }
            }

            /* Additional customizations can be added here */
            /* Ensure category images and buttons have the same height */
            .category-image {
                height: 100px; /* Set the height */
                width: 100px; /* Set the width for a circular shape */
                object-fit: cover;
                display: block;
                margin: 0 auto;
            }

            .category-button {
                height: 50px; /* Adjust as needed to match the height you want */
                margin-top: 10px;
                display: block;
                width: 100%;
                font-size: 1rem;
            }


        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        
        <!-- Carousel Section -->
        <div id="carouselExampleIndicators" class="carousel slide custom-container" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./assets/img/img1.jpg" class="d-block w-100" alt="Sale Banner 1">
                </div>
                <div class="carousel-item">
                    <img src="./assets/img/img2.jpg" class="d-block w-100" alt="Sale Banner 2">
                </div>
                <div class="carousel-item">
                    <img src="./assets/img/img3.jpg" class="d-block w-100" alt="Sale Banner 3">
                </div>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Categories Section -->
        <div class="container-fluid custom-container mt-5">
            <h3>Categories</h3>
            <div class="row text-center">
                <div class="col-6 col-md-3">
                    <img src="https://via.placeholder.com/400x400?text=Men+Category" class="category-image rounded-circle" alt="Men">
                    <!-- Redirect to 'shopping.jsp' with 'category=men' parameter -->
                    <a href="shopping.jsp?category=men">
                        <button class="btn btn-secondary w-100 category-button">Men</button>
                    </a>
                </div>
                <div class="col-6 col-md-3">
                    <img src="https://via.placeholder.com/400x400?text=Women+Category" class="category-image rounded-circle" alt="Women">
                    <!-- Redirect to 'shopping.jsp' with 'category=women' parameter -->
                    <a href="shopping.jsp?category=women">
                        <button class="btn btn-secondary w-100 category-button">Women</button>
                    </a>
                </div>
                <div class="col-6 col-md-3 mt-3 mt-md-0">
                    <img src="https://via.placeholder.com/400x400?text=Boys+Category" class="category-image rounded-circle" alt="Boys">
                    <a href="shopping.jsp?category=boys">
                        <button class="btn btn-secondary w-100 category-button">Boys</button>
                    </a>
                </div>
                <div class="col-6 col-md-3 mt-3 mt-md-0">
                    <img src="https://via.placeholder.com/400x400?text=Girls+Category" class="category-image rounded-circle" alt="Girls">
                    <a href="shopping.jsp?category=girls">
                        <button class="btn btn-secondary w-100 category-button">Girls</button>
                    </a>
                </div>
            </div>
        </div>



        <!-- Recommendations Section -->
        <div class="container-fluid custom-container mt-5">
            <h3>Recommendation (Showing 20 Random Products)</h3>
            <div class="row">
                <c:forEach var="product" items="${sessionScope.limitedProductList}">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4">
                        <div class="card">
                            <img src="${product.imageUrl}" class="card-img-top" alt="${product.productName}">
                            <div class="card-body">
                                <h5 class="card-title">${product.productName}</h5>
                                <p class="card-text">
                                    Price: $${product.price}<br>
                                    ${product.description}
                                </p>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i> <!-- Example Rating -->
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
          
        <!-- See All Link -->
        <div class="row">
            <div class="col-12 text-center">
                <a href="shopping.jsp" class="btn btn-primary">See All Products</a>
            </div>
        </div>
          
        <%@ include file="footer.jsp" %>

        <!-- Bootstrap JS -->
    </body>
</html>
