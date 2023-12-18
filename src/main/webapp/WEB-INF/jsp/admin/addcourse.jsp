<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-2" style="border: 1px solid white;">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="m-0">Add Course</h1>
            </div>
        </div>
    </div>
</section>

<section class="pt-2 pb-2" style="height: 70vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
               <c:if test="${not empty successMessage}">
                   <div class="alert alert-success mt-3" role="alert">
                           ${successMessage}
                   </div>
               </c:if>

                <form method="get" action = "/admin/addcourseSubmit">

                    <div class="mt-3">
                            <label for="courseName" class="form-label">Course</label>
                            <input class="form-control" placeholder="Course Name" type="text" id="course" name="course" required>
                    </div>
                    <div>
                    <button type="submit" class="btn btn-primary mt-4"><b>Add</b></button>
                    </div>

                </form>

                <table class="table table-hover">

                  <tr>
                    <td>Id</td>
                    <td>Course</td>
                  </tr>

                  <c:forEach var="course" items="${courses}">

                     <tr>
                        <td>${course.id}</td>
                        <td>${course.course}</td>
                     </tr>

                  </c:forEach>

                </table>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
