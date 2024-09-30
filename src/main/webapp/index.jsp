<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicare</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <h1>MedicareApp</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="about.jsp">About</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <button class="btn-login" onclick="window.location.href='userLogin.jsp'">User Login</button>
                <button class="btn-login" onclick="window.location.href='admin.jsp'">Admin Login</button>
            </div>
        </div>
    </header>

    <section class="search-section">
        <div class="container">
            <h2>Find Your Medicines</h2>
            <input type="text" class="search-box" placeholder="Search for medicines..." />
            <button class="btn-search">Search</button>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; MedicareApp. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
