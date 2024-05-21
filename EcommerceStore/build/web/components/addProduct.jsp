<h1><%=request.getParameter("option")%></h1>

<form action="addProduct" method="POST" id="addProdForm" enctype="multipart/form-data">
    <label for="name">Name</label>
    <input type="text" name="name" required>
    <label for="subName">Sub Name</label>
    <input type="text" name="subName" required>
    <label for="description">Description</label>
    <!--<input type="text" name="description" required>-->
    <textarea name="description" rows="4" cols="50" required></textarea>
    <label for="price">Price</label>
    <input type="text" name="price" required>
    <select name="category">
        <option value="Select Category">Select Category</option>
        <option value="Electronics">Electronics</option>
        <option value="Fashion Wear">Fashion Wear</option>
        <option value="Bags">Bags</option>
        <option value="Stationary">Stationary</option>
    </select>
    <label for="imageFile">Add Image</label>
    <input type="file" name="imageFile" required>
    <input type="submit" name="addBtn" value="Add Product" required>
</form>