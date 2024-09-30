<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>MedicareApp Admin Dashboard</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="logoutServlet">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="dashboard-container">
        <h2>Welcome, Admin!</h2>
        <p>Here you can manage the application.</p>

        <!-- Medicines Management Section -->
        <div class="medicines-management">
            <h3>Manage Medicines</h3>
            <a href="addMedicine.jsp">Add New Medicine</a>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Seller</th>
                        <th>Description</th>
                        <th>Offer</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            // Database connection
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ClicksDB", "root", "Molemo.10");

                            // Fetch medicines
                            String query = "SELECT * FROM medicines";
                            ps = conn.prepareStatement(query);
                            rs = ps.executeQuery();

                            // Loop through the result set and display each medicine
                            while (rs.next()) {
                                String medicineId = rs.getString("id");
                                String medicineName = rs.getString("name");
                                String medicinePrice = rs.getString("price");
                                String medicineSeller = rs.getString("seller");
                                String medicineDescription = rs.getString("description");
                                String medicineOffer = rs.getString("offer");
                                String medicineStatus = rs.getString("status");
                    %>
                    <tr>
                        <td><%= medicineName %></td>
                        <td><%= medicinePrice %></td>
                        <td><%= medicineSeller %></td>
                        <td><%= medicineDescription %></td>
                        <td><%= medicineOffer %></td>
                        <td><%= medicineStatus %></td>
                        <td>
                            <a href="editMedicine.jsp?id=<%= medicineId %>">Edit</a> |
                            <a href="enableDisableMedicineServlet?id=<%= medicineId %>&status=<%= medicineStatus %>">
                                <%= (medicineStatus.equals("enabled")) ? "Disable" : "Enable" %>
                            </a> |
                            <a href="deleteMedicineServlet?id=<%= medicineId %>" onclick="return confirm('Are you sure you want to delete this medicine?')">Remove</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Ensure resources are closed
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 MedicareApp. All rights reserved.</p>
    </footer>
</body>
</html>
