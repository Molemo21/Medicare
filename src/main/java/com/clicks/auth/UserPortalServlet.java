package com.clicks.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/userPortalServlet")
public class UserPortalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Medicine> medicines = new ArrayList<>();

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root";
        String dbPassword = "Molemo.10";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Fetch enabled medicines
            String sql = "SELECT * FROM medicines WHERE status = 'enabled'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Medicine medicine = new Medicine(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getBigDecimal("price"),
                    rs.getString("description"),
                    rs.getString("offer"),
                    rs.getString("seller")
                );
                medicines.add(medicine);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Debugging print to verify the medicines list
        System.out.println("Medicines List: " + medicines);

        // Forward the list to the userPortal.jsp
        request.setAttribute("medicines", medicines);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userPortal.jsp");
        dispatcher.forward(request, response);
    }
}
