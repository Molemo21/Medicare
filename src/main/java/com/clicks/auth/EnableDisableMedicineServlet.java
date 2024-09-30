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

@WebServlet("/enableDisableMedicineServlet")
public class EnableDisableMedicineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        // Toggle the status
        String newStatus = status.equals("enabled") ? "disabled" : "enabled";

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root";
        String dbPassword = "Molemo.10";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "UPDATE medicines SET status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setString(2, id);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
