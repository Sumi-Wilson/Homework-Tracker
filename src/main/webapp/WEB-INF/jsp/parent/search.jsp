<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="m-0">Employee Search</h1>
            </div>
        </div>
    </div>
</section>

<section class="bg-light1 pt-5 pb-5">
    <div class="container">
      <form action="/employee/search">
            <div class="row justify-content-center">
                  <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                      <label for="firstName" class="form-label m-0 pt-1">First Name</label>
                  </div>
                   <div class="col-8 col-sm-9 col-md-6 col-lg-4">
                        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Search by first name" value="${firstName}"/>
                   </div>
            </div>

            <div class="row justify-content-center pt-3">
                    <div class="col-3 col-sm-3 col-md-2 col-lg-2 text-end">
                        <label for="lastName" class="form-label m-0 pt-1">Last Name</label>
                    </div>
                    <div class="col-8 col-sm-9 col-md-6 col-lg-4">
                           <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Search by last name" value="${lastName}"/>
                    </div>
            </div>

            <div class="row justify-content-center pt-4">
                    <div class="col-12 text-center">
                           <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
            </div>
     </form>
    </div>
</section>

<c:if test="${not empty employees}">
    <section class="bg-light1 pb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">

                    <h3 class="text-center pb-3">Employees Found ${employees.size()}</h3>

                    <table class="table table-hover">
                        <tr>
                            <td>Id</td>
                            <td>First Name</td>
                            <td>Last Name</td>
                            <td>Phone</td>

                        </tr>
                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.id}</td>
                                <td>${employee.firstName}</td>
                                <td>${employee.lastName}</td>
                                <td>${employee.departmentName}</td>
                                <td><a href="/employee/edit/${employee.id}">Edit</a></td

                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </section>
</c:if>

<jsp:include page="../include/footer.jsp"/>
