<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Borrow Book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f9fa;
}

.container {
	max-width: 500px;
	margin-top: 50px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
}
</style>
</head>
<body>
	<div class="container p-4">
		<h2 class="mb-4 text-center text-success">Borrow Book</h2>
		<form method="post" action="/library/borrowBook" modelAttribute="book">
			<input type="hidden" name="id" value="${book.id}" />
			<div class="mb-3">
				<label class="form-label">Book Name</label> <input type="text"
					class="form-control" value="${book.name}" readonly>
			</div>
			<div class="mb-3">
				<label class="form-label">Author</label> <input type="text"
					class="form-control" value="${book.author}" readonly>
			</div>
			<div class="mb-3">
				<label class="form-label">Number of days to borrow</label> <input
					type="number" class="form-control" name="borrowedForDays" min="1"
					required>
			</div>
			<div class="d-grid">
				<input type="submit" value="Borrow" class="btn btn-success" />
			</div>
		</form>
		<div class="mt-3 text-center btn-group">
			<a href="/library/display" class="btn btn-outline-secondary btn-sm">&larr;
				Back to Library</a> <a href="/library/display"
				class="btn btn-outline-primary btn-sm">Display All Books</a>
		</div>
	</div>
</body>
</html>
