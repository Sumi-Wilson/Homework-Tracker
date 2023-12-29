
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-1 pb-1" style="background-color: #F2FAFF; border: 1px solid #056EB9; border-radius: 15px; width: 97%; margin-left: 15px;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Sign Up</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-2 pb-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
              <c:if test="${not empty errorMessage}">
                     <div class="alert alert-danger mt-3" role="alert">
                                ${errorMessage}
                     </div>
              </c:if>
                <!-- the action attribute on the form tag is the URL that the form will submit to when then user clicks the submit button -->
                <form method="get" action="/auth/registerSubmit" style="padding-bottom: 10px; padding-left: 15px; padding-right: 15px; border: 1px solid #ccc; border-radius: 10px; background-color: #F2FAFF;">

                    <div class="mt-1">
                        <label for="userType" class="form-label">User Type</label>
                        <select class="form-select" id="userType" name="userType" value="${form.userType}" >
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

                    <div class="mt-1">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="First Name" name="firstName" value="${form.firstName}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('firstName')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('firstName')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-1">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" id="lastName" name="lastName" value="${form.lastName}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('lastName')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('lastName')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-1">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" placeholder="Email" id="email" name="email" aria-describedby="emailHelp" value="${form.email}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('email')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('email')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-1">
                        <label for="password" class="form-label">Password</label>
                        <input type="text" class="form-control" placeholder="Password" id="password" name="password" value="${form.password}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('password')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('password')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-1">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="text" class="form-control" placeholder="Confirm Password" id="confirmPassword" name="confirmPassword" value="${form.confirmPassword}">
                    </div>
                    <c:if test="${errors.hasFieldErrors('confirmPassword')}">
                        <div style="color:red">
                            <c:forEach items="${errors.getFieldErrors('confirmPassword')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div class="mt-1">
                        <label for="agree-terms">
                        <input type="checkbox" id="agree-terms" name="agree-terms" required>
                        By signing up, you agree to our <a href="/privacy-policy">Privacy Policy</a> and
                        <a href="/terms-of-use"> Terms and Conditions</a>
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
</section>
<br>
<jsp:include page="../include/footer.jsp"/>








