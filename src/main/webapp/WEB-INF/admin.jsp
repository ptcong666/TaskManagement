<%--
  Created by IntelliJ IDEA.
  User: 986952
  Date: 4/20/2019
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Dashboard</title>

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

    <!-- Page level plugin JavaScript-->
    <script src="../resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin.js"></script>

    <!-- Demo scripts for this page-->
    <script src="../resources/js/demo/datatables-demo.js"></script>

</head>
<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">Admin dashboard</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger">9+</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-danger">7</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Tables</li>
            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Users list
                </div>
                <div class="card-body">
                    <div class="btn-add">
                        <%--<button class="btn btn-primary btn-block">+</button>--%>
                        <a class="btn btn-primary btn-block btn-add" href="#" data-toggle="modal"
                           data-target="#newModal">+</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${listUser}">
                                <tr id="user_${item.id}">
                                    <td>${item.name}</td>
                                        <%--<td></td>--%>
                                    <td>${item.email}</td>
                                    <td>${item.address}</td>
                                        <%--<td></td>--%>
                                    <td>${item.phone}</td>
                                        <%--<td></td>--%>
                                    <td>${item.roles}</td>
                                    <td>
                                        <button class="btn btn-sm btn-edit"><i class="fas fa-edit"></i></button>
                                        <a class="btn btn-sm btn-delete" onclick="deleteCurrentUser(${item.id})" href="#"
                                           data-toggle="modal" data-target="#deleteModal"><i
                                                class="fas fa-trash"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>--%>
            </div>

            <%--<p class="small text-center text-muted my-5">--%>
            <%--<em>More table examples coming soon...</em>--%>
            <%--</p>--%>

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © WAP April</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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
                <a class="btn btn-primary" href="WEB-INF/login.jsp">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- New user Modal-->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newModalLabel">Add new user</h5>
                <button class="close" type="button" data-dismiss="modal" aria-lab el="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-login mx-auto">
                    <div>
                        <form method="POST" action="${pageContext.request.contextPath}/user/insert">
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="name" id="inputName" class="form-control"
                                           placeholder="Name" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="inputName">Full name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="address" id="inputAddress" class="form-control"
                                           placeholder="Address" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="inputAddress">Address</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="phone" id="inputPhone" class="form-control"
                                           placeholder="Address" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="inputPhone">Phone</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="email" id="inputEmail" class="form-control"
                                           placeholder="Email" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="inputEmail">Email address</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="password" name="password" id="inputPassword" class="form-control"
                                           placeholder="Password" required="required" autocomplete="new-password">
                                    <label for="inputPassword">Password</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <select name="roles" class="form-control">
                                    <option value="ADMIN">Admin</option>
                                    <option value="MANAGER">Project manager</option>
                                    <option value="DEVELOPER">Developer</option>
                                </select>
                            </div>
                            <div class="modal-buttons">
                                <input class="btn btn-primary" type="submit" value="Add"/>
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Edit user Modal-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Add new user</h5>
                <button class="close" type="button" data-dismiss="modal" aria-lab el="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-login mx-auto">
                    <div>
                        <form method="POST" action="${pageContext.request.contextPath}/user/update">
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="name" id="editName" class="form-control"
                                           placeholder="Name" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="editName">Full name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="address" id="editAddress" class="form-control"
                                           placeholder="Address" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="editAddress">Address</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="phone" id="editPhone" class="form-control"
                                           placeholder="Address" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="editPhone">Phone</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" name="email" id="editEmail" class="form-control"
                                           placeholder="Email" required="required" autofocus="autofocus"
                                           autocomplete="on">
                                    <label for="editEmail">Email address</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="password" name="password" id="inputPassword" class="form-control"
                                           placeholder="Password" required="required" autocomplete="new-password">
                                    <label for="inputPassword">Password</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <select name="roles" class="form-control">
                                    <option value="ADMIN">Admin</option>
                                    <option value="MANAGER">Project manager</option>
                                    <option value="DEVELOPER">Developer</option>
                                </select>
                            </div>
                            <div class="modal-buttons">
                                <input class="btn btn-primary" type="submit" value="Add"/>
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Delete user Modal-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteLabel">Delete user</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Are you sure you want to delete this user?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a id="deleteUserBtn" class="btn btn-danger" href="#">Delete</a>
            </div>
        </div>
    </div>
</div>


<script>
    function deleteCurrentUser(id) {
        $("#deleteUserBtn").click(function () {
            $.post("/user/delete",
                {
                    id: id,
                }).done(function (data) {
                    $("#user_" + id).remove();
                    $("#deleteModal").toggle();
                }).fail(function (err) {
                    alert("error: " + err);
                });
        })
    }

    function editCurrentUser(id) {
            $.get("/user/edit",
                {
                    id: id,
                }).done(function (data) {
                $("#user_" + id).remove();
                $("#deleteModal").toggle();
            }).fail(function (err) {
                alert("error: " + err);
            });
    }
</script>

</body>
</html>
