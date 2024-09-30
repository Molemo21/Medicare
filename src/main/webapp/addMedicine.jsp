<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Medicine</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>MedicareApp Admin</h1>
        </div>
    </header>

    <div class="form-container">
        <h2>Add New Medicine</h2>
        <form action="${pageContext.request.contextPath}/addMedicineServlet" method="post">
        
            <div class="form-group">
                <label for="name">Medicine Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="seller">Seller:</label>
                <input type="text" id="seller" name="seller" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="offer">Offer (optional):</label>
                <input type="text" id="offer" name="offer">
            </div>
            <button type="submit">Add Medicine</button>
        </form>
    </div>
</body>
</html>
