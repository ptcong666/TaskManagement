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
    <link href="resources/css/myStyle.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.0.js"></script>
    <link href="resources/css/myStyle.css" type="text/css" rel="stylesheet">
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
                <span style="color: #f1f2f6;">Task table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="team.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Team table</span></a>
        </li>
    </ul>

    <div id="content-wrapper">
        <a class="btn btn-primary" id="addTeam" name="newTask" href="#"
           data-toggle="modal" data-target="#addNewTask">+</a>
        <div class="container-fluid">


            <!-- DataTables Example -->
            <div class="input-group">
                <label class="finders" for="findUserID">Find By User ID:
                    <input id="findUserID" type="text" pattern="^\d+" title="Enter only number"/>
                </label>
                <div class="input-group-append">
                    <button class="btn btn-primary findButton" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <label class="finders" for="findTeamID">Find By Team ID:
                    <input id="findTeamID" type="text" pattern="^\d+" title="Enter only number"/>
                </label>
                <div class="input-group-append">
                    <button class="btn btn-primary findButton" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <label class="finders">Find task by priority:
                    <select size="1" class="priorities">
                        <option>Select priority</option>
                        <option value="important">Important</option>
                        <option value="regular">Regular</option>
                    </select></label>
                <div class="input-group-append">
                    <button class="btn btn-primary findButton" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>


            <div class="card mb-3">

                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Task list
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Task Name</th>
                                <th>Priority</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Developer ID</th>
                                <th>Team ID</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Task Name</th>
                                <th>Priority</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Developer ID</th>
                                <th>Team ID</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="each" items="${listTask}">
                                <tr <c:if test='${task.status=="completed"}'> class="completed"</c:if>>
                                    <td>${each.name}</td>
                                    <td>${each.priority}</td>
                                    <td>${each.startDate}</td>
                                    <td>${each.endDate}</td>
                                    <td>${each.devID}</td>
                                    <td>${each.teamName}</td>
                                    <td>${each.status}</td>
                                    <td>
                                        <a class="btn btn-warning" href="#' + ${each.id}}"
                                           data-toggle="modal" data-target="#editTask"
                                        onclick="editCurrentTask(${each.id})"><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-danger" href="#'+${each.id}}"
                                           data-toggle="modal" data-target="#deleteModal"
                                        onclick="deleteCurrentTask(${each.id})"><i class="fas fa-trash"></i></a>
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

<!-- New task-->
<div class="modal fade" id="addNewTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add new task</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-body">
                        <form method="POST" action="${pageContext.request.contextPath}/task/add">
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="taskName" name="taskName" class="form-control"
                                           required="required"
                                           autofocus="autofocus">
                                    <label for="taskName">Task name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <p class="titlePragraph">Choose priority of a task:</p>
                                    <select id="inputPriority" type="text" id="inputPriority" name="priority"
                                            class="form-control" autofocus="autofocus">
                                        <option value="important">Important</option>
                                        <option value="regular">Regular</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="date" id="inputStartDate" name="startDate" class="form-control"
                                           required="required" autofocus="autofocus">
                                    <label for="inputStartDate">Start date</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="date" id="inputEndDate" name="startDate" class="form-control"
                                           required="required" autofocus="autofocus">
                                    <label for="inputEndDate">End date</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="inputDeveloperId" name="inputDevId" class="form-control"
                                           required="required" pattern="\d+" title="only number">
                                    <label for="inputDeveloperId">Developer id</label>
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




<!-- Edit task-->
<div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit task</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-body">
                        <form method="POST" action="${pageContext.request.contextPath}/task/edit">
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="taskEditName" name="taskName" class="form-control"
                                           required="required"
                                           autofocus="autofocus">
                                    <label for="taskEditName">Task name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <p class="titlePragraph">Choose priority of a task:</p>
                                    <select id="editPriority" type="text" name="priority"
                                            class="form-control" autofocus="autofocus">
                                        <option value="important">Important</option>
                                        <option value="regular">Regular</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="date" id="editStartDate" name="startDate" class="form-control"
                                           required="required" autofocus="autofocus">
                                    <label for="inputStartDate">Start date</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="date" id="editEndDate" name="startDate" class="form-control"
                                           required="required" autofocus="autofocus">
                                    <label for="inputEndDate">End date</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editDeveloperId" name="inputDevId" class="form-control"
                                           required="required" pattern="\d+" title="only number">
                                    <label for="editDeveloperId">Developer id</label>
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


<!-- Delete task Modal-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteLabel">Delete task</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Are you sure you want to delete this task?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a id="deleteTaskBtn" class="btn btn-danger" href="tasks.jsp">Delete</a>
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

<script
        src="https://code.jquery.com/jquery-3.4.0.js"></script>

<script>
    function deleteCurrentTask(id) {
        $("#deleteTaskBtn").click(function () {
            $.post("/task/delete",
                {
                    id: id,
                }).done(function (data) {
                $("#task_" + id).remove();
                $("#deleteModal").toggle();
            }).fail(function (err) {
                alert("error: " + err);
            });
        })
    }

    function editCurrentTask(id) {
        $.get("/task/edit",
            {
                id: id,
            }).done(function (data) {
            $("#task_" + id).remove();
            $("#deleteModal").toggle();
        }).fail(function (err) {
            alert("error: " + err);
        });
    }
</script>
</body>

</html>
