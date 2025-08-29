<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .container { max-width: 500px; margin-top: 50px; background: #fff; border-radius: 10px; box-shadow: 0 1px 3px rgba(0,0,0,0.08);}
    </style>
</head>
<body>
<div class="container p-4">
    <h2 class="mb-4 text-center text-primary">Add Book</h2>
    <form method="post" action="addBook" modelAttribute="book">
        <div class="mb-3">
            <label for="name" class="form-label">Book Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="author" class="form-label">Author</label>
            <input type="text" class="form-control" id="author" name="author" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        <div class="d-grid">
            <input type="submit" value="Save Book" class="btn btn-success" />
        </div>
    </form>
    <div class="mt-3 text-center">
        <a href="/library/display" class="btn btn-outline-secondary btn-sm">&larr; Back to Library</a>
    </div>
</div>
</body>
</html>
