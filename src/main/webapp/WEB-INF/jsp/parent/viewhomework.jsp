<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div style="border: 5px solid red; text-align: right; ">
    <table class="table table-hover">
        <tr>Students: </tr>
            <c:forEach var="parentStudent" items="${parentStudents}">
        <tr><a href="#"> ${parentStudent.student.id}</a></tr> &nbsp;&nbsp;
            </c:forEach>
    </table>
</div>



<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row" style="border: 5px solid green;">
            <div class="col-12 text-center" style="border: 5px solid white;">
                <h1 class="m-0">Parent View Homework</h1>
            </div>
        </div>
    </div>


<div style="width: 100px; height: 100px;">
<canvas id="myChart" width="200" height="200"></canvas>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>

<script>
  const ctx = document.getElementById('myChart').getContext('2d');
  const chart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ['Math', 'History'],
      datasets: [{
        data: [2, 3],
        backgroundColor: ['#f00', '#00f'],
      }]
    },
    options: {
      responsive: true, // For dynamic resizing
      // aspectRatio: 1 (Optional: maintains circular shape)
    }
  });
</script>
</div>

</section>



<jsp:include page="../include/footer.jsp"/>
