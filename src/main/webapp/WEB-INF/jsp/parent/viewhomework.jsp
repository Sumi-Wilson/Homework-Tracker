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




</section>



<jsp:include page="../include/footer.jsp"/>
