<section id="sideBarMenu">
    <div id="profile">
        <%
            if (session.getAttribute("username") != null) { %>
                <h2>Hi, <%=session.getAttribute("username")%></h2>
            <% } else { %>
                <h2>Hi, account</h2>
            <% }
        %>
        
        <i class="fa fa-close" id="close_btn"></i>
    </div>
    <div id="catMenu">
        <h3>Categories</h3>
        <ul>
            <li><a href="category.jsp?cat_name=Electronics">Electronics</a></li>
            <li><a href="category.jsp?cat_name=Fashion Wear">Fashion Wear</a></li>
            <li><a href="category.jsp?cat_name=Bags">Bags</a></li>
            <li><a href="category.jsp?cat_name=Stationary">Stationary</a></li>
        </ul>
    </div>
    <div id="time">
        <p id="timeDate">Hello</p>

        <script>
            const d = new Date();
            var timeDate = document.getElementById("timeDate");
            timeDate.innerText = d;
        </script>
        <p>
    </div>
</section>