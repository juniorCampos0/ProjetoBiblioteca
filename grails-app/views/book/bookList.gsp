<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/17/20
  Time: 4:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Library</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <g:external dir="css" file="fontawesome-free/css/all.css"/>

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!-- iCheck -->
    <asset:link rel="stylesheet" href="icheck-bootstrap/icheck-bootstrap.min.css" type="text/css"/>

    <!-- Theme style -->
    <g:external dir="css" file="adminlte.min.css"/>

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- DataTables -->
    <asset:javascript src="datatables-bs4/css/dataTables.bootstrap4.css"/>

    <asset:link rel="icon" href="logo.png"/>


</head>
<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">

    <!-- Navbar -->
    <g:render  template="/navBar"/>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <g:render template="/lateralNavBar"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <!-- Left col -->
            <section class="col-lg-12  col-12 connectedSortable">
                <!-- TO DO List -->
                <div class="col-12">

                    <div class="card"><!-- card-->
                        <div class="card-header col-12"> <!-- /.card-header -->
                            <h3 class="card-title">Books on library</h3>
                        </div> <!-- /.card-header -->
                        <div class="card-body"> <!-- /.card-body -->
                            <g:render template="/dataTable"/>
                        </div> <!-- /.card-body -->
                    </div> <!-- /.card -->

                </div>
                <!-- /.card -->
            </section>
            <!-- /.Left col -->
        </section>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

<g:render template="/footer"/>

    <!-- jQuery -->
    <asset:javascript src="jquery/jquery.min.js"/>

    <!-- Bootstrap 4 -->
    <asset:javascript src="bootstrap/js/bootstrap.bundle.min.js"/>

    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>

    <!-- AdminLTE App -->
    <asset:javascript src="pages/dashboard.js"/>

    <asset:javascript src="adminlte.js"/>

    <!-- AdminLTE for demo purposes -->
    <g:external dir="js" src="demo.js"/>

    <asset:javascript src="datatables/jquery.dataTables.js"/>

    <asset:javascript src="datatables-bs4/js/dataTables.bootstrap4.js"/>

    <script>
        $(function () {
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
            });
        });
    </script>

</body>
</html>
