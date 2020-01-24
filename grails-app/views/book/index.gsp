<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/19/20
  Time: 6:35 PM
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
	<asset:link href="datatables-bs4/css/dataTables.bootstrap4.css" rel="text/stylesheet"/>

	<asset:link rel="icon" href="logo.png"/>

</head>

<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">

	<g:render template="/navBar"/>

	<g:render template="/lateralNavBar"/>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0 text-dark">Books</h1>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-6 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3>${books.size()}</h3>
								<p>Books</p>
							</div>
							<div class="icon">
								<i class="nav-icon fas fa-book"></i>
							</div>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-6 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3>${authors.size()}</h3>
								<p>Authors</p>
							</div>
							<div class="icon">
								<i class="nav-icon fas fa-users"></i>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-12  col-12 connectedSortable">
						<!-- Custom tabs (Charts with tabs)-->
						<!-- TO DO List -->
						<div class="col-sm-12">
						<div class="card">
							<!-- card-header -->
							<div class="card-header">
								<h3 class="card-title">Books on library</h3>
							</div>
							<!-- /.card-header -->
							<!-- card-body -->
							<div class="card-body">
								<g:render template="/dataTable"/>
							</div>
							<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</section>
				<!-- /. col -->
				</div>
			<!-- /.row (main row) -->
			</div><!-- /.container-fluid -->
		</section>
</div>

<!-- ./wrapper -->
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
