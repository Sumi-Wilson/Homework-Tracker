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

<section class="pt-2 pb-2">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <form method="get" action = "/admin/courseAdd">
                    <div class="mt-3">
                            <label for="courseName" class="form-label">Course</label>
                            <input class="form-control" placeholder="Course Name" type="text" id="course" name="course" required>
                    </div>
                    <button type="submit" class="btn btn-primary mt-4"><b>Add</b></button>
                </form>
            </div>


<table>
                <tr>
                    <td>Id</td>
                    <td>Course</td>
                </tr>
                <c:forEach items="${parents}" var="parent">
                    <tr>
                        <td>${parent.id}----</td>
                        <td>${parent.firstName}-------</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
