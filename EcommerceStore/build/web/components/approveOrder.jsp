<h1><%=request.getParameter("option")%></h1>

<table id="approveOrder">
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Username</th>
            <th>Item</th>
            <th>Item Names</th>
            <th>Total Bill</th>
            <th>Approve</th>
        </tr>
    </thead>
    <tbody>
        <%  
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/ecomm";
                String username = "root";
                String password = "";

                Connection con = DriverManager.getConnection(url, username, password);
                Statement st = con.createStatement();
                
                String cat_name = request.getParameter("cat_name");

                String qry = "SELECT * FROM ordertbl WHERE order_status='Confirmed - In Transit'"; 
                ResultSet rs = st.executeQuery(qry);
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("order_id")%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><div id="approveOrderImage"><img src="<%=rs.getString("item_img_loc")%>" alt=""></div></td>
                    <td><%=rs.getString("item_names")%></td>
                    <td><%=rs.getString("total_bill")%></td>
                    <td><a href="approveOrder?order_id=<%=rs.getInt("order_id")%>"><i class="fa fa-check" id="approve"></i></a></td>
                </tr>
                <% }
            } catch (Exception e) {
                out.print("Error: "+e);
            }
        %>
    </tbody>
</table>