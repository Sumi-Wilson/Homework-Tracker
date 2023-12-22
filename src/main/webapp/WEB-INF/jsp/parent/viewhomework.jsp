<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/header.jsp"/>

<script>
function calculateDaysLeft() {
    const rows = document.querySelectorAll('tr[data-due-date]');

    rows.forEach(row => {
        const dueDateValue = row.getAttribute('data-due-date');
        const dueDate = new Date(dueDateValue);
        const today = new Date();

        const millisecondsInDay = 1000 * 60 * 60 * 24;
        const daysLeft = Math.round((dueDate.getTime() - today.getTime()) / millisecondsInDay);

        const daysLeftElement = row.querySelector('.days-left span');
        daysLeftElement.textContent = daysLeft;


    });
}
window.onload = calculateDaysLeft;
</script>


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

                <th>Course</th>
                <th>Homework</th>
                <th>Created Date</th>
                <th>Due Date</th>
                <th>Days Left</th>
                <th>Status</th>

             </tr>

              <c:forEach var="assignment" items="${assignments}">
                 <tr data-due-date="${fn:escapeXml(fn:replace(assignment.dueDate, ' ', 'T'))}">

                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td><fmt:formatDate value="${assignment.createdDate}" pattern="yyyy-MM-dd" /></td>
                     <td>${assignment.dueDate}</td>
                     <td class="days-left"> <span></span> </td>
                     <td>${assignment.status}</td>

                 </tr>
              </c:forEach>

        </table>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>