<%@ page import="java.util.ArrayList" %>
<%@ page import="com.clicks.auth.Medicine" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Portal</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <h1>MedicareApp</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </header>

        <h1>Welcome to the Medicine Shop</h1>

        <!-- Search Bar -->
        <div class="search-container">
            <form action="searchServlet" method="get">
                <input type="text" name="searchQuery" placeholder="Search for medicines..." required>
                <button type="submit" class="btn-search">Search</button>
            </form>
        </div>

        <!-- Filter and Sorting Options -->
        <div class="filter-sort-container">
            <form action="filterServlet" method="get">
                <label for="category">Filter by Category:</label>
                <select name="category">
                    <option value="all">All</option>
                    <option value="pain-relief">Pain Relief</option>
                    <option value="cold-flu">Cold & Flu</option>
                    <option value="vitamins">Vitamins & Supplements</option>
                    <!-- Add more categories as needed -->
                </select>

                <label for="sort">Sort by:</label>
                <select name="sort">
                    <option value="price-asc">Price: Low to High</option>
                    <option value="price-desc">Price: High to Low</option>
                    <option value="popularity">Popularity</option>
                </select>

                <button type="submit" class="btn-filter">Apply Filters</button>
            </form>
        </div>

        <!-- Product Display Area -->
     <div class="product-list">
    <%
        ArrayList<Medicine> medicines = (ArrayList<Medicine>) request.getAttribute("medicines");
        if (medicines != null && !medicines.isEmpty()) {
            for (Medicine medicine : medicines) {
    %>
                <div class="product">
                    <h2><%= medicine.getName() %></h2>
                    <p><%= medicine.getDescription() %></p>
                    <p>Price: <%= medicine.getPrice() %></p>
                    <button>Add to Cart</button>
                </div>
    <%
            }
        } else {
    %>
        <p>No medicines available at the moment.</p>
    <%
        }
    %>
</div>
     
    </div>

    <footer>
        <p>&copy; 2024 MedicareApp. All rights reserved.</p>
    </footer>
</body>
</html>
