<%--
  Created by IntelliJ IDEA.
  User: ikhbayar
  Date: 2019-04-20
  Time: 15:29
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

    <title>Developer page</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <script src="../resources/js/forDeveloper.js" type="text/javascript"></script>


    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="../resources/vendor/chart.js/Chart.min.js"></script>
    <script src="../resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="../resources/js/demo/datatables-demo.js"></script>
    <script src="../resources/js/demo/chart-area-demo.js"></script>
    <style>
        .completed {
            background-color: #1dd1a1;
        }
        .hidebtn{
            visibility: hidden;
        }
    </style>
</head>

<body id="page-top">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="developer">Welcome ${user.name}!</a>


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
    <ul class="sidebar navbar-nav" hidden>
        <li class="nav-item">
            <a class="nav-link" href="../tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tasks</span></a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Your task list
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <form action="task/developer" method="get">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Task Name</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Task Name</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="task" items="${listTask}">
                                    <tr <c:if test='${task.status=="completed"}'> class="completed"</c:if>>
                                        <td>${task.name}</td>
                                        <td id="taskStatus_${task.id}">${task.status}</td>
                                        <td>${task.priority}</td>
                                        <td>${task.startDate}</td>
                                        <td>${task.endDate}</td>
                                        <td <c:if test='${task.status=="completed"}'>class="hidebtn"</c:if>>
                                            <a class="btn btn-warning" data-toggle="modal"
                                               data-target="#editTask"
                                               onclick="editCurrentTask(${task.id})">Mark as complete</a>


                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- Sticky Footer -->
        <footer class="sticky-footer" style="position: absolute; left: 0px; width: 100%;">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Task Management</span>
                </div>
            </div>
        </footer>

    </div>

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
                <a class="btn btn-primary" href="../logout">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Edit task as complete-->
<div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Are you sure?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Task status would be changed as completed.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" id="editTaskBtn">Change</a>
            </div>
        </div>
    </div>
</div>

<script>
    function editCurrentTask(id) {
        $("#editTaskBtn").click(function () {
            $.get("/task/complete",
                {
                    task_id: id,
                    status: "completed"
                })
                .done(function (data) {
                    $("#taskStatus_" + id).html("completed");
                    $("#editTask").modal("hide");
                })
                .fail(function (err) {
                    // $("#taskStatus_"+id).html("completed");
                    // $("#editTask").modal("hide");
                    // alert("error: " + err);
                });
        })

    }

</script>
</body>

</html>
