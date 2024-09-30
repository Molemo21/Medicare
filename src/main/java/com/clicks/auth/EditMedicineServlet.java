
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

@WebServlet("/editMedicineServlet")
public class EditMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String seller = request.getParameter("seller");
        String description = request.getParameter("description");
        String offer = request.getParameter("offer");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ClicksDB";
        String dbUser = "root";
        String dbPassword = "Molemo.10";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "UPDATE medicines SET name=?, price=?, seller=?, description=?, offer=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, seller);
            ps.setString(4, description);
            ps.setString(5, offer);
            ps.setString(6, id);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
