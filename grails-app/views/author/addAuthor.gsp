<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/19/20
  Time: 6:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> Add Author</title>
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
    <asset:link href="datatables-bs4/css/dataTables.bootstrap4.css" rel="text/stylesheet"/>

    <asset:link rel="icon" href="logo.png"/>

</head>

    <body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <g:render template="/navBar"/>

        <g:render template="/lateralNavBar"/>



        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">New Author</h1>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-6">
                        <div class="card">
                            <!-- /.card-header -->
                            <div class="card-body">
                                <p class="success">${message}</p>
                                <g:form controller="author" action="createAuthor">
                                    <div class="form-group">
                                        <label for="fullName">Full name:</label><br>
                                        <g:field  required="" class="form-control" id="fullName" type="text" name="fullName" placeholder="Input author full name"/><br>
                                    </div>
                                    <g:submitButton class="btn btn-primary" name="createAuthor"/>
                                </g:form>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>

                </div>
            </div>
        </div>
        <g:render template="/footer"/>
    </div>

    <!-- jQuery UI 1.11.4 -->
    <asset:javascript src="jquery-ui/jquery-ui.min.css"/>

    <!-- jQuery -->
    <asset:javascript src="jquery/jquery.min.js"/>

    <!-- Bootstrap 4 -->
    <asset:javascript src="bootstrap/js/bootstrap.bundle.min.js"/>

    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>

    <!-- Sparkline -->
    <asset:javascript src="sparklines/sparkline.js"/>

    <!-- AdminLTE App -->
    <asset:javascript src="pages/dashboard.js"/>

    <asset:javascript src="adminlte.js"/>

    <!-- AdminLTE for demo purposes -->
    <g:external dir="js" src="demo.js"/>

    <asset:javascript src="datatables/jquery.dataTables.js"/>

    <asset:javascript src="datatables-bs4/js/dataTables.bootstrap4.js"/>

    <script>
        $(function () {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
            });
        });
    </script>

    </body>

</html>