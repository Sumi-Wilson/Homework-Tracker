<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/header.jsp"/>

<!-- Calculate DaysLeft -->
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
<!-- Selection of Radio Button -->
function filterAssignments(status) {
    const rows = document.querySelectorAll('tr[data-status]');

    rows.forEach(row => {
        const rowStatus = row.getAttribute('data-status');
        if (status === 'all' || rowStatus === status) {
            row.style.display = 'table-row';
        } else {
            row.style.display = 'none';
        }
    });
}

window.onload = function(){
   calculateDaysLeft();

       const radioButtons = document.querySelectorAll('input[name="status"]');
       radioButtons.forEach(button => {
           button.addEventListener('change', function() {
               const selectedStatus = this.value;
               filterAssignments(selectedStatus);
           });
       });
   };

</script>


<section>
    <div class="bg-light2 pt-2 pb-2" style="background-color: #F2FAFF; display: flex; border: 1px solid #056EB9; border-radius: 15px; width: 98%; margin-left: 10px; justify-content: space-around;">
        <div>
            <form action="/student/viewhomework" method="get">

                <label for="startDate"><b>Start Date </b></label>
                <input type="date" id="startDate" name="startDate" required>

                <label for="endDate"><b>End Date </b></label>
                <input type="date" id="endDate" name="endDate" required>&nbsp;

                <button type="submit" class="btn btn-primary btn-sm">View</button>
            </form>
        </div>

        <div><h2 class="m-0">View Homework</h2></div>
        <div>
                <input type="radio" name="status" value="all" id="all-radio" checked> All
                <input type="radio" name="status" value="To Do" id="todo-radio"> To Do
                <input type="radio" name="status" value="In-Progress" id="inprogress-radio"> In Progress
                <input type="radio" name="status" value="Overdue" id="overdue-radio"> Overdue
                <input type="radio" name="status" value="Done" id="done-radio"> Done
        </div>
    </div>
</section>

<section class="bg-light1 pt-3 pb-2" style="height: 71vh;">
    <div class="container">

        <table class="table table-hover" border="1">
             <tr style="background-color: #F2FAFF;">

                <th>Id</th>
                <th>Course</th>
                <th>Homework</th>
                <th>Created Date</th>
                <th>Due Date</th>
                <th>Days Left</th>
                <th>Status</th>
                <th>Edit</th>
             </tr>

              <c:forEach var="assignment" items="${assignments}">
                 <tr data-due-date="${fn:escapeXml(fn:replace(assignment.dueDate, ' ', 'T'))}" class="<c:if test='${assignment.status eq "Done"}'>done</c:if>">

                     <td>${assignment.id}</td>
                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td><fmt:formatDate value="${assignment.createdDate}" pattern="yyyy-MM-dd" /></td>
                     <td>${assignment.dueDate}</td>
                     <td class="days-left"><span></span></td>
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

                     <td><a href="/student/assignmentEdit/${assignment.id}">Edit</a></td>

                 </tr>
              </c:forEach>
        </table>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>