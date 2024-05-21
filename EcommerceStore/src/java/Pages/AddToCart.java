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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
        
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String item_id = req.getParameter("itemID");
            String username = req.getParameter("username");            
            String prodName = req.getParameter("prodName");
            String img_loc = req.getParameter("img_loc");
            String price = req.getParameter("price");
            String quantity = req.getParameter("quantity");
            
            if (!username.equals("null")) {
                Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                String qry = "INSERT INTO cart (username, name, img_loc, price, quantity, status) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(qry);
                ps.setString(1, username);
                ps.setString(2, prodName);
                ps.setString(3, img_loc);
                ps.setString(4, price);
                ps.setString(5, quantity);
                ps.setString(6, "active");

                int res = ps.executeUpdate();
                if (res > 0) {
                    if ((req.getParameter("direction") != null) && (req.getParameter("cat_name") != null)) {
                        RequestDispatcher rd = req.getRequestDispatcher("category.jsp?cat_name="+req.getParameter("cat_name"));
                        rd.forward(req, resp);
                    } else {
                        RequestDispatcher rd = req.getRequestDispatcher("product.jsp?item_id="+item_id);
                        rd.forward(req, resp);
                    }
                     
                }
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("user.jsp");
                rd.forward(req, resp);
            }                        
        } catch (Exception e) {
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nError "+e);
        }
    }
}
