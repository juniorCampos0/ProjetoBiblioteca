<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/20/20
  Time: 10:04 AM
--%>

<%@ page import="com.library.Lending" contentType="text/html;charset=UTF-8" %>
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

        <g:render template="/navBar" model="[lendings: lendings]"/>

        <g:render template="/lateralNavBar"/>

        <div class="wrapper">
            <div class="content-wrapper">
                <div class="content-header">
                    <div class="container-fluid"><!-- container-fluid -->
                        <div class="row mb-2"><!-- row -->
                            <div class="col-sm-6"><!-- col -->
                                <h1 class="m-0 text-dark">User Area</h1>
                                <g:if test="${message != ""}">
                                    <h4>${message}</h4>
                                </g:if>

                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <div class="container-fluid">

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
                                    </ul>
                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->
                        </div>
                        <div class="col-6">
                            <div class="card"> <!-- card -->
                                <div class="card-header"><!-- card-header -->
                                    <h3 class="card-title">Options</h3>
                                </div> <!-- /.card-header -->
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <a href="${g.createLink(controller: 'author', action: 'addAuthor')}">
                                                Register Authors
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <a href="${g.createLink(controller: 'book', action: 'addBook')}">
                                                Register Books
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <a href="${g.createLink(controller: 'label', action: 'addLabel')}">
                                                Register Labels
                                            </a>
                                        </li>
                                        <li class="list-group-item">
                                            <g:link controller='logout'>Logout</g:link>
                                        </li>
                                    </ul>
                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->
                        </div>
                    </div>

                    <div class="row">
                        <div class="col 12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Drop or update Books</h3>
                                </div>

                                <div class="card-body">
                                    <table id="tableBook" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Subtitle</th>
                                            <th>isbn</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${books}" var="book">
                                            <tr>
                                                <td><a href="${g.createLink(controller: 'book', action: 'updateDropBook', params: [book: book.id])}">${book.title}</a></td>
                                                <td>${book.subtitle}</td>
                                                <td>${book.isbn}</td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Title</th>
                                            <th>Subtitle</th>
                                            <th>isbn</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Drop or update Authors</h3>
                                </div>

                                <div class="card-body">
                                    <table id="tableAuthor" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Name</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <g:each in="${authors}" var="author">
                                                <tr>
                                                    <td><a href="${g.createLink(controller: 'author', action: 'updateDropAuthor', params: [author: author.id])}">${author.fullName}</a></td>
                                                </tr>
                                            </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Author</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Drop or update Labels</h3>
                                </div>

                                <div class="card-body">
                                    <table id="tableLabel" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Tag</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${labels}" var="label">
                                            <tr>
                                                <td><a href="${g.createLink(controller: 'label', action: 'updateDropLabel', params: [label: label.id])}">${label.tag}</a></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Author</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="card">
                                <h3 class="card-title">Solicitations of lendings</h3>
                                <div class="card-body">
                                    <table id="tableSolicitation" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Book</th>
                                            <th>Free</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${solicitations}" var="solicitation">
                                            <tr>
                                                <td>${solicitation.user.username}</td>
                                                <td>${solicitation.book.title}"</td>
                                                <td><a class="btn btn-primary" href="${g.createLink(controller: 'lending', action: 'create', params : [book: solicitation.book.id, user: solicitation.user.id, solicitation: solicitation.id])}">Lending</a></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>User</th>
                                            <th>Book</th>
                                            <th>Free</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="card">
                                <h3 class="card-title">
                                    Lendings Actives
                                </h3>
                                <div class="card-body">
                                    <table id="tableLending" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Book</th>
                                            <th>Devolution</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${activeLendings}" var="lending">
                                            <tr>
                                                <td>${lending.user.username}</td>
                                                <td>${lending.book.title}</td>
                                                <td><a class="btn btn-primary" href="${g.createLink(controller: 'lending', action: 'devolution', params : [lending: lending.id])}">Devolution </a></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>User</th>
                                            <th>Book</th>
                                            <th>Devolution</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
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

<asset:javascript src="adminlte.min.js"/>

<!-- AdminLTE for demo purposes -->
<g:external dir="js" src="demo.js"/>

<asset:javascript src="datatables/jquery.dataTables.js"/>

<asset:javascript src="datatables-bs4/js/dataTables.bootstrap4.js"/>

<script>
    $(function () {
        $('#tableBook').DataTable();
        $('#tableAuthor').DataTable();
        $('#tableSolicitation').DataTable();
        $('#tableLabel').DataTable();
        $('#tableLending').DataTable();
    });
</script>

</body>
</html>