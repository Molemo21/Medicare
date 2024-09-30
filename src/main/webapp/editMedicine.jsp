<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Medicine</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>MedicareApp Admin</h1>
        </div>
    </header>

    <div class="form-container">
        <h2>Edit Medicine</h2>
        <%
            // Fetch medicine details from the database using the medicine ID
            String medicineId = request.getParameter("id");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ClicksDB", "root", "Molemo.10");
            String query = "SELECT * FROM medicines WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, medicineId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String price = rs.getString("price");
                String seller = rs.getString("seller");
                String description = rs.getString("description");
                String offer = rs.getString("offer");
        %>
        <form action="${pageContext.request.contextPath}/editMedicineServlet" method="post">
            <input type="hidden" name="id" value="<%= medicineId %>">
            <div class="form-group">
                <label for="name">Medicine Name:</label>
                <input type="text" id="name" name="name" value="<%= name %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" id="price" name="price" value="<%= price %>" required>
            </div>
            <div class="form-group">
                <label for="seller">Seller:</label>
                <input type="text" id="seller" name="seller" value="<%= seller %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required><%= description %></textarea>
            </div>
            <div class="form-group">
                <label for="offer">Offer:</label>
                <input type="text" id="offer" name="offer" value="<%= offer %>">
            </div>
            <button type="submit">Update Medicine</button>
        </form>
        <%
            }
            conn.close();
        %>
    </div>
</body>
</html>
