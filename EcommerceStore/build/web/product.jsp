<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce Store | Product</title>


    <!-- Link to Style Sheet -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="body">
    <%@include file="components/header.jsp"%>
    <main>       
        <section id="product">
            <%
                try {
                    int itemID = Integer.parseInt(request.getParameter("item_id"));
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/ecomm";
                    String username = "root";
                    String password = "";

                    Connection con = DriverManager.getConnection(url, username, password);
                    Statement st = con.createStatement();

                    // String item_name = "Apple Watch";
                    String qry = "SELECT item_img_name, item_name, item_sub_name, item_price, item_description FROM items WHERE item_id="+itemID;
                    ResultSet rs = st.executeQuery(qry);
                    while(rs.next()) {
                        %>
                        <div id="productLeft">
                            <img src="<%=rs.getString("item_img_name")%>">
                        </div>
                        <div id="productRight">
                            <% 
                                String prodName = rs.getString("item_name") + " " + rs.getString("item_sub_name"); %><% String name = rs.getString("item_name") + " " + rs.getString("item_sub_name");
                                String img_loc = rs.getString("item_img_name");
                             %>
                            <div>
                                <h2><%=prodName%></h2>
                                <p><%=rs.getString("item_description")%></p>
                                <h3><%=rs.getString("item_price")%> PKR</h3>
                                <form action="AddToCart?username=<%=session.getAttribute("username")%>&prodName=<%=prodName%>&img_loc=<%=img_loc%>&price=<%=rs.getString("item_price")%>&itemID=<%=itemID%>" method="POST">
                                    <p>Quantity: <input type="number" name="quantity" value="1"></p>
                                <button>Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    <% }
                } catch (Exception e) {
                    out.println("Error at: "+e);
                }
            %>
        </section>
        <%@include file="components/sidebar.jsp"%>
        <%@include file="components/cart.jsp"%>
    </main>
    <script src="js/script.js"></script>
</body>
</html>