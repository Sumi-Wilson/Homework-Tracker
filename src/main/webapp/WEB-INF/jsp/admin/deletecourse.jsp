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

<h1>Search, Display and Delete</h1>
<form method="get" action = "/admin/----delete">
Course: <input type="text" class="form-control" id="firstNameSearch" name="firstName" placeholder="Search by first name" value="${search}"/>
<button type="submit"><b>Search</b></button>
</form>


<c:if test="${not empty customers}">
            <h1>Customers Found ${customers.size()}</h1>

            <table>
                <tr>
                    <td>Id</td>
                    <td>Course</td>
                </tr>
                <c:forEach items="${customers}" var="customer">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.firstName}</td>
                    </tr>
                </c:forEach>
            </table>

        </c:if>

</body>
</html>