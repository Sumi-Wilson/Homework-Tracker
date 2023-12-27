<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-2" style="background-color: #F2FAFF; border: 1px solid #056EB9; border-radius: 15px; width: 97%; margin-left: 15px;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Search Parent</h2>
            </div>
        </div>
    </div>
</section>

<section class="bg-light1 pt-4 pb-3" style="height: 72vh;">
    <div class="container">
         <div class="row justify-content-center">
            <div class="col-6">
                <c:if test="${not empty success}">
                    <div class="alert alert-success mt-3" role="alert">
                        ${success}
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3" role="alert">
                        ${error}
                    </div>
                </c:if>

                <form action="/student/search" method="get" style="padding-top:15px; padding-bottom: 15px; padding-left:10px; padding-right: 10px; border: 1px solid #ccc; border-radius: 10px; background-color: #F2FAFF;">
                    <div class="row justify-content-center">
                        <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                            <label for="firstName" class="form-label m-0 pt-1">First Name</label>
                        </div>
                        <div class="col-8 col-sm-9 col-md-6 col-lg-10">
                            <input type="text" class="form-control" id="firstNameSearch" name="firstName" placeholder="Search by first name" value="${firstName}"/>
                        </div>
                    </div>
                        <div class="row justify-content-center pt-3">
                            <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                                <label for="lastName" class="form-label m-0 pt-1">Last Name</label>
                            </div>
                            <div class="col-8 col-sm-9 col-md-6 col-lg-10">
                                <input type="text" class="form-control" id="lastNameSearch" name="lastName" placeholder="Search by last name" value="${lastName}"/>
                            </div>
                        </div>
                            <div class="row justify-content-center pt-1">
                                <div class="col-2">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <br>
        <c:if test="${not empty user}">
            <h7 class="pt-4" style="color: #056EB9;">Parent Found (${user.size()})</h7>

            <table class="table table-hover" border="1">
                <tr style="background-color: #F2FAFF;">

                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>User Type</th>
                    <th>Add Parent</th>
                </tr>

                <c:forEach items="${user}" var="user">
                    <tr>

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
