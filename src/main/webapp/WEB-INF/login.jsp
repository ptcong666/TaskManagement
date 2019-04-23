<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Login</title>

  <!-- Custom fonts for this template-->
  <link rel="stylesheet" href="<c:url value="../resources/vendor/fontawesome-free/css/all.min.css"/>">

  <!-- Custom styles for this template-->
  <link rel="stylesheet" href="<c:url value="../resources/css/sb-admin.css"/>">
  <link rel="stylesheet" href="<c:url value="../resources/css/main.css"/>">

  <!-- Bootstrap core JavaScript-->
  <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</head>

<div id="pageloader">
  <img src="http://cdnjs.cloudflare.com/ajax/libs/semantic-ui/0.16.1/images/loader-large.gif" alt="processing..." />
</div>

<body class="bg-dark">


  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form id="loginForm" method="POST" action="${pageContext.request.contextPath}/login">
          <div class="form-group">
            <c:if test="${not empty errorMessage}">
              <div class="err-msg"><c:out value="${errorMessage}"/></div>
            </c:if>
            <div class="form-label-group">
              <input type="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" id="inputEmail" name="email" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>
          <input class="btn btn-primary btn-block" type="submit" value="Login" />
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="../register.html">Register an Account</a>
          <a class="d-block small" href="../forgot-password.html">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>

  <script>
    $(document).ready(function(){
      $("#loginForm").on("submit", function(){
        $("#pageloader").fadeIn();
      });//submit
    });//document ready
  </script>

</body>

</html>
