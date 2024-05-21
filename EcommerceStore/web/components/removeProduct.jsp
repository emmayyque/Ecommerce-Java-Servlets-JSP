<h1><%=request.getParameter("option")%></h1>

<table>
    <thead>
        <tr>
            <th>Item</th>
            <th>Item Name</th>
            <th>Item Price</th>
            <th>Item Category</th>
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

                String qry = "SELECT * FROM items WHERE item_status='active'";

                ResultSet rs = st.executeQuery(qry);
                while(rs.next()){
                %>
                <tr>
                    <td><div id="removeItemImage"><img src="<%=rs.getString("item_img_name")%>" alt=""></div></td>
                    <td><%=rs.getString("item_name")%> <%=rs.getString("item_sub_name")%></td>
                    <td><%=rs.getString("item_price")%></td>
                    <td><%=rs.getString("item_cat")%></td>
                    <td><a href="removeProduct?item_id=<%=rs.getInt("item_id")%>"><i class="fa fa-close" id="remove"></i></a></td>
                </tr>
                <% }
            } catch (Exception e) {
                out.print("Error: "+e);
            }
        %>
    </tbody>
</table>