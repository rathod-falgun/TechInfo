
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.Tech.Info.entites.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Tech.Info.helper.ConnectionProvider"%>
<%@page import="com.Tech.Info.dao.PostDao"%>
<%@page import="com.Tech.Info.entites.Message"%>
<%@page import="com.Tech.Info.entites.User"%>
<%@ page errorPage="error.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/design.css" rel="stylesheet">
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>

	<!-- navbar -->


	<nav class="navbar navbar-expand-lg  navbar-background ">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa-solid fa-circle-user"></i> Tech Info</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"></button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">FR</a></li>



					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">DSA</a></li>
							<li><a class="dropdown-item" href="#">Python</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Java</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!" data-bs-toggle="modal"
						data-bs-target="#postModel">Create Post <span
							class="fa-solid fa-plus"></span>
					</a></li>

				</ul>
				<div class="d-flex align-items-center justify-content-end">
					<!-- Username Link -->

					<!-- Model opens from here -->
					<a class="text-dark me-3" href="#!" data-bs-toggle="modal"
						data-bs-target="#profile-modal" style="text-decoration: none;">
						<span class="fa fa-user-circle"></span> <%=user.getName()%>
					</a>

					<!-- Log Out Link -->
					<a class="text-dark" href="logoutServlet"
						style="text-decoration: none;"> <span
						class="fa fa-sign-out-alt"></span> Log Out
					</a>
				</div>

			</div>
		</div>
	</nav>
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<!--  start of profile model -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title text-center" id="profile-model">TechInfo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container">
						<h5 class="modal-title text-center" id="profile-model">
							<img alt="Profile" src="profiles/<%=user.getProfile()%>"
								width="120" height="120" class="rounded-circle mb-3">
						</h5>
						<h5 class="modal-title text-center" id="profile-model">
							<%=user.getName()%></h5>
					</div>

					<div class="profile-details">
						<table class="table">
							<tr>
								<th>Id</th>
								<td scope="row"><%=user.getId()%></td>
							</tr>
							<tr>
								<th>Email</th>
								<td scope="row"><%=user.getEmail()%></td>
							</tr>
							<tr>
								<th>Gender</th>
								<td scope="row"><%=user.getGender()%></td>
							</tr>
							<tr>
								<th>Registered Date</th>
								<td scope="row"><%=user.getTime()%></td>
							</tr>
						</table>
					</div>

					<!-- profile edit -->
					<div class="profile_edit text-center" style="display: none;"
						id="profile-edit">
						<h3 class="mt-2">Edit Your Profile</h3>
						<form class="form-control" action="editServlet" method="post"
							enctype="multipart/form-data">

							<table class="table">
								<tr>
									<th>Id</th>
									<td scope="row"><%=user.getId()%></td>
								</tr>
								<tr>
									<th>Email</th>
									<td scope="row"><input type="email" name="user_email"
										value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th>Name</th>
									<td scope="row"><input type="text" name="user_name"
										value="<%=user.getName()%>"></td>
								</tr>
								<tr>
									<th>Password</th>
									<td scope="row"><input type="password"
										name="user_password" value="<%=user.getPassword()%>"></td>
								</tr>
								<tr>
									<th>Gender</th>
									<td scope="row"><%=user.getGender().toUpperCase()%></td>
								</tr>
								<tr>
									<th>Profile Picture</th>
									<td scope="row" style="margin-left: 20px"><input
										type="file" name=profile_img></td>
								</tr>

							</table>
							<div class="container form-control">

								<button type="submit">Save</button>

							</div>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn-primary" id="btn-edit-profile">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of model -->



	<!-- Start of Post model -->

	<div class="modal fade" id="postModel" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="exampleModalLabel">
						Post Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" style="width: 100%" id="selectCat"
								name="catId">
								<option selected disabled="disabled">--- Select
									Category ---</option>
								<%
								PostDao p = new PostDao(ConnectionProvider.getCon());
								ArrayList<Category> li = p.getAllCategories();
								for (Category c : li) {
								%>
								<option value="<%=c.getCid()%>">
									<%=c.getCname()%>
								</option>
								<%
								}
								%>

							</select> <br>
							<div class="form-control text-center">

								<a style="text-decoration: none; text-align: center;" href="#!"
									data-bs-toggle="modal" data-bs-target="#AddCategoryModel">Add
									Your category </a>
							</div>
							<br>
						</div>
						<div class="form-group">
							<input type="text" name="pTitle" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<br>
						<div class="form-group">
							<textarea rows="2" cols="4" class="form-control" name="pContent"
								style="height: 150px;" placeholder="Enter your Content"></textarea>
						</div>
						<br>
						<div class="form-group">
							<textarea rows="2" cols="4" class="form-control" name="pCode"
								style="height: 200px;" placeholder="Enter your Code (if any)"></textarea>
						</div>
						<br>
						<div class="form-control">
							<label id="pic">Select your pic <input id="pic"
								name="pic" type="file" placeholder="Enter your Image"></label>
						</div>
						<br>
						<div class="modal-footer">
							<button type="submit" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" id="savePost" class="btn btn-primary">Save
								changes</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End of Post Model -->

	<!-- Start of the Add Category Model -->

	<!-- Vertically centered modal -->
	<div class="modal-dialog modal-dialog-centered">

		<!-- Modal -->
		<div class="modal fade" id="AddCategoryModel" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add Your
							Category</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="AddCategoryServlet" method="post">
							<div class="container">

								<div class="form-control">
									<input type="text" id="cname" name="cname"
										placeholder="Enter Your Category Name">
								</div>

								<div class="form-control">
									<textarea id="cdescription" rows="10" cols="10"
										style="width: 100%" name="info"
										placeholder="Enter Your Category Description (If You have)"></textarea>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary"
									id="addCategoryBtn">Add This One</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>


	<!-- End of the Add Category Model  -->


	<!-- main -->

	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<ul class="list-group">
					<li class="list-group-item c-link active"
						onclick="getPost(0, this)" style="cursor: pointer;">All Post

					</li>
					<%
					PostDao pd = new PostDao(ConnectionProvider.getCon());
					ArrayList<Category> l = pd.getAllCategories();
					for (Category cat : l) {
					%>
					<li class="list-group-item c-link"
						onclick="getPost(<%=cat.getCid()%>, this)"
						style="cursor: pointer;"><%=cat.getCname()%></li>
					<%
					}
					%>
				</ul>
			</div>

			<div class="col-md-9">

				<!-- post -->
				<div class="container text-center" id="loader">

					<i class="fa fa-refresh fa-4x fa-spin "></i>
					<h3 class="mt-2">Your Posts are on the way...</h3>
				</div>

				<div class="container-fluid" id="post-container"></div>

			</div>

		</div>

	</div>

	<!-- End of main  -->


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">
			$(document).ready(
					function() {
	
						let editStatus = false;
	
						$("#btn-edit-profile").click(function() {
							if (!editStatus) {
								$(".profile-details").hide();
								$("#profile-edit").show();
								editStatus = true;
								$(this).text("Edit");
	
							} else {
								$(".profile-details").show();
								$("#profile-edit").hide();
								editStatus = false;
								$(this).text("Back");
							}
						});
	
						$('#addCategoryBtn').click(
								function() {
									let cname = $('#cname').val();
									let cdescription = $('#cdescription').val();
	
									if (cname.trim() == "") {
										alert("please Enter Category Name");
									}
									$.ajax({
										url : "AddCategoryServlet",
										type : "post",
										data : {
											cname : cname,
											info : cdescription,
										},
										success : function(response) {
											alert("Category Added Successfully!");
	
											$("#selectCat").append(
													$("<option></option>").val(
															cname).text(
															cdescription));
	
											$("#cname").val("");
											$("#cdescription").val("");
	
											$("#AddCategoryModel").modal("hide");
										},
										error : function(xhr, status, error) {
	
											alert("Something went wrong!");
	
											console.log(error);
										}
									})
								});
	
					});
		</script>

	<!-- Loading post using ajax -->
	<script type="text/javascript">
		
			function getPost(catId,temp){
				
				$("#loader").show();
				$("#post-container").hide();
				
				$(".c-link").removeClass("active");
				$(temp).addClass("active");

	
				$.ajax({
	
					url : "LoadPost.jsp",
					data : { cid : catId },
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$("#loader").hide();
						$("#post-container").show();
						$("#post-container").html(data);
	
					}
	
				})
			}
			$(document).ready(function(e) {
				let allPost = $(".c-link").first();
				getPost(0,allPost);
			});
		</script>
</body>
</html>

































