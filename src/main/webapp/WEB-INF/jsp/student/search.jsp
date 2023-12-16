<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="m-0">Parent Search</h1>
            </div>
        </div>
    </div>
</section>

<section class="bg-light1 pt-5 pb-5">
    <div class="container">
        <form action="/student/search" method="get">
            <div class="row justify-content-center">
                <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                    <label for="firstName" class="form-label m-0 pt-1">First Name</label>
                </div>
                <div class="col-8 col-sm-9 col-md-6 col-lg-4">
                    <input type="text" class="form-control" id="firstNameSearch" name="firstName" placeholder="Search by first name" value="${firstName}"/>
                </div>
            </div>

            <div class="row justify-content-center pt-3">
                <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                    <label for="lastName" class="form-label m-0 pt-1">Last Name</label>
                </div>
                <div class="col-8 col-sm-9 col-md-6 col-lg-4">
                    <input type="text" class="form-control" id="lastNameSearch" name="lastName" placeholder="Search by last name" value="${lastName}"/>
                </div>
            </div>

            <div class="row justify-content-center pt-4">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>

        <c:if test="${not empty user}">
            <h1 class="pt-5">User Found ${user.size()}</h1>

            <table class="table table-hover">
                <tr>
                    <td>Id</td>
                    <td>First Name</td>
                    <td>Last Name</td>
                    <td>Email</td>
                    <td>User Type</td>
                    <td>Add Parent</td>
                </tr>

                <c:forEach items="${user}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.userType}</td>
                       <td><a href="/student/addParent?parentId=${user.id}">Add Parent</a></td>

                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>
