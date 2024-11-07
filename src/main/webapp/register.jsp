<%-- 
    Document   : register.jsp
    Created on : Oct 19, 2024, 10:14:00 PM
    Author     : Kalpesh
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Custom styles -->
        <link href="./assets/css/register.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">MyCompany</a>
            </div>
        </nav>

        <!-- Register Form in a Card Layout -->
        <div class="container">
            <div class="card register-card">
                
                <%
                    String reg_msg = (String) session.getAttribute("msg_registerd");
                    String error_msg = (String) session.getAttribute("msg_error");

                    if (reg_msg != null) {
                %>
                    <div class="alert alert-success" role="alert">
                        <%= reg_msg %>
                    </div>
                <%
                        session.removeAttribute("msg_registerd");
                    } else if (error_msg != null) {
                %>
                    <div class="alert alert-danger" role="alert">
                        <%= error_msg %>
                    </div>
                <%
                        session.removeAttribute("msg_error");
                    }
                %>

                
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Register</h3>
                    <!-- Registration Form -->
                    <form action="registerServlet" method="POST" onsubmit="return validateForm()">
                        <!-- Username -->
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="uname" placeholder="Enter your username" required>
                        </div>
                        
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        
                        <!-- Password -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="pass" placeholder="Enter your password" required>
                        </div>
                        
                        <!-- Confirm Password -->
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                            <small id="passwordError" class="text-danger d-none">Passwords do not match</small>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-block">
                                <i class="fas fa-user-plus"></i> Register
                            </button>
                        </div>
                    </form>
                    
                    <!-- Sign In Link -->
                    <div class="text-center mt-4">
                        <p>Already have an account? <a href="login.jsp">Sign in here</a>.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (for responsive features) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var passwordError = document.getElementById("passwordError");

                if (password !== confirmPassword) {
                    passwordError.classList.remove("d-none");
                    return false;
                } else {
                    passwordError.classList.add("d-none");
                    return true;
                }
            }
        </script>
        
    </body>
</html>
