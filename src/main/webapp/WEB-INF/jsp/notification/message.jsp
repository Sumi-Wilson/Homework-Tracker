<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

    <section>
        <div class="bg-light2 pt-2 pb-2">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="m-0">Send Alert</h2>
                </div>
            </div>
        </div>
    </section>

    <section class="pt-2 pb-5">
        <div class="container" style="height: 62vh;">
            <div class="row justify-content-center">
                <div class="col-6">
                    <c:if test="${not empty successMessage}">
                           <div class="alert alert-success mt-3" role="alert">
                                ${successMessage}
                           </div>
                    </c:if>

                    <form method="get" action="/notification/messageSubmit">
                       <div class="mt-3">
                            <label for="message" class="form-label">Message</label>
                               <input type="text" class="form-control" id="message" name="message" value="${form.message}" required>
                       </div>
                       <div class="mt-3">
                             <label for="expiryDate" class="form-label">Expiry Date</label>
                             <input type="date" class="form-control" id="expirydate" name="expiryDate" value="${form.expiryDate}" required>
                       </div>
                       <button type="submit" class="btn btn-primary mt-4">Send Alert</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="../include/footer.jsp"/>