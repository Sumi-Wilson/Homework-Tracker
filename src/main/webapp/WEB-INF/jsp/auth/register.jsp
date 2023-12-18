
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-1 pb-0">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Sign Up</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-0 pb-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <!-- the action attribute on the form tag is the URL that the form will submit to when then user clicks the submit button -->
                <form method="get" action="/auth/registerSubmit">

                    <div class="mt-2">
                        <label for="userType" class="form-label">User Type</label>
                        <select class="form-control" id="userType" name="userType" value="${form.userType}" required>
                        <option value="">Are you a student or parent?</option>
                        <option value="Student">Student</option>
                        <option value="Parent">Parent</option>
                        </select>
                    </div>
                    <c:if test="${errors.hasFieldErrors('userType')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('userType')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-2">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${form.firstName}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('firstName')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('firstName')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-2">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" value="${form.lastName}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('lastName')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('lastName')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-2">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" value="${form.email}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('email')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('email')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-2">
                        <label for="password" class="form-label">Password</label>
                        <input type="text" class="form-control" id="password" name="password" value="${form.password}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('password')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('password')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-2">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="text" class="form-control" id="confirmPassword" name="confirmPassword" value="${form.confirmPassword}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('confirmPassword')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('confirmPassword')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <button type="submit" class="btn btn-primary mt-3">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
</section>
<br>
<jsp:include page="../include/footer.jsp"/>








