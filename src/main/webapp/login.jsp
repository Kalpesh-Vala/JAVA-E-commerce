<%-- 
    Document   : login.jsp
    Created on : Oct 19, 2024, 10:27:53 PM
    Author     : Kalpesh
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Custom styles -->
        <link href="./assets/css/login.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">MyCompany</a>
            </div>
        </nav>

        <!-- Login Form in a Card Layout -->
        <div class="container">
            <div class="card login-card">
                
                <%
                    // Get the error message from the session
                    String error_msg = (String) session.getAttribute("error-msg");
                    if (error_msg != null) {
                %>
                    <div class="alert alert-danger" role="alert">
                        <%= error_msg %> <!-- Fixed the typo here -->
                    </div>
                <%
                        // Remove the error message from the session after displaying
                        session.removeAttribute("error-msg");
                    } 
                %>
                    
                
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Login</h3>
                    <!-- Login Form -->
                    <form action="loginServlet" method="POST">
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        
                        <!-- Password with Show/Hide Icon -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="pass" placeholder="Enter your password" required>
                            </div>
                        </div>
                        
                        <!-- Remember Me Checkbox -->
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-block">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </button>
                        </div>
                    </form>

                    <!-- Sign Up Link -->
                    <div class="text-center mt-4">
                        <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
