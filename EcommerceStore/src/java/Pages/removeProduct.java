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
import java.io.FileOutputStream;
import java.io.InputStream;

import java.sql.*;

@WebServlet("/removeProduct")
public class removeProduct extends HttpServlet {
        
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        PrintWriter pw = resp.getWriter();
        
        int item_id = Integer.parseInt(req.getParameter("item_id"));
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "UPDATE items SET item_status='deactive' WHERE item_id="+item_id;
            Statement st = con.createStatement();
            int res = st.executeUpdate(qry);
            if (res > 0) {
                resp.setContentType("text/html");
                pw.println("<script type=\"text/javascript\">"); 
                pw.println("alert('Your Product is Removed!!!');"); 
                pw.println("</script>"); 
                RequestDispatcher rd = req.getRequestDispatcher("adminPanel.jsp?option=Remove Existing Product");
                rd.include(req, resp);                
            }
            
            
        } catch (SQLException ex) {
            pw.println("Error in SQL" + ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error: Class Not Found" + ex);
        }
        
    }
}
