<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Homework Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../pub/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="background: white; border-bottom: 5px solid #056EB9;">
        <a class="navbar-brand" href="/"><img src="../pub/images/logo.png"></a>


        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav" style="border: 1px solid white; border-radius: 5px; justify-content: right; background: #056EB9;">
            <ul class="navbar-nav">
                <!--
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                -->
<!-- ==================ADMIN===================== -->
                <sec:authorize access="hasAnyAuthority('ADMIN')">
                     <!--
                     <li class="nav-item">
                        <a class="nav-link" href="/admin/index" style="color: white;">Admin</a>
                     </li>  -->
                     <li class="nav-item">
                        <a class="nav-link" href="/admin/course" style="color: white;">Add Course</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="/admin/deletecourse" style="color: white;">Delete Course</a>
                     </li>
                </sec:authorize>
<!-- ===============PARENT======================== -->
                 <sec:authorize access="hasAnyAuthority('Parent')">
                    <li class="nav-item">
                        <a class="nav-link" href="/parent/viewhomework" style="color: white;">View Homework</a>
                    </li>
                    <!--
                    <li class="nav-item">
                        <a class="nav-link" href="/student/search" style="color: white;">Search Student</a>
                    </li> -->
                 </sec:authorize>
<!-- ===============STUDENT======================== -->
                 <sec:authorize access="hasAnyAuthority('Student')">
                    <li class="nav-item">
                        <a class="nav-link" href="/student/studentview" style="color: white;">Add Homework</a>
                    </li>
                    <li class="nav-item">
                                            <a class="nav-link" href="/student/edit" style="color: white;">Edit Homework</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/student/viewhomework" style="color: white;">View Homework</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/student/search" style="color: white;">Link Parent</a>
                    </li>
                 </sec:authorize>
<!-- ===================NOT LOGGED IN========================= -->
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/register" style="color: white;">Sign Up</a>
                    </li>
                    <li class = "nav-item">
                        <a class = "nav-link" href="/auth/login" style="color: white;">Sign In</a>
                    </li>
                 </sec:authorize>
<!-- ============================================== -->
                 <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/logout" style="color: white;">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" style="color: white;"><sec:authentication property="principal.username"/></a>
                    </li>
                 </sec:authorize>


            </ul>
        </div>
    </div>
</nav>