<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function validateForm(event) {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;
            
            if (password !== confirmPassword) {
                event.preventDefault(); // Prevent form submission
                alert("Passwords do not match. Please try again."); // Alert user
            }
        }
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <h1>MedicareApp</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <div class="register-container container">
        <h2>Create an Account</h2>
        <form action="${pageContext.request.contextPath}/registerServlet" method="post" class="register-form" onsubmit="validateForm(event)">
        
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required placeholder="Enter your username">
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required placeholder="Enter your email">
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required placeholder="Create a password">
    </div>
    <div class="form-group">
        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm-password" name="confirm-password" required placeholder="Confirm your password">
    </div>
    <button type="submit" class="btn-register">Register</button>
</form>
        
        <div class="login-redirect">
            <p>Already have an account? <a href="userLogin.jsp">Login here</a></p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 MedicareApp. All rights reserved.</p>
    </footer>
</body>
</html>

