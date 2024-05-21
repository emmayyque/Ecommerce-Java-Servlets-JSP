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


@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
    
    int total = 0;
    int dc = 2000;
    int total_bill = 0;
    String item_names = "";
    String item_img_loc = "";
    int counter = 0;
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String username = req.getParameter("username");
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "SELECT * FROM cart WHERE status='active' AND username='"+username+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qry);
            while (rs.next()) {
                counter++;
                item_names = item_names + (String) rs.getString("name") + "<br>";
                total = total + Integer.parseInt(rs.getString("price"));
                item_img_loc = (String) rs.getString("img_loc");
            }
            
            total_bill = total + dc;
            // Confirmed - In Transit
            PrintWriter pw = resp.getWriter();
            qry = "INSERT INTO ordertbl (username, item_img_loc, item_names, total_bill, order_status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(qry);
            if (counter != 1) {
                item_img_loc = "imgs/icons/cartIco.png";
            }
            ps.setString(1, username);
            ps.setString(2, item_img_loc);
            ps.setString(3, item_names);
            ps.setInt(4, total_bill);
            ps.setString(5, "Confirmed - In Transit");
            
            int res = ps.executeUpdate();
            if (res > 0) {
                qry = "UPDATE cart set status='deactive' WHERE username='"+username+"'";
                st = con.createStatement();
                int res2 = st.executeUpdate(qry);
                if (res2 > 0) {
                    HttpSession session = req.getSession();
                    session.setAttribute("cartNum", 0);
                    resp.setContentType("text/html");
                    pw.println("<script type=\"text/javascript\">"); 
                    pw.println("alert('Your Order is Confirmed!!!');"); 
                    pw.println("</script>"); 
                    RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    rd.include(req, resp);
                }
            }
                    
        } catch (Exception e) {
            PrintWriter pw = resp.getWriter();
            pw.print("\n\nError "+e);
        }
    }
}
