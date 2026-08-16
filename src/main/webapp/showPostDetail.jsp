<%@page import="com.Tech.Info.dao.LikeDao"%>
<%@ page import="com.Tech.Info.entites.Posts"%>
<%@ page import="com.Tech.Info.entites.User"%>
<%@ page import="com.Tech.Info.entites.Category"%>
<%@ page import="com.Tech.Info.helper.ConnectionProvider"%>
<%@ page import="com.Tech.Info.dao.PostDao"%>
<%@ page import="com.Tech.Info.dao.UserDao"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User u = (User) session.getAttribute("currentUser");
if(u == null){
	response.sendRedirect("login.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Post Details</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Google Fonts for custom typography -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;500&family=Inter:wght@400;500;600;700&family=Merriweather:ital,wght@0,300;0,400;1,300&family=Outfit:wght@600;700&display=swap" rel="stylesheet">

<!-- Prism.js VS Code Dark Theme for Syntax Highlighting -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-okaidia.min.css" rel="stylesheet" />

<style>
body {
	background : url(images/backg.jpg);
	background-attachment:fixed;
	background-size:cover;
	background-color: blue;
	font-family: 'Inter', sans-serif;
}

/* Main container with balanced outer spacing */
.post-container {
	max-width: 950px;
	margin: 40px auto;
	padding: 0 15px;
}

/* Main card */
.post-card {
	background: white;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.10);
	border: 1px solid rgba(0, 0, 0, 0.05);
}

/* ================= IMAGE CONTAINER ================= */
.post-image-container {
	width: 100%;
	height: 400px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f8f9fa;
	padding: 20px;
	border-bottom: 1px solid #dee2e6;
}

.post-image {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
	border-radius: 8px;
	display: block;
}

/* ================= CONTENT AREA ================= */
.post-content {
	padding: 35px;
}

/* Title Font Style */
.post-title {
	font-family: 'Outfit', sans-serif;
	font-size: 34px;
	font-weight: 700;
	color: #1a1d20;
	margin-bottom: 20px;
	letter-spacing: -0.5px;
}

/* Post Information / Meta Badges */
.post-info {
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
	margin-bottom: 25px;
}

.info-item {
	background-color: #f1f3f5;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 500;
	color: #495057;
	letter-spacing: 0.2px;
}

.info-item i {
	margin-right: 6px;
	color: #0d6efd;
}

/* Section Headings */
.section-heading {
	font-family: 'Outfit', sans-serif;
	font-weight: 600;
	font-size: 20px;
	color: #212529;
}

/* Content Text */
.post-text {
	font-family: 'Merriweather', serif;
	font-size: 17px;
	line-height: 1.9;
	color: #333333;
	margin: 0;
	padding: 0;
}

/* VS Code Style Code Box */
.code-title {
	margin-top: 35px;
	margin-bottom: 12px;
	font-weight: 600;
}

pre[class*="language-"] {
	font-family: 'Fira Code', monospace !important;
	background-color: #1e1e1e !important;
	color: #d4d4d4 !important;
	padding: 20px !important;
	border-radius: 10px !important;
	overflow-x: auto;
	font-size: 13.5px;
	line-height: 1.6;
	box-shadow: inset 0 1px 3px rgba(0,0,0,0.3);
	margin: 0 !important;
}

/* Footer */
.post-footer {
	border-top: 1px solid #dee2e6;
	margin-top: 35px;
	padding-top: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* Buttons */
.post-btn {
	border-radius: 8px;
	padding: 9px 18px;
	font-weight: 500;
}

/* Mobile Responsiveness */
@media (max-width: 768px) {
    .post-container {
        margin: 20px 10px;
        padding: 0;
    }

    .post-image-container {
        height: 280px;
    }

    .post-content {
        padding: 20px;
    }

    .post-title {
        font-size: 26px;
    }

    .post-footer {
        flex-direction: column;
        gap: 15px;
        align-items: stretch;
    }
}
</style>

</head>

<body>

	<%
	int postId = Integer.parseInt(request.getParameter("id"));

	PostDao pd = new PostDao(ConnectionProvider.getCon());

	Posts p = pd.getPostByPostId(postId);

	if (p == null) {
	%>

	<!-- Post not found -->
	<div class="container text-center mt-5">
		<i class="fa-solid fa-circle-exclamation fa-4x text-danger"></i>
		<h2 class="mt-3">Post Not Found</h2>
		<p class="text-muted">The post you are looking for does not exist.</p>
		<a href="index.jsp" class="btn btn-primary"> 
			<i class="fa-solid fa-arrow-left"></i> Back to Posts
		</a>
	</div>

	<%
	} else {
	%>

	<div class="post-container">

		<div class="post-card">
			
			<!-- ================= IMAGE ================= -->
			<div class="post-image-container">
				<img src="profiles/postPic/<%=p.getpPic()%>" class="post-image" alt="<%=p.getpTitle()%>">
			</div>


			<!-- ================= CONTENT WRAPPER ================= -->
			<div class="post-content">

				<!-- Title -->
				<h1 class="post-title">
					<%=p.getpTitle()%>
				</h1>


				<!-- ================= POST INFORMATION ================= -->
				<div class="post-info">

					<%
					UserDao ud = new UserDao(ConnectionProvider.getCon());
					User postUser = ud.getUser(p.getUserId());
					String authorName = "Unknown Author";

					if (postUser != null) {
						authorName = postUser.getName();
					}
					%>

					<!-- Author -->
					<span class="info-item"> 
						<i class="fa-solid fa-user"></i> <%=authorName%>
					</span>

					<!-- Date -->
					<span class="info-item"> 
						<i class="fa-regular fa-calendar"></i> <%=p.getpDate()%>
					</span>

					<!-- Category -->
					<span class="info-item"> 
						<i class="fa-solid fa-folder"></i> Category ID: <%=p.getCatId()%>
					</span>

					<!-- Post ID -->
					<span class="info-item"> 
						<i class="fa-solid fa-hashtag"></i> Post <%=p.getPid()%>
					</span>

				</div>


				<!-- ================= DESCRIPTION ================= -->
				<h4 class="section-heading mb-3">
					<i class="fa-solid fa-align-left text-primary"></i> About this Post
				</h4>

				<div class="post-text">
					<%=p.getpContent()%>
				</div>


				<!-- ================= CODE SECTION ================= -->
				<%
				if (p.getpCode() != null && !p.getpCode().trim().isEmpty()) {
				%>

				<h4 class="section-heading code-title">
					<i class="fa-solid fa-code text-primary"></i> Code
				</h4>

				<!-- UPDATED: Added syntax-highlighting classes and wrapper tags -->
				<pre class="language-java"><code class="language-java"><%=p.getpCode()%></code></pre>

				<%
				}
				%>


				<!-- ================= FOOTER ================= -->
				<div class="post-footer">
					<a href="profile.jsp" class="btn btn-primary post-btn"> 
						<i class="fa-solid fa-arrow-left"></i> Back to Posts
					</a>

					<button type=button onclick="doLike(this,<%= p.getPid() %> ,<%= u.getId() %>)" class="btn btn-primary post-btn">
					<%
					LikeDao ld = new LikeDao(ConnectionProvider.getCon());
					
					%>
						<i class="fa-regular fa-thumbs-up"></i>  <span class="like-counter"> <%= ld.countLikeOnPost(p.getPid())%> </span>
					</button>
				</div>

			</div> <!-- End of .post-content -->

		</div> <!-- End of .post-card -->

	</div> <!-- End of .post-container -->

	<%
	}
	%>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- UPDATED: Prism JS scripts added for syntax coloration -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-java.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>

</body>
</html>