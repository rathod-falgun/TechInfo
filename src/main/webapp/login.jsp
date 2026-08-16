<%@page import="com.Tech.Info.entites.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Tech.Info.entites.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
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

</head>
<body>

    <%@ include file="Navbar.jsp"%>
    <main class=" bg-primary banner-background">

        <div class="container md-10" style="height: 80vh;">

            <div
                class="row justify-content-center  align-items-center h-100">

                <div class="col-md-4">

                    <div class="card shadow-lg fw-bold">

                        <div
                            class="card-header bg-secondary text-center ">
                            <span class="fa fa-user-plus fa-2x"></span>
                            <br>
                            <p>Login</p>
                        </div>

                        <%

Message m   =(Message) session.getAttribute("msg");
if(m != null){
    
    %>
                        <div class="alert <%= m.getCssClass() %>"
                            role="alert">
                            <%= m.getContent()%>
                        </div>
                        <%
    session.removeAttribute("msg");
}


%>


                        <div class="card-body">
                            <form action="loginServlet" method="post"
                                id="loginForm">
                                <!-- Email input -->
                                <div data-mdb-input-init
                                    class="form-outline mb-4">
                                    <input type="email"
                                        required="required" name="email"
                                        id="form2Example1"
                                        class="form-control" /> <label
                                        class="form-label"
                                        for="form2Example1">Email
                                        address</label>
                                </div>

                                <!-- Password input -->
                                <div data-mdb-input-init
                                    class="form-outline mb-4">
                                    <input type="password"
                                        required="required"
                                        name="password"
                                        id="form2Example2"
                                        class="form-control" /> <label
                                        class="form-label"
                                        for="form2Example2">Password</label>
                                </div>

                                <!-- 2 column grid layout for inline styling -->
                                <div class="row mb-4">
                                    <div
                                        class="col d-flex justify-content-center">
                                        <!-- Checkbox -->
                                        <!--  <div class="form-check">
                                            <input
                                                class="form-check-input"
                                                type="checkbox" value=""
                                                id="form2Example31"
                                                checked /> <label
                                                class="form-check-label"
                                                for="form2Example31">
                                                Remember me </label>
                                        </div> -->
                                    </div>
                                    <!-- Submit button -->
                                    <button type="submit"
                                        data-mdb-button-init
                                        data-mdb-ripple-init
                                        class="btn btn-primary btn-block mb-4">Sign
                                        in</button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>
                                            Not a member? <a
                                                href="register.jsp">Register</a>
                                        </p>


                                    </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </main>


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

</body>
</html>