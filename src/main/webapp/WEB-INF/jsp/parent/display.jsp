<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IR=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="/pub/css/style.css">
<style> </style>
</head>
<body>

<h1>Display Parent Table</h1>
<form method="get" action = "/parent/display">
<button type="submit"><b>Display</b></button>
</form>


<table>
                <tr>
                    <td>Id</td>
                    <td>First Name</td>
                    <td>Last Name</td>
                    <td>Email Id</td>
                    <td>Password</td>
                    <td>Student1 Email Id</td>
                    <td>Student2 Email Id</td>
                </tr>
                <c:forEach items="${parents}" var="parent">
                    <tr>
                        <td>${parent.id}</td>
                        <td>${parent.firstName}</td>
                        <td>${parent.lastName}</td>
                        <td>${parent.email}</td>
                        <td>${parent.password}</td>
                        <td>${parent.studentEmail1}</td>
                        <td>${parent.studentEmail2}</td>
                    </tr>
                </c:forEach>
            </table>



</body>
</html>

<!--
        <c:if test="${not empty customers}">
            <h1 class="pt-5">Customers Found ${customers.size()}</h1>
<Table>
        </c:if>
        -->







