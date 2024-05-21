<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>

    <!-- Link to Style Sheet -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="body">
    <%@include file="components/header.jsp"%>
    <main>       
        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("user.jsp");
            }
        %>
        <section id="orders">
            <div id="headOrders">
                <h2><span>My Orders</span></h2>
            </div>
            <div id="ordersList">
                <table>
                    <thead>
                        <tr>
                            <th>Item Picture</th>
                            <th>Item Names</th>
                            <th>Total Bill</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                String username = (String) session.getAttribute("username");
                                Class.forName("com.mysql.jdbc.Driver");
                                String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
                                String dbUser = "root";
                                String dbPass = "";

                                Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                                Statement st = con.createStatement();

                                String qry = "SELECT * FROM ordertbl WHERE username='"+username+"'";
                                ResultSet rs = st.executeQuery(qry);                              
                                
                                if (!rs.next()) { %> 
                                    <tr>
                                        <td colspan="4" id="msg">You've no orders yet !!</td>
                                    </tr>
                                        
                                <% } else { %>
                                    <tr class="border">
                                        <td><div id="orderItemImage"><img src="<%=rs.getString("item_img_loc")%>" alt=""></div></td>
                                        <td><%=rs.getString("item_names")%></td>
                                        <td><%=rs.getString("total_bill")%> PKR</td>
                                        <td><%=rs.getString("order_status")%></td>
                                        <td>
                                            <%
                                                if (rs.getString("order_status").equals("Confirmed - In Transit")) {
                                                %>  
                                                    <a href="CancelOrder?order_id=<%=rs.getInt("order_id")%>">
                                                        <i class="fa fa-close" id="remove"></i>
                                                    </a>
                                                <% } else if (rs.getString("order_status").equals("Delivered")) { %>
                                                    <i class="fa fa-check" id="check"></i>
                                                <% }
                                            %>
                                        </td>
                                    </tr>
                                <%
                                while(rs.next()) {
                                    %>
                                    <tr class="border">
                                        <td><div id="orderItemImage"><img src="<%=rs.getString("item_img_loc")%>" alt=""></div></td>
                                        <td><%=rs.getString("item_names")%></td>
                                        <td><%=rs.getString("total_bill")%> PKR</td>
                                        <td><%=rs.getString("order_status")%></td>
                                        <td>
                                            <%
                                                if (rs.getString("order_status").equals("Confirmed - In Transit")) {
                                                %>  
                                                    <a href="CancelOrder?order_id=<%=rs.getInt("order_id")%>">
                                                        <i class="fa fa-close" id="remove"></i>
                                                    </a>
                                                <% } else if (rs.getString("order_status").equals("Delivered")) { %>
                                                    <i class="fa fa-check" id="check"></i>
                                                <% }
                                            %>
                                        </td>
                                    </tr>
                                <% } // Closing of While Loop
                                }
                                } catch (Exception e) {
                                    out.println("Error at: "+e);
                                }
                        %>
                    </tbody>
                </table>
            </div>
        </section>
        <%@include file="components/sidebar.jsp"%>
        <%@include file="components/cart.jsp"%>
    </main>
    <script src="js/script.js"></script>
</body>
</html>