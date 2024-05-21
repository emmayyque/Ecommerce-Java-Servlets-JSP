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
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.FileOutputStream;
import java.io.InputStream;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
        
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {       
        PrintWriter pw = resp.getWriter();
        
        ServletContext context = getServletContext();
        String webAppPath = context.getRealPath("/");

        String name = req.getParameter("name");
        String subName = req.getParameter("subName");
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        String category = req.getParameter("category");
        
        Part file = req.getPart("imageFile");
        
        String imageFileName = file.getSubmittedFileName();
        
        String uploadPath = webAppPath + "imgs/categories/" + category + "/" + imageFileName;
        String dbImgPath = "imgs/categories/" + category + "/"+ imageFileName;
        
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            
            byte[] data  = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            pw.println("Error: " + e);
        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
            String dbUser = "root";
            String dbPass = "";
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "INSERT INTO items (item_img_name, item_name, item_sub_name, item_description, item_price, item_cat, item_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, dbImgPath);
            ps.setString(2, name);
            ps.setString(3, subName);
            ps.setString(4, description);
            ps.setString(5, price);
            ps.setString(6, category);
            ps.setString(7, "active");
            
            int res = ps.executeUpdate();
            if (res > 0) {
                resp.setContentType("text/html");
                pw.println("<script type=\"text/javascript\">"); 
                pw.println("alert('Your Order is Confirmed!!!\nThanks for Shopping !!');"); 
                pw.println("location='index.jsp';"); 
                pw.println("</script>"); 
                RequestDispatcher rd = req.getRequestDispatcher("adminPanel.jsp?option=Add New Product");
                rd.include(req, resp);
            }
        } catch (SQLException ex) {
            pw.println("Error in SQL" + ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error: Class Not Found" + ex);
        }
        
    }
}
