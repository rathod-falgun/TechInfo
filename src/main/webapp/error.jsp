<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
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
<title>Error</title>
</head>
<body>
    <div class="container text-center">

        <img src="images/error.png" class="image-fluid">
        <h3 class="display-3">Something went Wrong..</h3>
        <%= exception%><br> <a href="index.jsp"><button
                class="btn btn bg-primary text-center text-white m-20 btn-lg"
                type="submit">Home</button></a>

    </div>
</body>
</html>