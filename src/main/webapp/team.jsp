<%--
  Created by IntelliJ IDEA.
  User: ikhbayar
  Date: 2019-04-20
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Project manager page</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <link href="resources/css/myStyle.css" rel="stylesheet" type="text/css">
    <script src="resources/js/forDeveloper.js" type="text/javascript"></script>
</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="manager.jsp">Welcome ${manager.name}</a>

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
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
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
            <a class="nav-link" href="manager.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Developer table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="tasks.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Task table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="team.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span style="color: #f1f2f6;">Team table</span></a>
        </li>
    </ul>

    <div id="content-wrapper">
        <a class="btn btn-primary" id="addTeam" name="newTeam" href="#" data-toggle="modal" data-target="#addNewTeam">
            +</a>
        <div class="container-fluid">


            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Team list

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Team Id</th>
                                <th>Team Name</th>
                                <th>Total Developers</th>
                                <th>Total Tasks</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Team Id</th>
                                <th>Team Name</th>
                                <th>Total Developers</th>
                                <th>Total Tasks</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="each" items="${teams}">
                                <tr>
                                    <td>${each.id}</td>
                                    <td>${each.id}</td>
                                    <td>${each.id}</td>
                                    <td>${each.id}</td>
                                    <td>
                                        <a class="btn btn-warning" href="#" + ${each.id}
                                           data-toggle="modal" data-target="#editTeam"><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-danger" href="#"+${each.id}
                                           data-toggle="modal" data-target="#deleteModal"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Task Management</span>
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
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Add Team-->
<div class="modal fade" id="addNewTeam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add new team</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-body">
                        <form method="POST" action="${pageContext.request.contextPath}/team/add">

                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="inputName" name="email" class="form-control" required="required" autofocus="autofocus">
                                    <label for="inputName">Team name</label>
                                </div>
                            </div>
                            <input class="btn btn-primary btn-block" type="submit" value="Add & Save"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Edit team-->
<div class="modal fade" id="editTeam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editLabel">Edit team</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-body">
                        <form method="POST" action="${pageContext.request.contextPath}/team/edit">
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editID" name="teamId" class="form-control" required="required"
                                           autofocus="autofocus" pattern="\d+" title="only number" readonly value="${team.id}">
                                    <label for="editID">Team id</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editName" name="email" class="form-control"
                                           required="required" autofocus="autofocus" value="${team.name}">
                                    <label for="editName">Team name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editDevelopers" name="totalDev" class="form-control"
                                           required="required" autofocus="autofocus" pattern="\d+"
                                           title="only number" readonly value="${team.totalDev}">
                                    <label for="editDevelopers">Total developers</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="totalTask" name="totalTasks" class="form-control"
                                           required="required" autofocus="autofocus"
                                           pattern="\d+" title="only number" readonly value="${team.totalTask}">
                                    <label for="totalTask">Total tasks</label>
                                </div>
                            </div>
                            <input class="btn btn-primary btn-block" type="submit" value="Edit & Save"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Delete team Modal-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteLabel">Delete team</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Are you sure you want to delete this team?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a id="deleteUserBtn" class="btn btn-danger" href="team.jsp">Delete</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="resources/vendor/chart.js/Chart.min.js"></script>
<script src="resources/vendor/datatables/jquery.dataTables.js"></script>
<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="resources/js/demo/datatables-demo.js"></script>
<script src="resources/js/demo/chart-area-demo.js"></script>

</body>

</html>
