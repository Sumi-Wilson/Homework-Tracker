<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-2" style="background-color: #F2FAFF; border: 1px solid #056EB9; border-radius: 15px; width: 97%; margin-left: 15px;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Add Course</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-4 pb-2" style="height: 72vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">

               <c:if test="${not empty successMessage}">
                   <div class="alert alert-success mt-3" role="alert">
                           ${successMessage}
                   </div>
               </c:if>

                <c:if test="${not empty errorMessage}">
                     <div class="alert alert-danger mt-3" role="alert">
                             ${errorMessage}
                     </div>
                 </c:if>

                <form method="get" action = "/admin/addcourseSubmit" style="padding-left: 15px; padding-right: 15px; border: 1px solid #ccc; border-radius: 10px; background-color: #F2FAFF;">

                    <div class="mt-3">
                            <label for="courseName" class="form-label">Course</label>
                            <input class="form-control" placeholder="Course Name" type="text" id="course" name="courseName" >
                    </div>
                    <c:if test="${errors.hasFieldErrors('courseName')}">
                         <div style="color:red">
                               <c:forEach items="${errors.getFieldErrors('courseName')}" var="error">
                                          ${error.defaultMessage}<br>
                               </c:forEach>
                         </div>
                    </c:if>
                    <div>
                    <button type="submit" class="btn btn-primary mt-4 pb-2"><b>Add Course</b></button>
                    <br><br>
                    </div>

                </form>


            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>
