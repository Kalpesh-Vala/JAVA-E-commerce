<%-- 
    Document   : navbar
    Created on : Oct 20, 2024, 10:21:51 AM
    Author     : kalpesh
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <!-- Site Name -->
        <a class="navbar-brand" href="#">
            <i class="fas fa-store"></i> MyWebsite
        </a>

        <!-- Toggle button for mobile view -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links and Search Bar (collapsed in mobile view) -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Centered Search Bar -->
            <form class="d-flex justify-content-center w-50 mx-auto ps-3" action="shopping.jsp" method="get">
                <div class="input-group">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search" name="query">
                    <span class="input-group-text bg-transparent border-0">
                        <i class="fas fa-search"></i> <!-- Search Icon -->
                    </span>
                </div>
            </form>

            <!-- Links to the right of the search bar -->
            <ul class="navbar-nav ms-auto"> <!-- Added margin start (ms-auto) for spacing -->
                <li class="nav-item">
                    <a class="nav-link" href="dashBoard.jsp">
                        <i class="fas fa-home"></i> Home <!-- Home Icon -->
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart <!-- Cart Icon -->
                    </a>
                </li>

                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <!-- If user is logged in, show username and dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user"></i> ${sessionScope.currentUser.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logoutServlet">Logout</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- If user is not logged in, redirect to login page -->
                        <c:redirect url="login.jsp"/>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
