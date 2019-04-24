<%--
  Created by IntelliJ IDEA.
  User: ikhbayar
  Date: 2019-04-20
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>Project manager page</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <link href="../resources/css/myStyle.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/forDeveloper.js" type="text/javascript"></script>
</head>

<body id="page-top">

<jsp:include page="_nav.jsp">
    <jsp:param name="pageName" value="Manager dashboard"/>
</jsp:include>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">

        <li class="nav-item">
            <a class="nav-link" href="/user/manager">
                <i class="fas fa-fw fa-table"></i>
                <span>Developer table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/task">
                <i class="fas fa-fw fa-table"></i>
                <span>Task table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/team">
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

                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Team Id</th>
                                <th>Team Name</th>

                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="team" items="${listTeam}" varStatus="status">
                                <tr id="team_${team.id}">
                                    <td>${team.id}</td>
                                    <td>${team.name}</td>
                                    <td>
                                        <a class="btn btn-warning" href="#"
                                           data-toggle="modal" data-target="#editTeam"
                                        onclick="editCurrentTeam(${team.id})"><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-danger" href="#"
                                           data-toggle="modal" data-target="#deleteModal"
                                           onclick="deleteCurrentTeam(${team.id})"><i
                                                class="fas fa-trash"></i></a>
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


<!-- Add Team-->
<div class="modal fade" id="addNewTeam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
                        <form method="POST" action="${pageContext.request.contextPath}/team/insert">

                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="inputName" name="name" class="form-control"
                                           required="required" autofocus="autofocus">
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
<div class="modal fade" id="editTeam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
                        <form method="POST" action="${pageContext.request.contextPath}/team/update">
                            <input type="hidden" id="editId" name="editId">

                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editName" name="editName" class="form-control"
                                           required="required" autofocus="autofocus">
                                    <label for="editName">Team name</label>
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
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
                <a id="deleteTeamBtn" class="btn btn-danger" href="team.jsp">Delete</a>
            </div>
        </div>
    </div>
</div>

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


<script>

    function deleteCurrentTeam(id) {
        console.log(id);
        $("#deleteTeamBtn").click(function () {
            $.post("/team/delete",
                {
                    id: id,
                }).done(function (data) {
                $("#team_" + id).remove();
                $("#deleteModal").modal("hide");
            }).fail(function (err) {
                alert("error: " + err);
            });
        })
    }


    function editCurrentTeam(id) {
        $.get("/team/edit",
            {
                id: id,
            }).done(function (data) {
                console.log(data);
            $("#editId").val(data.id);
            $("#editName").val(data.name);


        }).fail(function (err) {
            console.log("err");
            alert("error: " + err);
        });
    }
</script>

</body>

</html>
