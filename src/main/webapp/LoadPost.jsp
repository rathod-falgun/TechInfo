<%@page import="com.Tech.Info.dao.LikeDao"%>
<%@page import="com.Tech.Info.dao.UserDao"%>
<%@page import="com.Tech.Info.entites.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.Tech.Info.entites.User"%>
<%@page import="com.Tech.Info.helper.ConnectionProvider"%>
<%@page import="com.Tech.Info.dao.PostDao"%>

<style>
.custom-card-img {
	height: 160px;
	object-fit: cover;
	width: 100%;
}

.card-body pre {
	max-height: 100px;
	overflow: auto;
	background-color: #f8f9fa;
	padding: 10px;
	border-radius: 4px;
}
</style>

<div class="row g-4 " style="padding-bottom: 20px;">
	<%
	PostDao p = new PostDao(ConnectionProvider.getCon());
	UserDao ud = new UserDao(ConnectionProvider.getCon());
	User user = (User) session.getAttribute("currentUser");

	List<Posts> li = null;
	int cid = Integer.parseInt(request.getParameter("cid"));
	if (cid == 0) {
		li = p.getAllPost();
	} else {
		li = p.getPostById(cid);
	}
	if (li.isEmpty()) {
	%>
	<div class="container text-center">
		<h3 class="display-3">No posts are there in this Category...</h3>
	</div>
	<%
	} else {

	for (Posts i : li) {
	%>

	<div class="col-md-6">

		<div class="card border border-dark h-200">
			<img src="profiles/postPic/<%=i.getpPic()%>" class="custom-card-img"
				alt="Post Image">
			<div class="card-body">
				<b><%=i.getpTitle()%></b>
				<p><%=i.getpContent()%></p>
			</div>
			<div
				class="card-footer d-flex justify-content-between align-items-center"
				style="height: 10%">

				<div class="d-flex gap-2">
					<%
					LikeDao ld = new LikeDao(ConnectionProvider.getCon());
					boolean likeAlready = false;
					if(user != null){
					    likeAlready = ld.isLikedByUser(i.getPid(), user.getId());
					}
					%>
					<a href="showPostDetail.jsp?id=<%=i.getPid()%>"
						class="btn btn-outline-primary"> Read More </a> <a href="#!"
						onclick="doLike(this,<%=i.getPid()%>, <%=user.getId()%>);"
						class="btn btn-outline-primary"> <%  if (likeAlready) {
 %> <i class="fa-solid fa-thumbs-up"></i> <%
 } else {
 %> <i class="fa-regular fa-thumbs-up"></i> <%	
 }
 %> <span class="like-counter"> <%=ld.countLikeOnPost(i.getPid())%>
					</span>

					</a>
				</div>

				<%
				// 1. Changed variable name from 'u' to 'postUserId' to avoid duplicate variable collision
				int postUserId = i.getUserId();
				User postUser = ud.getUser(postUserId);

				// 2. Added a null-safety verification check
				String authorName = (postUser != null) ? postUser.getName() : "Unknown Author";
				%>
				<p class="mb-0 text-muted ml-3">
					posted by: <b><%=authorName%></b>
				</p>
			</div>

		</div>

	</div>

	<%
	}
	}
	%>
</div>
