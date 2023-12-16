<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-5 pb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="m-0">Parent View Homework</h1>
            </div>
        </div>
         <table class="table table-hover">
             <tr>
                <td>Students</td>
             </tr>

             <c:forEach var="parentStudent" items="${parentStudents}">
                  <tr>
                     <td>${parentStudent.student.id}</td>
                  </tr>
             </c:forEach>
    </div>
</section>




<jsp:include page="../include/footer.jsp"/>