<%--
  Created by IntelliJ IDEA.
  User: DmaC
  Date: 4/23/2019
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="../resources/css/main.css"/>">
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="/user">
        <% String menu = request.getParameter("pageName");%>
        <%= menu %>
    </a>

    <c:if test='${menu=="Manager dashboard"}'>
        <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>
    </c:if>

    <!-- Navbar Search -->
    <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <span class="navbar-brand">Welcome!</span>
    </div>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow">
            <a style="color:#ffffff" href="#" role="button" data-toggle="modal" data-target="#logoutModal"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </li>
    </ul>

</nav>


<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a onclick="logout()" class="btn btn-primary" href="#">Logout</a>
            </div>
        </div>
    </div>
</div>

<script>
    function logout() {
        $.post("/logout")
            .done(function () {
                $("#logoutModal").modal('hide');
                window.location.href = "/login.jsp";
            }).fail(function (err) {
                console.log("Error:" + err);
            });
    }
</script>

</body>
</html>
