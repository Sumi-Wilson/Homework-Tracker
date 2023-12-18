<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section>
    <div class="bg-light2 pt-2 pb-1">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="m-0">Sign In</h2>
            </div>
        </div>
    </div>
</section>

<section class="pt-2 pb-5" style="height: 70vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <!-- the action attribute on the form tag is the URL that the form will submit to when then user clicks the submit button -->
                <form method="post" action="/auth/loginSubmit">

                    <div class="mt-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>

                    <div class="mt-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="text" class="form-control" id="password" name="password">
                    </div>

                    <button type="submit" class="btn btn-primary mt-4">Sign In</button>
                </form>

            </div>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>








