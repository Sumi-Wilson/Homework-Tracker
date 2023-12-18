<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="m-0">View Homework</h1>
            </div>
        </div>
    </div>
</section>

<section class="bg-light1 pt-5 pb-5">
    <div class="container">

        <table class="table table-hover">
             <tr>
                <td>Course</td>
                <td>Homework</td>
                <td>Created Date</td>
                <td>Due Date</td>
                <td>Status</td>
                <td>Edit</td>
             </tr>

              <c:forEach var="assignment" items="${assignments}">
                 <tr>
                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td>${assignment.createdDate}</td>
                     <td>${assignment.dueDate}</td>
                     <td>${assignment.status}</td>
                     <td>Edit</td>
                 </tr>
              </c:forEach>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>