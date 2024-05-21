<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%--<%@ page import = "pages.DBConnection" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce Store | Home Page</title>


    <!-- Link to Style Sheet -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body id="body">
    <%@include file="components/header.jsp"%>
    <main>       
        <section id="mainBanner">
            <div id="categories">               
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/ecomm";
                        String username = "root";
                        String password = "";
                                               
                        Connection con = DriverManager.getConnection(url, username, password);
                        Statement st = con.createStatement();
                        
                        String qry = "SELECT * FROM categories";
                        ResultSet rs = st.executeQuery(qry);
                        // int i = 0;
                        while(rs.next()) {
                            %>
                            <div id="catCard">
                                <h2><%=rs.getString("cat_name")%></h2>
                                <img src="<%=rs.getString("cat_img_name")%>" alt="">
                                <%String cat_name = rs.getString("cat_name");%>
                                <a href="category.jsp?cat_name=<%=cat_name%>">Click to view more</a>               
                            </div>
                            <%
                        }
                    } catch (Exception e) {
                        out.println("Error at: "+e);
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