<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Library Books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #dceefb, #e9ecef);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	margin-top: 50px;
}

.header-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
}

.header-section h2 {
	font-weight: bold;
	color: #343a40;
}

.search-box {
	width: 280px;
	position: relative;
}

.search-box input {
	border-radius: 50px;
	padding-left: 40px;
}

.search-box i {
	position: absolute;
	top: 50%;
	left: 15px;
	transform: translateY(-50%);
	color: #6c757d;
}

.table th {
	background: #007bff;
	color: #fff;
	text-align: center;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

.badge {
	font-size: 0.9rem;
}

.card-layout {
	background: #fff;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.actions a {
	margin: 2px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card-layout">
			<div class="header-section">
				<h2><i class="fa-solid fa-book-open-reader text-primary"></i> Library Books</h2>
				<div class="search-box">
					<i class="fa fa-search"></i>
					<input type="text" id="searchInput" class="form-control"
						placeholder="Search by name or author...">
				</div>
			</div>

			<p class="msg text-center text-info">${msg}</p>

			<div class="table-responsive">
				<table class="table table-hover table-bordered align-middle shadow-sm"
					id="bookTable">
					<thead class="table-primary">
						<tr>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Status</th>
							<th>Borrowed Date</th>
							<th>Borrowed For (days)</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<td>${book.name}</td>
								<td>${book.author}</td>
								<td>₹${book.price}</td>
								<td>
									<span class="badge 
										<c:if test="${book.status == 'Available'}">bg-success</c:if>
										<c:if test="${book.status == 'Borrowed'}">bg-danger</c:if>">
										${book.status}
									</span>
								</td>
								<td>
									<c:if test="${book.borrowedDate != null}">${book.borrowedDate}</c:if>
									<c:if test="${book.borrowedDate == null}">-</c:if>
								</td>
								<td>${book.borrowedForDays}</td>
								<td class="actions">
									<a href="edit/${book.id}" class="btn btn-sm btn-warning">
										<i class="fa fa-pen"></i> Edit
									</a>
									<a href="delete/${book.id}" class="btn btn-sm btn-danger"
										onclick="return confirm('Are you sure?')">
										<i class="fa fa-trash"></i> Delete
									</a>
									<c:if test="${book.status == 'Available'}">
										<a href="borrowForm/${book.id}" class="btn btn-sm btn-primary">
											<i class="fa fa-handshake"></i> Borrow
										</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="text-center mt-4">
				<a href="/library/addBookForm" class="btn btn-success btn-lg">
					<i class="fa fa-plus"></i> Add New Book
				</a>
			</div>
		</div>
	</div>

	<script>
		// Search filter for Book Name & Author
		document.getElementById("searchInput").addEventListener("keyup", function () {
			let filter = this.value.toLowerCase();
			let rows = document.querySelectorAll("#bookTable tbody tr");

			rows.forEach(row => {
				let name = row.cells[0].textContent.toLowerCase();
				let author = row.cells[1].textContent.toLowerCase();
				if (name.includes(filter) || author.includes(filter)) {
					row.style.display = "";
				} else {
					row.style.display = "none";
				}
			});
		});
	</script>
</body>
</html>
