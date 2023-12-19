<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>
<script>
    const currentDate = new Date();
    const currentDateElement = document.getElementById('currentDate');
    currentDateElement.value = currentDate.toISOString();
</script>

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

<script>
    let status = "Not Started";
</script>
<style>
</style>

<p id="currentDate"></p> <br> <p id="daysLeft"></p> <br> <p id="status"</p>
<!-- ================================================= -->

<section class="pt-2 pb-2">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-6">
            <c:if test="${not empty success}">
                <div class="alert alert-success mt-3" role="alert">
                     ${success}
                </div>
            </c:if>

         <form method="get" action="/student/assignmentAdd">


            <h1> Add Homework </h1><br>
                 <div class="mt-3">
                       <label for="course" class="form-label">Course:</label>
                       <select id="course" name="course">
                            <c:forEach var="course" items="${courses}">
                                <option value="${course.course}">${course.course}</option>
                            </c:forEach>

                       <!--
                              <option value="Math" >Mathematics</option>
                              <option value="Physics" >Physics</option>
                              <option value="Chemistry" >Chemistry</option>
                       -->


                       </select>
                       <br><br>
                       <label for="homework" class="form-label">Homework:</label>
                       <input class="form-control" placeholder="Enter your homework" type="text" id="task" name="homework"  >
                            <br><br>
                       <label for="dueDate" class="form-label">Due Date:</label><br>
                       <input class="form-control" type="date" id="dueDate" name="dueDate" >

                                <input type="hidden" id="currentDate" name="currentDate"><br>
                                <input type="hidden" id="daysLeft" name="daysLeft">
                                <input type="hidden" id="status" name="status">
                                <center><button type="submit" class="btn btn-primary mt-4"><b>Add Homework</b></button></center>
<br><br>
                 </div>
         </form>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../include/footer.jsp"/>