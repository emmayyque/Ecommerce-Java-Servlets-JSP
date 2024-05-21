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


@WebServlet("/delItemC")
public class delItemC extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String username = req.getParameter("username");
            String itemName = req.getParameter("item_name");
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "UPDATE cart SET status='deactive' WHERE username='"+username+"' AND name='"+itemName+"'";
            Statement st = con.createStatement();
            int res = st.executeUpdate(qry);
            if (res > 0) {
                resp.setContentType("text/html");
                RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                rd.include(req, resp);
            }          
        } catch (Exception e) {
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nError "+e);
        }
    }
}
