<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Men Category - Static Page</title>
    <link href="./assets/css/shopping.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <!-- Category Bar -->
    <div class="bg-secondary py-2">
        <div class="container d-flex justify-content-center">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Men</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Women</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Baby & Kids</a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="container-fluid">
        <div class="row mt-4">
            <!-- Filter Sidebar -->
<div class="col-md-3">
    <div class="border bg-light p-3">
        <h5 style="font-size: 1.25rem;">Filters</h5>
        <button class="btn btn-sm btn-link text-decoration-none p-0">Clear All</button>
        <hr>
        
        <!-- Categories Filter -->
        <div class="mb-3">
            <h6>
                <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#collapseCategories" role="button" aria-expanded="true" aria-controls="collapseCategories" style="font-size: 1rem;">
                    Categories
                </a>
            </h6>
            <div class="collapse show" id="collapseCategories">
                <div><input type="checkbox"> Men</div>
                <div><input type="checkbox"> Women</div>
                <div><input type="checkbox"> Kids</div>
            </div>
        </div>
        
        <!-- Color Filter -->
        <div class="mb-3">
            <h6>
                <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#collapseColor" role="button" aria-expanded="false" aria-controls="collapseColor" style="font-size: 1rem;">
                    Color
                </a>
            </h6>
            <div class="collapse" id="collapseColor">
                <div><input type="checkbox"> Black</div>
                <div><input type="checkbox"> White</div>
                <div><input type="checkbox"> Blue</div>
                <div><input type="checkbox"> Green</div>
                <div><input type="checkbox"> Pink</div>
            </div>
        </div>
        
        <!-- Size Filter -->
        <div class="mb-3">
            <h6>
                <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#collapseSize" role="button" aria-expanded="false" aria-controls="collapseSize" style="font-size: 1rem;">
                    Size
                </a>
            </h6>
            <div class="collapse" id="collapseSize">
                <div><input type="checkbox"> XS</div>
                <div><input type="checkbox"> S</div>
                <div><input type="checkbox"> M</div>
                <div><input type="checkbox"> L</div>
                <div><input type="checkbox"> XL</div>
                <div><input type="checkbox"> XXL</div>
            </div>
        </div>
        
        <!-- Price Filter -->
        <div class="mb-3">
            <h6>
                <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#collapsePrice" role="button" aria-expanded="false" aria-controls="collapsePrice" style="font-size: 1rem;">
                    Price
                </a>
            </h6>
            <div class="collapse" id="collapsePrice">
                <div><input type="checkbox"> Under $50</div>
                <div><input type="checkbox"> $50 - $100</div>
                <div><input type="checkbox"> $100 - $200</div>
                <div><input type="checkbox"> $200 - $500</div>
            </div>
        </div>
        
        <!-- Rating Filter -->
        <div class="mb-3">
            <h6>
                <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#collapseRating" role="button" aria-expanded="false" aria-controls="collapseRating" style="font-size: 1rem;">
                    Rating
                </a>
            </h6>
            <div class="collapse" id="collapseRating">
                <div><input type="checkbox"> 4 Stars & Up</div>
                <div><input type="checkbox"> 3 Stars & Up</div>
                <div><input type="checkbox"> 2 Stars & Up</div>
            </div>
        </div>
    </div>
</div>

            <!-- Product Grid -->
            <div class="col-md-9">
                <div class="row">
                    <c:forEach var="product" items="${sessionScope.productList}">
                        <div class="col-md-3 mb-4"> <!-- Changed from col-md-4 to col-md-3 -->
                            <div class="card h-100">
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

        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>
