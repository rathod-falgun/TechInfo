<%@page import="com.Tech.Info.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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

    <!--  Navbar -->
    <%@include file="Navbar.jsp"%>

    <!--  banner -->
    <div class="container-fluid p-0 m-0  banner-background pb-5 mb-4">

        <div class="p-5 mb-4 rounded-3">
            <div class="container ">
                <h3 class="display-3">Technical Information for you</h3>
                <h3>Welcom to your info....</h3>
                <p>Java is a high-level, general-purpose,
                    memory-safe, object-oriented programming language.
                    It is intended to let programmers write once, run
                    anywhere (WORA),[17] meaning that compiled Java code
                    can run on all platforms that support Java without
                    the need to recompile.</p>
                <p>[18] Java applications are usually compiled to
                    bytecode that can run on any Java virtual machine
                    (JVM) regardless of the underlying computer
                    architecture.[19] The syntax of Java is similar to C
                    and C++, but has fewer low-level facilities than
                    either of them. The Java runtime provides dynamic
                    abilities (such as reflective programming
                    (reflection) and runtime code modification) usually
                    unavailable in traditional compiled languages. Java
                    gained popularity shortly after its release, and has
                    been a popular programming language since then.[20]
                    Java was the third most popular programming language
                    in 2022 according to GitHub.[21] Although still
                    widely popular, there has been a gradual decline in
                    use of Java in recent years with other languages
                    using JVM gaining popularity.[22]</p>

                <button class="btn btn-outline-dark btn-lg">
                    Start ! its Free</button>
                <a class="btn btn-outline-dark btn-lg" href="login.jsp">
                    <span><i class="fa-solid fa-user-lock "></i>
                </span>Login
                </a>

            </div>


        </div>


    </div>
    <!-- cards -->
    <!-- cards -->
    <div class="container" style="padding-top: 20px;">
        <!-- Combined into 1 row, using g-4 for both horizontal and vertical gap spacing -->
        <div class="row g-4">

            <!-- Card 1 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Learn Java
                            fundamentals, object-oriented programming,
                            collections, multithreading, exception
                            handling, and build powerful desktop and
                            enterprise applications.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Python Programming</h5>
                        <p class="card-text">Explore Python for web
                            development, automation, data analysis,
                            artificial intelligence, and machine
                            learning with simple and readable syntax.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Data Structures &
                            Algorithms</h5>
                        <p class="card-text">Master arrays, linked
                            lists, trees, graphs, dynamic programming,
                            and problem-solving techniques to crack
                            coding interviews.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Web Development</h5>
                        <p class="card-text">Build responsive
                            websites using HTML, CSS, JavaScript,
                            Bootstrap, React, and backend technologies
                            to create modern web applications.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

            <!-- Card 5 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Database Management</h5>
                        <p class="card-text">Understand SQL, MySQL,
                            PostgreSQL, database normalization,
                            indexing, transactions, and efficient data
                            management techniques.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

            <!-- Card 6 -->
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-dark">
                    <div class="card-body">
                        <h5 class="card-title">Cloud Computing</h5>
                        <p class="card-text">Learn cloud platforms
                            like AWS, Microsoft Azure, and Google Cloud,
                            including virtualization, deployment, and
                            scalable application hosting.</p>
                        <a href="#" class="btn btn-primary">Read
                            More</a>
                    </div>
                </div>
            </div>

        </div>
    </div>










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