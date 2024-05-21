<header>
    <nav>
        <div id="logo">
            <a href="index.jsp"><img src="imgs/amazon-logo-white.png"></a> 
        </div>            
        <div id="searchBar">
            <form action="search.jsp" method="POST">
                <select id="catOpt" name="catOpt">
                    <option value="All">All</option>
                    <option value="Electronics">Electronics</option>
                    <option value="Fashion Wear">Fashion Wear</option>
                    <option value="Bags">Bags</option>
                    <option value="Stationary">Stationary</option>
                </select>
                <input type="text" placeholder="Search something here.." name="search">
                <button><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div id="navMenu">
            <div id="language">
                <select>
                    <option value="English">English</option>
                    <option value="Espanol">Espanol</option>
                    <option value="French">French</option>
                    <option value="Chinese">Chinese</option>
                </select>
            </div>
            <div id="account">
                <div>
                    <%
                        if (session.getAttribute("username") != null) { %>
                            <p id="accHeading">Hello, <%=session.getAttribute("username")%></p>
                            <h3><a href="Logout">Logout</a></h3> 
                        <% } else { %>
                            <p id="accHeading">Hello, sign in</p>
                            <h3>Account</h3>
                        <% }
                    %>
                </div>
                
                <%
                    if (session.getAttribute("username") == null) { %>
                        <div id="accPanel">
                            <p>Already a member? Please</p>
                            <a href="user.jsp">Login</a>
                        </div>
                    <% } 
                %>
            </div>
            <div id="myOrders">
                <a href="myOrders.jsp">
                    <p>My</p>
                    <h3>Orders</h3>
                </a> 
            </div>
            <div id="cart">
                <i class="fa fa-shopping-cart" id="cartIco"></i>
                <div id="cartNumber"><h4><%
                            if (session.getAttribute("cartNum") != null) {
                                out.println(session.getAttribute("cartNum"));
                            } else {
                                out.print(0);
                            }   
                        %></h4></div>
                <h3 id="cartHeading">Cart</h3>
            </div>
        </div>
    </nav>
    <nav id="navBelt">
        <ul>
            <li><i class="fa fa-bars" id="menu-btn"></i></li>
            <li><a href="category.jsp?cat_name=Electronics">Electronics</a></li>
            <li><a href="category.jsp?cat_name=Fashion Wear">Fashion Wear</a></li>
            <li><a href="category.jsp?cat_name=Bags">Bags</a></li>
            <li><a href="category.jsp?cat_name=Stationary">Stationary</a></li>
        </ul>
        <%
            if (session.getAttribute("role") != null) { 
                if (session.getAttribute("role").equals("admin")) {  %>
                    <button><a href="adminPanel.jsp">Admin Panel</a></button>
            <% }
            }
        %>
    </nav>
</header>