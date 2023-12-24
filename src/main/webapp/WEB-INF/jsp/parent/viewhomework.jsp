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


<div style="border: 1px solid orange; text-align: right;">
    <table class="table table-hover" border="2px" bordercolor="green">
        <tr border="2px" bordercolor="red" style="border: 1px solid orange;"><b>Students: </b></tr>
            <c:forEach var="parentStudent" items="${parentStudents}">
        <tr style="border: 1px solid orange;"><a href="/parent/viewhomework?studentId=${parentStudent.student.id}">${parentStudent.student.firstName}</a></tr>&nbsp;
            </c:forEach>
    </table>
</div>

<section>
    <div class="bg-light2 pt-0 pb-0">
        <div class="row" style="border 1px solid black;">
            <div class="col-12 text-center" style="display: flex;">
                <div style="border 1px solid black;">Select</div>
                <div style="border 1px solid black;"><h2 class="m-0">${parentStudents[0].student.firstName}'s Homework</h2></div>
                <div style="border 1px solid black; text-align: right; align-items: right;">Radio</div>
            </div>
        </div>
    </div>

</section>

<section class="bg-light1 pt-2 pb-0" style="height: 68vh; border: 1px solid blue;">
    <div class="container">

        <table class="table table-hover">
             <tr>

                <th><a href="/parent/viewhomework?studentId=${studentId}&sortBy=course" style="text-decoration: none">Course</a></th>
                <th>Homework</th>
                <th>Created Date</th>
                <th><a href="/parent/viewhomework?studentId=${studentId}&sortBy=dueDate" style="text-decoration: none">Due Date</a></th>
                <th>Days Left</th>
                <th><a href="/parent/viewhomework?studentId=${studentId}&sortBy=status" style="text-decoration: none">Status</a></th>

             </tr>

              <c:forEach var="assignment" items="${assignments}">
                 <tr data-due-date="${fn:escapeXml(fn:replace(assignment.dueDate, ' ', 'T'))}">

                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td><fmt:formatDate value="${assignment.createdDate}" pattern="yyyy-MM-dd" /></td>
                     <td>${assignment.dueDate}</td>
                     <td class="days-left"> <span></span> </td>
                     <td style="color:
                       <c:choose>
                         <c:when test="${assignment.status eq 'To Do'}">orange</c:when>
                         <c:when test="${assignment.status eq 'In-Progress'}">blue</c:when>
                         <c:when test="${assignment.status eq 'Overdue'}">red</c:when>
                         <c:when test="${assignment.status eq 'Done'}">green</c:when>
                         <c:otherwise>transparent</c:otherwise>
                       </c:choose>">
                       ${assignment.status}
                     </td>

                 </tr>
              </c:forEach>

        </table>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>