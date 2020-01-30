<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/20/20
  Time: 10:04 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home: ${user.nome}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" style="padding-bottom: 30px">

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

    <g:render template="/navBar" model="[books: lendings]"/>

    <g:render template="/lateralNavBar" model="[books: books, user: user]"/>

    <div class="wrapper">
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="row mb-2"><!-- row -->
                    <div class="col-sm-6"><!-- col -->
                        <h1 class="m-0 text-dark">User Area</h1>
                        <g:if test="${message != ""}">
                            <h4>${message}</h4>
                        </g:if>
                    </div><!-- /.col -->
                </div><!-- /.row -->
                <div class="row">
                    <div class="col-6">
                        <div class="card"> <!-- card -->
                            <div class="card-header"><!-- card-header -->
                                <h3 class="card-title">User Data</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">UserName: ${user.username}</li>
                                    <li class="list-group-item">Name: ${user.nome}</li>
                                    <li class="list-group-item">Phone Number: ${user.telefone}</li>
                                    <li class="list-group-item">Site: ${user.endereco}</li>
                                    <li class="list-group-item">
                                        <g:link controller='logout'>Logout</g:link>
                                    </li>
                                </ul>
                            </div> <!-- /.card-body -->
                        </div> <!-- /.card -->
                    </div>
                    <div class="col-6">
                        <div class="card"> <!-- card -->
                            <div class="card-header">
                                <div class="card-title">
                                    <h3>Lendings</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <g:each in="${lendings}" var="lending">
                                        <li class="list-group-item">
                                            <a href="${g.createLink(controller: 'book', action: 'bookView', params: [user: user, idBookSearched: lending?.id, books: Book?.list()])}">
                                                ${lending?.title}: ${lending?.subtitle}
                                            </a>
                                        </li>
                                    </g:each>
                                </ul>
                            </div> <!-- /.card-body -->
                        </div> <!-- /.card -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card"> <!-- card -->
                            <div class="card-header"><!-- card-header -->
                                <h3 class="card-title">History</h3><!-- card-title -->
                            </div> <!-- /.card-header -->
                            <div class="card-body"> <!-- card-body -->
                                    <table id="example3" class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Subtitle</th>
                                            <th>Lending</th>
                                            <th>Devolution</th>
                                            <th>active</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${books}" var="lending">
                                            <tr>
                                                <td>${lending.book.title}</td>
                                                <td>${lending.book.subtitle}</td>
                                                <td>${lending.lending}</td>
                                                <td>${lending.devolution}</td>
                                                <td>
                                                    <g:if test="${lending?.active}">Yes</g:if><g:else>No</g:else></li>
                                                </td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Title</th>
                                            <th>Subtitle</th>
                                            <th>Lending</th>
                                            <th>Label</th>
                                            <th>Active</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                            </div> <!-- /.card-body -->
                        </div> <!-- /.card -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card"> <!-- card -->
                            <div class="card-header"><!-- card-header -->
                                <h3 class="card-title">Sugestions</h3><!-- card-title -->
                            </div> <!-- /.card-header -->
                            <div class="card-body"> <!-- card-body -->
                                <g:render template="/dataTable" model="[books: recomendation]"/>
                            </div> <!-- /.card-body -->
                        </div> <!-- /.card -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<g:render template="/footer"/>

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

<asset:javascript src="adminlte.js"/>

<!-- AdminLTE for demo purposes -->
<g:external dir="js" src="demo.js"/>

<asset:javascript src="datatables/jquery.dataTables.js"/>

<asset:javascript src="datatables-bs4/js/dataTables.bootstrap4.js"/>

<script>
    $(function () {
        $('#example3').DataTable();
        $('#example4').DataTable();
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