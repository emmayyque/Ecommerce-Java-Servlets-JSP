<section id="cartBar">
    <% 
        int total = 0;
        int dc = 2000;
        int counter = 0;
    %>
    <div id="cartBarHeading">
        <i class="fa fa-close" id="cart_close_btn"></i>
        <h2>Product Cart</h2>
    </div>
    <div id="cartBarBody">
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
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
                                                
                        String qry = "SELECT name, img_loc, price, quantity FROM cart WHERE username='"+username+"' AND status='active'";
                        ResultSet rs = st.executeQuery(qry);
                        
                        if (!rs.next()) {
                            %>
                            <tr>
                                <td colspan="4">There is no items in your cart list</td>
                            </tr>
                        <% } else { 
                                out.println("Helo");
                                counter++;
                                session.setAttribute("cartNum", counter);
                            %>
                            <tr class="border">
                                <td><div id="cartItemImage"><img src="<%=rs.getString("img_loc")%>" alt=""></div></td>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("price")%></td>
                                <td><%=rs.getString("quantity")%></td>
                                <td><a href="delItemC?item_name=<%=rs.getString("name")%>&username=<%=username%>"><i class="fa fa-close" id="delItem"></i></a></td>
                            </tr>
                            <%
                                int quantity = Integer.parseInt(rs.getString("quantity"));
                                int price = Integer.parseInt(rs.getString("price"));
                                total = total + (quantity * price);
                            while(rs.next()) {
                                    counter++;
                                    
                                %>
                                    <tr class="border">
                                        <td><div id="cartItemImage"><img src="<%=rs.getString("img_loc")%>" alt=""></div></td>
                                        <td><%=rs.getString("name")%></td>
                                        <td><%=rs.getString("price")%></td>
                                        <td><%=rs.getString("quantity")%></td>
                                        <td><a href="delItemC?item_name=<%=rs.getString("name")%>&username=<%=username%>"><i class="fa fa-close" id="delItem"></i></a></td>
                                    </tr>
                                <%
                                    session.setAttribute("cartNum", counter);
                                    quantity = Integer.parseInt(rs.getString("quantity"));
                                    price = Integer.parseInt(rs.getString("price"));
                                    total = total + (Integer.parseInt(rs.getString("price")) * Integer.parseInt(rs.getString("quantity")));
                            } // Closing of While Loop
                        }                        
                        } catch (Exception e) {
                            out.println("Error at: "+e);
                        }
                %>
            </tbody>
        </table>
        <div id="orderSummary">
            <h4>Order Summary: <span><%=total%> PKR</span></h4>
            <h4>Delivery Cost: <span><%
                        if (total == 0) {
                            dc = 0;
                        }
                        out.print(dc);
                    %> PKR</span></h4>
            <h4>Total Amount: <span><%
                        int totalBill = total + dc;
                        out.print(totalBill);
                    %> PKR</span></h4>
                    <button><a href="ConfirmOrder?username=<%=(String) session.getAttribute("username")%>">Confirm Order</a></button>
        </div>
    </div>
    <div id="cartBarBottom">
        
    </div>
</section>