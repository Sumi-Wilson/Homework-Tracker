<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<script>
function calculateDaysLeft() {
      const dueDateInput = document.getElementById('dueDate');
      const dueDate = new Date(dueDateInput.value);
      const today = new Date();

      const millisecondsInDay = 1000 * 60 * 60 * 24;
      const daysLeft = Math.round((dueDate.getTime() - today.getTime()) / millisecondsInDay);

      const daysLeftElement = document.getElementById('daysLeft');
      daysLeftElement.textContent = `Days left: ${daysLeft}`;

    window.onload = calculateDaysLeft;
</script>

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
                 <tr>
                     <td>${assignment.id}</td>
                     <td>${assignment.course}</td>
                     <td>${assignment.homework}</td>
                     <td>${assignment.createdDate}</td>
                     <td>${assignment.dueDate}</td>
                     <td>${daysLeft}</td>
                     <td>${assignment.status}</td>
                     <td><a href="/student/assignmentEdit/${assignment.id}">Edit</a></td>
                 </tr>
              </c:forEach>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>