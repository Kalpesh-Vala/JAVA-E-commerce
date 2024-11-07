<%-- 
    Document   : index
    Created on : Oct 19, 2024, 9:59:28 PM
    Author     : kalpesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page import="sqldb.dbConn, java.sql.Connection" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eCommerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="./assets/css/index.css" rel="stylesheet">
</head>
<body>
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

            <!-- Links (collapsed in mobile view) -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <!-- Login Button -->
                    <li class="nav-item">
                        <a class="btn btn-outline-primary me-2" href="login.jsp">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            
            <%--
            <%
                Connection conn = dbConn.connect();
                out.println(conn);
            %> 
            --%>
                        
            <h1 class="hero-title">New Here?</h1>
            <p class="hero-subtitle">Join us today and explore amazing features!</p>
            <a href="register.jsp" class="btn btn-primary hero-btn">
                <i class="fas fa-user-plus"></i> Register Now
            </a>
            <p class="mt-4">Get started today and enjoy exclusive offers, personalized recommendations, and much more.</p>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"/>

    <!-- Bootstrap JS (for toggling on mobile) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
