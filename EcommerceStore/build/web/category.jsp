<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce Store | Category Items</title>

    <!-- Link to Style Sheet -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="body">
    <%@include file="components/header.jsp"%>
    <main>       
        <section id="mainCat">
            <div id="headCat">
                <h2><span><%=request.getParameter("cat_name")%></span></h2>
            </div>
            <div id="items">
                <%  
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/ecomm";
                        String username = "root";
                        String password = "";

                        Connection con = DriverManager.getConnection(url, username, password);
                        Statement st = con.createStatement();

                        String cat_name = request.getParameter("cat_name");

                        String qry = "SELECT item_id, item_img_name, item_name, item_sub_name, item_price FROM items WHERE item_cat='"+cat_name+"' AND item_status='active'";
                        
                        ResultSet rs = st.executeQuery(qry);
                        while(rs.next()){
                        // Prepare Query String here !!
                        String prodName = rs.getString("item_name") + " " + rs.getString("item_sub_name");
                        String img_loc = rs.getString("item_img_name");
                        String itemID = rs.getString("item_id");
                        %>
                            <div id="card">
                                <div id="cardImg">
                                    <img src="<%=rs.getString("item_img_name")%>" alt="">
                                </div>
                                <h2><%=rs.getString("item_name")%></h2>
                                <h4><%=rs.getString("item_sub_name")%></h4>
                                <h3><%=rs.getString("item_price")%> PKR</h3>
                                <a href="product.jsp?item_id=<%=rs.getString("item_id")%>">Click to view more details</a>
                                <button><a href="AddToCart?username=<%=session.getAttribute("username")%>&prodName=<%=prodName%>&img_loc=<%=img_loc%>&price=<%=rs.getString("item_price")%>&cat_name=<%=cat_name%>&direction='main'&itemID=<%=itemID%>&quantity=1">Add to Cart</a></button>
                            </div>
                        <% }
                    } catch (Exception e) {
                        out.print("Error: "+e);
                    }
                %>
            </div>
            
        </section>
        <%@include file="components/sidebar.jsp"%>
        <%@include file="components/cart.jsp"%>
    </main>
    <script src="js/script.js"></script>
</body>
</html>