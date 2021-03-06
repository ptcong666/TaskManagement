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
                <span style="color: #f1f2f6;">Developer table</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/task">
                <i class="fas fa-fw fa-table"></i>
                <span>Task table</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/team">
                <i class="fas fa-fw fa-table"></i>
                <span>Team table</span></a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">


            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Developer list
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Developer ID</th>
                                <th>Developer Name</th>
                                <th>Team id</th>
                                <%--<th>Team Name</th>--%>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Developer ID</th>
                                <th>Developer Name</th>
                                <th>Team id</th>
                                <%--<th>Team Name</th>--%>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="each" items="${listUser}" varStatus="status">
                                <tr>
                                    <td>${each.id}</td>
                                    <td>${each.name}</td>
                                    <td>${each.teamId}</td>


                                    <td>

                                        <a class="btn btn-warning" href="#"
                                           data-toggle="modal" data-target="#editDev"
                                           onclick="editCurrentDev(${each.id})"><i class="fas fa-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

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





<!-- Edit developer-->
<div class="modal fade" id="editDev" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Change team name for a developer</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-body">
                        <form method="POST" action="${pageContext.request.contextPath}/user/update">
                            <input type="hidden" id="editDevId" name="id">

                            <div class="form-group">
                                <div class="form-label-group">
                                    <input type="text" id="editDeveloperName" name="name" class="form-control"
                                           autofocus="autofocus" readonly>
                                    <label for="editDeveloperName">Developer name</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-label-group">
                                    <p class="titlePragraph">Choose team:</p>
                                    <select id="team_id" type="text" name="team_id"
                                            class="form-control" autofocus="autofocus">
                                        <c:forEach var="team" items="${allTeam}">
                                            <option value="${team.id}">${team.name}</option>
                                        </c:forEach>
                                    </select>
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


<script>
    function editCurrentDev(id) {
        $.get("/user/edit",
            {
                id: id,
            }).done(function (data) {
            $("#editDevId").val(data.id);
            $("#editDeveloperName").val(data.name);
            $("#team_id").value(data.team_id);

        }).fail(function (err) {
            alert("error: " + err);
        });
    }
</script>

</body>

</html>
