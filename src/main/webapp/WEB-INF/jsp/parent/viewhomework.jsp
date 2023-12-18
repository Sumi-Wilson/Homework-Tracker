<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div style="border: 5px solid white; text-align: right; ">
    <table class="table table-hover">
        <tr>Students: </tr>
            <c:forEach var="parentStudent" items="${parentStudents}">
        <tr><a href="/parent/viewhomework?studentId=${parentStudent.student.id}">${parentStudent.student.firstName}</a></tr> &nbsp;&nbsp;
            </c:forEach>
    </table>
</div>

<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row" style="border: 5px solid white;">
            <div class="col-12 text-center" style="border: 5px solid white;">
                <h1 class="m-0">Parent View Homework</h1>
            </div>
        </div>
    </div>

</section>

<section class="bg-light1 pt-5 pb-5" style="height: 70vh;">
    <div class="container">

        <table class="table table-hover">
             <tr>
                <td>Course</td>
                <td>Homework</td>
                <td>Created Date</td>
                <td>Due Date</td>
                <td>Status</td>
             </tr>

              <c:forEach var="assignment" items="${assignments}">
                 <tr>
                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td>${assignment.createdDate}</td>
                     <td>${assignment.dueDate}</td>
                     <td>${assignment.status}</td>
                 </tr>
              </c:forEach>
        </table>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>