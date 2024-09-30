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

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root"; // Replace with your MySQL username
        String dbPassword = "Molemo.10"; // Replace with your MySQL password
        
        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            // Query to check username and password
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet resultSet = statement.executeQuery();
            
            // If user exists, redirect to the user portal
            if (resultSet.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("userPortal.jsp");
            } else {
                // If login fails, redirect back with error message
                request.setAttribute("errorMessage", "Invalid Username or Password!");
                request.getRequestDispatcher("userLogin.jsp").forward(request, response);
            }
            
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
