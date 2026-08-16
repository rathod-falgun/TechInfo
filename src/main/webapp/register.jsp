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
<title>Register Page</title>
</head>
<body>

    <%@ include file="Navbar.jsp"%>

    <main class="bg-primary p-5 banner-background">
        <div class="container">
            <div class="col-md-4 offset-md-4">
                <div class="card  fw-bold">
                    <div class="card-header bg-secondary text-center">
                        <span
                            class="fa fa-2x fa-user-circle text-center"></span><br>
                        Register<br>
                    </div>


                    <div class="card-body p-4">
                        <form action="registerServlet" method="post"
                            id="form">
                            <div class="form-group">
                                <label for="username">Username </label>
                                <input type="text" class="form-control"
                                    id="username" name="username">
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address
                                </label> <input type="text" class="form-control"
                                    id="email" name="email">
                                <p>we will never share your email
                                    with anyone else.</p>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label> <input
                                    type="password" class="form-control"
                                    id="password" name="password">
                            </div>
                            <div class="form-group">
                                <label for="gender"
                                    style="margin-bottom: 10px;">Gender</label><br>
                                <input type="radio" name="gender"
                                    value="Male" id="male">Male
                                <input type="radio" id="female"
                                    value="Female" name="gender">
                                Female<br>
                            </div>
                            <br>
                            <div class="text-center ">
                                <div class="container" id="loader"
                                    style="display: none">
                                    <span
                                        class="fa fa-refresh fa-2x fa-spin"></span>
                                    <h3>Please Wait....</h3>
                                </div>
                                <button type="submit" id="submit"
                                    class="btn btn-primary">Sign
                                    Up</button>
                            </div>
                        </form>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <script type="text/javascript">
				$(document).ready(function(){
					$("#loader").hide();
					
					$("#form").submit(function(e){

					    e.preventDefault();

					    $("#loader").show();
					    $("#submit").hide();

					    $.ajax({

					        url: "registerServlet",
					        type: "POST",
					        data: $(this).serialize(),

					        success: function(response){

					            $("#loader").hide();
					            $("#submit").show();

					            if(response.trim()=="done"){

					                Swal.fire({
					                    title: "Registered Successfully!",
					                    icon: "success"
					                }).then(function(){

					                    window.location="login.jsp";

					                });

					            }else if(response.trim() == "error"){
					            	 Swal.fire({
					                     title: "Registration Failed!",
					                     text: "This email address is already registered.",
					                     icon: "warning"
					                 });
					            }

					        },

					        error: function(){

					            $("#loader").hide();
					            $("#submit").show();

					            Swal.fire({
					                title: "Registration Failed!",
					                icon: "error"
					            });

					        }

					    });

					});
					
					});
				
				</script>
</body>
</html>