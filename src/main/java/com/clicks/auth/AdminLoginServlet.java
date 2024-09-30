
package com.clicks.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // This method will handle the admin login POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Get the admin username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Database connection details (change these to match your setup)
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root"; // Replace with your MySQL username
        String dbPassword = "Molemo.10"; // Replace with your MySQL password

        try {
            // 3. Load and register the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 4. Create a connection to the database
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            // 5. SQL query to verify the admin username and password
            String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
            
            // 6. Create a PreparedStatement to prevent SQL injection
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            
            // 7. Execute the query
            ResultSet resultSet = statement.executeQuery();
            
            // 8. Check if the admin exists
            if (resultSet.next()) {
                // 9. If valid, create a session and redirect to admin dashboard
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", username);
                response.sendRedirect("adminDashboard.jsp"); // You will need to create this page
            } else {
                // 10. If invalid, send an error message back to the admin login page
                request.setAttribute("errorMessage", "Invalid Admin Username or Password!");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
            
            // 11. Close the connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
