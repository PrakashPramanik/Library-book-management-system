<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome | Book Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.home-container {
	max-width: 800px;
	background: #fff;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
	padding: 50px;
	text-align: center;
	animation: fadeInUp 1s ease-in-out;
}

.home-container h1 {
	font-weight: 700;
	color: #2575fc;
}

.home-container h3 {
	font-weight: 600;
	color: #28a745;
}

.btn-explore {
	background: #2575fc;
	color: #fff;
	font-size: 1.2rem;
	font-weight: 600;
	padding: 12px 28px;
	border-radius: 50px;
	transition: 0.3s;
}

.btn-explore:hover {
	background: #1a5ad9;
	transform: scale(1.08);
}

.icon-circle {
	width: 80px;
	height: 80px;
	background: #2575fc;
	color: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	font-size: 2rem;
	margin: 0 auto 20px;
}

@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<div class="home-container">
		<div class="icon-circle">
			<i class="bi bi-book-half"></i>
		</div>
		<h1 class="mb-3">Welcome to the Book Management System!</h1>
		<h3 class="mb-4">${appName}</h3>
		<p class="lead text-muted">Manage your library’s collection with
			ease, keep track of borrowed books, and organize your favorite titles
			using our simple, modern tools.</p>
		<a href="/library/display" class="btn btn-explore mt-4"> <i
			class="bi bi-arrow-right-circle"></i> Explore Library
		</a>
	</div>
</body>
</html>
