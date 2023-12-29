<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-2" style="background-color: #F2FAFF; border: 1px solid #056EB9; border-radius: 15px; width: 97%; margin-left: 15px;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">${empty form.id ? 'Add' : 'Edit'} Homework</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-3 pb-1" style="height: 71vh;">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-6">
            <c:if test="${not empty success}">
                <div class="alert alert-success mt-1" role="alert"> ${success} </div>
            </c:if>


         <form method="get" action="/student/assignmentAdd" style="padding-bottom: 10px; padding-left: 15px; padding-right: 15px; border: 1px solid #ccc; border-radius: 10px; background-color: #F2FAFF;">

            <input type="hidden" name ="id" value="${form.id}">

                 <div class="mt-3">
                        <label for="status" class="form-label">Status</label>
                        <select  class="form-select"id="status" name="status">
                             <option value="To Do" ${form.status eq 'To Do' ? 'selected' : ''}>To Do</option>
                              <option value="In-Progress" ${form.status eq 'In-Progress' ? 'selected' : ''}>In-Progress</option>
                               <option value="Done" ${form.status eq 'Done' ? 'selected' : ''}>Done</option>
                        </select>
                        <c:if test="${errors.hasFieldErrors('status')}">
                           <div style="color:red">
                                <c:forEach items="${errors.getFieldErrors('status')}" var="error">
                                        ${error.defaultMessage}<br>
                                </c:forEach>
                           </div>
                        </c:if>


                       <label for="course" class="form-label">Course</label>
                       <select class="form-select"id="course" name="course">
                            <c:forEach var="course" items="${courses}">
                                <option value="${course.course}" ${course.course eq form.course ? 'selected' : ''}>${course.course}</option>
                            </c:forEach>
                       </select>
                       <c:if test="${errors.hasFieldErrors('course')}">
                             <div style="color:red">
                                 <c:forEach items="${errors.getFieldErrors('course')}" var="error">
                                          ${error.defaultMessage}<br>
                                 </c:forEach>
                             </div>
                       </c:if>

                       <label for="homework" class="form-label">Homework</label>
                       <input class="form-control" placeholder="Enter your homework" type="text" id="task" name="homework" value="${form.homework}" required>

                       <c:if test="${errors.hasFieldErrors('homework')}">
                            <div style="color:red">
                                <c:forEach items="${errors.getFieldErrors('homework')}" var="error">
                                    ${error.defaultMessage}<br>
                                </c:forEach>
                            </div>
                       </c:if>


                       <label for="dueDate" class="form-label">Due Date</label>
                       <input class="form-control" type="date" id="dueDate" name="dueDate" value="${form.dueDate}" required >
                        <c:if test="${errors.hasFieldErrors('dueDate')}">
                            <div style="color:red">
                                <c:forEach items="${errors.getFieldErrors('dueDate')}" var="error">
                                    ${error.defaultMessage}<br>
                                </c:forEach>
                            </div>
                       </c:if>

                       <div class="row justify-content-center pt-1">
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary mt-4">
                               <b>${empty form.id ? 'Add' : 'Edit'} Homework</b>
                            </button>
                       </div>
                      </div>

                 </div>
         </form>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../include/footer.jsp"/>