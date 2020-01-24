<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/20/20
  Time: 10:28 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Library: Create User</title>
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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
                <div class="container-fluid"><!-- container-fluid -->
                    <div class="row mb-2"><!-- row -->
                        <div class="col-sm-6"><!-- col -->
                            <h1 class="m-0 text-dark">User Fields</h1>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <div class="content">
                <div class="container-fluid">
                    <div class="card col-12">
                        <div class="card-body">
                            <g:form controller="userLog" action="createUser">
                                <label>${message}</label>
                                <div class="row" >
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="loginName" id="LoginName">Login Name:</label><br>
                                            <g:field type="text" id="LoginName" name="loginName" placedholder="Isert your User Name" /><br>
                                        </div>

                                        <div class="form-group">
                                            <label for="password">Password:</label><br>
                                            <g:field type="password"  id="password" name="password" placeholder="Insert Your Password"/><br>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputName">Name: </label><br>
                                            <g:field type="text" id="inputName" name="name" placeholder="Insert Your Name"/><br>
                                        </div>
                                    </div>


                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="inputAdress">Adress:</label><br>
                                            <g:field type="text"  id="inputAdress" name="adress" placeholder="Insert Your Adress"/><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Phone Number:</label>

                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                </div>
                                                <input type="text" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(999) 9999-9999&quot;" data-mask="" im-insert="true">
                                            </div>
                                            <!-- /.input group -->
                                        </div><br>

                                        <g:actionSubmit class="btn btn-primary" value="createUser"/>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                    </div>
            </div>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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

<asset:javascript src="winmarkltd-BootstrapFormHelpers-d6770e0/js/bootstrap-formhelpers-phone.js"/>

<asset:javascript src="moment/moment.min.js"/>

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

<asset:javascript src="inputmask/jquery.inputmask.bundle.js"/>

<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()
    })
</script>


</body>
</html>