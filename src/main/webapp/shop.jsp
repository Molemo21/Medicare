<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop | Clicks Pharmacy</title>
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

    <section class="filter-sort-container">
        <form action="searchProducts" method="GET">
            <div class="form-group">
                <label for="category">Category:</label>
                <select name="category" id="category">
                    <option value="all">All</option>
                    <option value="pain-relief">Pain Relief</option>
                    <option value="cold-flu">Cold & Flu</option>
                    <option value="vitamins">Vitamins & Supplements</option>
                </select>
            </div>

            <div class="form-group">
                <label for="sort">Sort By:</label>
                <select name="sort" id="sort">
                    <option value="price-asc">Price: Low to High</option>
                    <option value="price-desc">Price: High to Low</option>
                    <option value="popularity">Most Popular</option>
                </select>
            </div>

            <button class="btn-filter" type="submit">Apply Filters</button>
        </form>
    </section>

    <section class="product-list">
        <!-- Example product listing, dynamically generated -->
        <div class="product">
            <img src="images/panado.jpg" alt="Panado">
            <h2>Panado 500mg</h2>
            <p>R 4.99</p>
            <button class="btn-add-to-cart">Add to Cart</button>
        </div>
        <!-- More products... -->
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2024 Clicks Pharmacy. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
