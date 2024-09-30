<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Clicks Pharmacy</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <h1>Clicks Pharmacy</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="about.jsp">About</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="contact-container">
        <h2>Contact Us</h2>
        <p>If you have any questions or need assistance, feel free to contact us.</p>

        <form action="sendContact" method="POST">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Your Message</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button class="btn-filter" type="submit">Send Message</button>
        </form>

        <div class="map">
            <!-- Google Maps embed -->
            <iframe src="https://maps.google.com/maps?q=Clicks%20Pharmacy&t=&z=13&ie=UTF8&iwloc=&output=embed" width="100%" height="400" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2024 Clicks Pharmacy. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
