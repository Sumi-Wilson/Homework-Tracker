<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IR=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Course</title>
<link rel="stylesheet" type="text/css" href="/pub/css/style.css">
<style> </style>
</head>
<body>

<h1>Add Course</h1>
<br><br>
<form method="get" action = "/admin/courseAdd">
Course: <input placeholder="Course Name" type="text" id="course" name="course" required>
<button type="submit"><b>Add</b></button>
</form>


<table>
                <tr>
                    <td>Id</td>
                    <td>Course</td>
                </tr>
                <c:forEach items="${parents}" var="parent">
                    <tr>
                        <td>${parent.id}----</td>
                        <td>${parent.firstName}-------</td>
                    </tr>
                </c:forEach>
            </table>

</body>
</html>
