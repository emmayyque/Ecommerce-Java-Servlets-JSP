/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pages;

/**
 *
 * @author Muhammad Ali Khalil
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String sgName = req.getParameter("sgName");
            String sgUsername = req.getParameter("sgUsername");
            String sgEmail = req.getParameter("sgEmail");
            String sgPassword = req.getParameter("sgPassword");

            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "INSERT INTO users (name, username, email, pass, role) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, sgName);
            ps.setString(2, sgUsername);
            ps.setString(3, sgEmail);
            ps.setString(4, sgPassword);
            ps.setString(5, "user");
            int res = ps.executeUpdate();
            if (res > 0) {
                PrintWriter pw = resp.getWriter();
                pw.print("<script type=\"text/javascript\">");
                pw.print("alert('User Registered Successfully')");
                pw.print("</script>");
                resp.setContentType("text/html");
                
                RequestDispatcher rd = req.getRequestDispatcher("user.jsp");
                rd.include(req, resp);
            } else {
                PrintWriter pw = resp.getWriter();
                pw.print("<script type=\"text/javascript\">");
                pw.print("alert('Error in Registration')");
                pw.print("</script>");
                resp.setContentType("text/html");
                
                RequestDispatcher rd = req.getRequestDispatcher("user.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nError "+e);
        }
    }
}
