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
        <section id="search">
            <div id="headSearch">
                <h2><span>Search Results</span></h2>
            </div>
            <div id="searchList">
                <table>
                <%
                    try {
                        String catOpt = request.getParameter("catOpt");
                        String search = request.getParameter("search");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        String dbUrl = "jdbc:mysql://localhost:3306/ecomm";
                        String dbUser = "root";
                        String dbPass = "";

                        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                        Statement st = con.createStatement();
                        
                        String qry = "";
                        
                        if (catOpt.equals("All")) {
                            qry = "SELECT * FROM items WHERE item_name LIKE '%"+search+"%' OR item_sub_name LIKE '%"+search+"%'";
                        } else {
                            qry = "SELECT * FROM items WHERE (item_name LIKE '%"+search+"%' OR item_sub_name LIKE '%"+search+"%') AND item_cat='"+catOpt+"'";
                        }
                        
                        ResultSet rs = st.executeQuery(qry);                              
                        
                        if (!rs.next()) {
                            %>
                            <p id="msg">Sorry there is no item matched with your search</p>
                        <% } else {
                                String item_name = rs.getString("item_name") + " " + rs.getString("item_sub_name");
                            %>
                            <tr class="border">
                                    <td><div id="searchItemImage"><img src="<%=rs.getString("item_img_name")%>" alt=""></div></td>
                                    <td><%=item_name%></td>
                                    <td><%=rs.getString("item_price")%> PKR</td>
                                    <td><a href="product.jsp?item_id=<%=rs.getInt("item_id")%>">Click to view</a></td>
                            </tr>
                            <%
                            while(rs.next()) {
                                %>
                                <tr class="border">
                                    <% String itemName = rs.getString("item_name") + " " + rs.getString("item_sub_name"); %>
                                    <td><div id="searchItemImage"><img src="<%=rs.getString("item_img_name")%>" alt=""></div></td>
                                    <td><%=itemName%></td>
                                    <td><%=rs.getString("item_price")%> PKR</td>
                                    <td><a href="product.jsp?item_id=<%=rs.getInt("item_id")%>">Click to view</a></td>
                                </tr>
                            <% } // Closing of While Loop
                        }
                        } catch (Exception e) {
                            out.println("Error at: "+e);
                        }
                %>
                </table>
            </div>
        </section>
        <%@include file="components/sidebar.jsp"%>
        <%@include file="components/cart.jsp"%>
    </main>
    <script src="js/script.js"></script>
</body>
</html>