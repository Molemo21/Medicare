<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="css/style.css">
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

    <div class="login-container container">
        <h2>User Login</h2>
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { 
        %>
        <div class="error-message">
            <p><%= errorMessage %></p>
        </div>
        <% 
            } 
        %>
        <form action="loginServlet" method="post" class="login-form">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        <div class="register-section">
            <p>Don't have an account?</p>
            <button class="btn-register" onclick="window.location.href='userRegister.jsp'">Register Now</button>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 MedicareApp. All rights reserved.</p>
    </footer>
</body>
</html>

