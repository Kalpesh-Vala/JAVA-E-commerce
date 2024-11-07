<%@ page import="com.entites.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="./assets/css/profile.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="container mt-4">
        <div class="card p-4">

            <%
                String update_msg = (String) session.getAttribute("msg_updated");
                String error_msg = (String) session.getAttribute("msg_error");

                if(update_msg != null) {
            %>
            <div class="alert alert-success" role="alert">
                <%=update_msg %>
            </div>
            <%
                session.removeAttribute("msg_updated");
                } else if(error_msg != null) {
            %>
            <div class="alert alert-danger" role="alert">
                <%=error_msg %>
            </div>
            <%
                session.removeAttribute("msg_error");
                }
            %>

            <div class="row">
                <!-- Profile Image Section -->
                <div class="col-md-4 profile-image-section">
                    <img src="https://img.icons8.com/ios/50/user-male-circle--v1.png" alt="User Profile Image" class="profile-image">
                    <h5 class="mt-3">
                        <%= ((Customer)session.getAttribute("currentUser")).getUsername() != null ? 
                              ((Customer)session.getAttribute("currentUser")).getUsername() : "" %>
                    </h5>
                    <input type="file" class="form-control mt-2" id="profilePic" />
                </div>

                <!-- Profile Details Section -->
                <div class="col-md-8 profile-details-section">
                    <h5>User Profile</h5>
                    <form action="updateProfileServlet" method="POST">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="firstName">First Name</label>
                                <input type="text" class="form-control" name="fname" id="firstName" 
                                       placeholder="First Name"
                                       value="<%= ((Customer)session.getAttribute("currentUser")).getFirstName() != null ? 
                                               ((Customer)session.getAttribute("currentUser")).getFirstName() : "" %>">
                            </div>
                            <div class="col-md-6">
                                <label for="lastName">Last Name</label>
                                <input type="text" class="form-control" name="lname" id="lastName" 
                                       placeholder="Last Name"
                                       value="<%= ((Customer)session.getAttribute("currentUser")).getLastName() != null ? 
                                               ((Customer)session.getAttribute("currentUser")).getLastName() : "" %>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="add" id="address" 
                                   placeholder="Address"
                                   value="<%= ((Customer)session.getAttribute("currentUser")).getAddress() != null ? 
                                           ((Customer)session.getAttribute("currentUser")).getAddress() : "" %>">
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="phone">Phone Number</label>
                                <input type="tel" class="form-control" name="phone" id="phone"
                                       value="<%= ((Customer)session.getAttribute("currentUser")).getPhoneNumber() != null ? 
                                               ((Customer)session.getAttribute("currentUser")).getPhoneNumber() : "" %>">
                            </div>

                            <div class="col-md-4">
                                <label for="gender">Gender</label>
                                <select class="form-control" name="gender" id="gender">
                                    <option value="" <%= ((Customer)session.getAttribute("currentUser")).getGender() == null ? "selected" : "" %>>Choose</option>
                                    <option value="male" <%= "male".equals(((Customer)session.getAttribute("currentUser")).getGender()) ? "selected" : "" %>>Male</option>
                                    <option value="female" <%= "female".equals(((Customer)session.getAttribute("currentUser")).getGender()) ? "selected" : "" %>>Female</option>
                                    <option value="other" <%= "other".equals(((Customer)session.getAttribute("currentUser")).getGender()) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="dob">Date of Birth</label>
                                <input type="date" class="form-control" name="dob" id="dob" 
                                       value="<%= ((Customer)session.getAttribute("currentUser")).getDateOfBirth() != null ? 
                                               ((Customer)session.getAttribute("currentUser")).getDateOfBirth() : "" %>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">Email Id</label>
                            <input type="email" class="form-control" id="email" 
                                   placeholder="Email"
                                   value="<%= ((Customer)session.getAttribute("currentUser")).getEmail() != null ? 
                                           ((Customer)session.getAttribute("currentUser")).getEmail() : "" %>" readonly>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <br>

    <jsp:include page="footer.jsp"/>
</body>
</html>
