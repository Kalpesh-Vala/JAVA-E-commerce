<%-- 
    Document   : footer
    Created on : Oct 20, 2024, 2:56:41 PM
    Author     : Kalpesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Reduce padding for a smaller height */
    .footer {
        background-color: #343a40;
        color: white;
        padding: 20px 0; /* Reduce padding */
    }

    .footer h3 {
        margin-bottom: 15px; /* Adjust space below headings */
    }

    .footer .form-control {
        margin-bottom: 10px; /* Decrease spacing between form elements */
    }

    .footer p, .footer a {
        color: white;
    }

    /* Adjust margins for a more compact footer */
    .footer .container {
        margin-bottom: 0;
    }

    /* Reduce the size of the separator and copyright area */
    .footer hr {
        margin-top: 20px;
        margin-bottom: 10px;
    }

    .footer p.text-center {
        margin-bottom: 0;
    }
</style>
<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- Feedback Form Section -->
            <div class="col-md-6">
                <h3>Feedback Form</h3>
                <form style="max-width: 400px;"> <!-- Set max-width to reduce form width -->
                    <input type="text" class="form-control mb-2" id="feedbackName" placeholder="Name">
                    <input type="email" class="form-control mb-2" id="feedbackEmail" placeholder="Email">
                    <textarea class="form-control mb-2" id="feedbackMessage" rows="2" placeholder="Message"></textarea>
                    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                </form>
            </div>


            <!-- Sitemap Section -->
            <div class="col-md-3">
                <h3>Sitemap</h3>
                <ul class="list-unstyled">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>

            <!-- Developer Details Section -->
            <div class="col-md-3">
                <h3>Developer Details</h3>
                <p>Kalpesh Vala</p>
                <p>Email: <a href="mailto:kalpeshvala78@gmail.com">kalpeshvala78@gmail.com</a></p>
            </div>
        </div>

        <hr class="text-white">

        <!-- Copyright -->
        <p class="text-center">&copy; 2024 Your Company Name. All Rights Reserved.</p>
    </div>
</footer>