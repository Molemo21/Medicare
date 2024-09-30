package com.clicks.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root"; // Replace with your MySQL username
        String dbPassword = "Molemo.10"; // Replace with your MySQL password

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to insert user details
            String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password); // You may want to hash the password
            statement.setString(3, email);

            // Execute the insert statement
            int rowsInserted = statement.executeUpdate();

            // Check if insert was successful
            if (rowsInserted > 0) {
                System.out.println("User registered successfully!");
                // Redirect to login page
                response.sendRedirect("userLogin.jsp");
            } else {
                // If something went wrong, show error message
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("userRegister.jsp").forward(request, response);
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

