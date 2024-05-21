<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce Store | Admin Panel</title>


    <!-- Link to Style Sheet -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <%
        if (request.getParameter("option") != null) {
            if (request.getParameter("option").equals("Remove Product")) { %>
                <style>
                    #panelOpt {
                        height: auto;
                    }
                </style>
            <% } else if (request.getParameter("option").equals("Add New Product")) { %>
                <style>
                    #panelOpt {
                        height: auto;
                    }
                </style>
            <% } 
        }
    %>
</head>
<body id="body">
    <%@include file="components/header.jsp"%>
    <main>
        <section id="adminPanel">
            <nav id="panelOpt">
                <ul>
                    <li><a href="adminPanel.jsp?option=Add New Product">Add New Product</a></li>
                    <li><a href="adminPanel.jsp?option=Remove Product">Remove Product</a></li>
                    <li><a href="adminPanel.jsp?option=Approve Orders">Approve Orders</a></li>
                </ul>
            </nav>
            <div id=funcPages>
                <%
                    String option = request.getParameter("option");
                    if (option != null) {
                        if (option.equals("Add New Product")) { %>
                            <%@include file="components/addProduct.jsp"%>
                        <% } else if (option.equals("Remove Product")) { %> 
                            <%@include file="components/removeProduct.jsp"%>
                        <% } else if (option.equals("Approve Orders")) { %> 
                            <%@include file="components/approveOrder.jsp"%>
                        <% }
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