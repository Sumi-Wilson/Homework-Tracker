<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IR=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Course</title>
<link rel="stylesheet" type="text/css" href="/pub/css/style.css">
<style> </style>
</head>
<body>

<h1>Delete Course</h1>
<br><br>
<form method="get" action = "/admin/deletecourse">
Course: <input placeholder="Course Name" type="text" id="course" name="courseName" value="${courseName}" required>
<button type="submit"><b>Delete</b></button>
</form>



</body>
</html>