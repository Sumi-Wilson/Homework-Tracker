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
        if (!row.classList.contains('done') && daysLeftElement){
        daysLeftElement.textContent = daysLeft;
        }

    });
}
window.onload = calculateDaysLeft;
</script>

<section>
    <div style="text-align: right; margin-right: 15px;">
        <b>Students: </b>
        <c:forEach var="parentStudent" items="${parentStudents}">
            <a href="/parent/viewhomework?studentId=${parentStudent.student.id}">${parentStudent.student.firstName}</a></tr>&nbsp;
        </c:forEach>
    </div>
</section>

<section>
<div class="bg-light2 pt-0 pb-0" style="display: flex; justify-content: space-around;">
    <div></div>
    <div><h2 class="m-0">View Homework</h2></div>
    <div></div>
</div>
</section>

<section class="bg-light1 pt-4 pb-0" style="height: 70vh;">
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
                 <tr data-due-date="${fn:escapeXml(fn:replace(assignment.dueDate, ' ', 'T'))}" class="<c:if test='${assignment.status eq "Done"}'>done</c:if>">
                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td><fmt:formatDate value="${assignment.createdDate}" pattern="yyyy-MM-dd" /></td>
                     <td>${assignment.dueDate}</td>
                      <!-- Add a conditional check to display or hide the "Days Left" column -->

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