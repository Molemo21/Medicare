<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>MedicareApp - Admin</h1>
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
        <h2>Admin Login</h2>
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
        <form action="adminLoginServlet" method="post" class="login-form">
            <div class="form-group">
                <label for="adminUsername">Username:</label>
                <input type="text" id="adminUsername" name="username" required placeholder="Enter your admin username">
            </div>
            <div class="form-group">
                <label for="adminPassword">Password:</label>
                <input type="password" id="adminPassword" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 MedicareApp. All rights reserved.</p>
    </footer>
</body>
</html>
