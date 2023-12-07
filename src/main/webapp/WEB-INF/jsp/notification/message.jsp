<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

</head>
<body>
    <section>
        <div class="bg-light2 pt-5 pb-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="m-0">Message Insertion</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="pt-5 pb-5">
        <div class="container">
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
                               <input type="text" class="form-control" id="message" name="message" value="${form.message}">
                       </div>
                       <div class="mt-3">
                             <label for="expiryDate" class="form-label">Expiry Date</label>
                             <input type="date" class="form-control" id="expirydate" name="expiryDate" value="${form.expiryDate}">
                       </div>
                       <button type="submit" class="btn btn-primary mt-4">Submit</button>
</body>
</html>