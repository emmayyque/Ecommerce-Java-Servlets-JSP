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


@WebServlet("/Login")
public class Login extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            String lgUsername = req.getParameter("lgUsername");
            String lgPassword = req.getParameter("lgPassword");

            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "SELECT * FROM users WHERE username='"+lgUsername+"' AND pass='"+lgPassword+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qry);
            
//            pw.print("In Func");
            if (rs.next()) {   
                HttpSession hs = req.getSession();
                hs.setAttribute("username", lgUsername);
                hs.setAttribute("role", rs.getString("role"));
                
                if (rs.getString("role").equals("admin")) {
                    RequestDispatcher rd = req.getRequestDispatcher("adminPanel.jsp");
                    rd.forward(req, resp);
                } else if (rs.getString("role").equals("user")) {
                    RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    rd.forward(req, resp);
                } 
            } else {
                PrintWriter pw = resp.getWriter();
                pw.print("<script type=\"text/javascript\">");
                pw.print("alert('Incorrect Username or Password')");
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
