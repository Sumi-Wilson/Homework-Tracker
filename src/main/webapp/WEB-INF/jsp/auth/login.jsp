<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-2" style="background-color: #F2FAFF; border: 1px solid #056EB9; border-radius: 15px; width: 97%; margin-left: 15px;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Sign In</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-3 pb-3" style="height: 71vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <!-- the action attribute on the form tag is the URL that the form will submit to when then user clicks the submit button -->

                <c:if test="${param['error'] eq ''}">
                    <div class="alert alert-danger w-100 mb-0">Invalid Username or Password</div>
                </c:if>
<br>
                <form method="post" action="/auth/loginSubmit" style="padding-bottom: 10px; padding-left: 15px; padding-right: 15px; border: 1px solid #ccc; border-radius: 10px; background-color: #F2FAFF;">

                    <div class="mt-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" placeholder="Username" id="username" name="username" required>
                    </div>

                    <div class="mt-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" placeholder="Password" id="password" name="password" required>
                    </div>

                    <button type="submit" class="btn btn-primary mt-4">Sign In</button>
                </form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>








