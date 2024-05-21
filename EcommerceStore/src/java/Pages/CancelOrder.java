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


@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
        
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {            
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String order_id = req.getParameter("order_id");
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nOrder Id "+order_id);
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "UPDATE ordertbl SET order_status='Cancelled' WHERE order_id="+order_id;
            Statement st = con.createStatement();
            int res = st.executeUpdate(qry);
            if (res > 0) {
                RequestDispatcher rd = req.getRequestDispatcher("myOrders.jsp");
                rd.forward(req, resp);
            }
//            ResultSet rs = st.executeQuery(qry);
//            while (rs.next()) {
//                counter++;
//                item_names = item_names + (String) rs.getString("name") + "<br>";
//                total = total + Integer.parseInt(rs.getString("price"));
//                item_img_loc = (String) rs.getString("img_loc");
//            }
            
            
                    
        } catch (Exception e) {
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nError "+e);
        }
    }
}
