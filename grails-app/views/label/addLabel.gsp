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

    <!-- Bootstrap Color Picker -->
    <asset:link rel="stylesheet" href="bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>

    <!-- Select2 -->
    <asset:link rel="stylesheet" href="select2/css/select2.min.css"/>
    <asset:link rel="stylesheet" href="select2-bootstrap4-theme/select2-bootstrap4.min.css"/>

    <!-- Bootstrap4 Duallistbox -->
    <asset:link rel="stylesheet" href="bootstrap4-duallistbox/bootstrap-duallistbox.min.css"/>

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
                        <h1 class="m-0 text-dark">New Labels</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card" data-select2-id="30">
                        <!-- /.card-header -->
                        <div class="card-body" data-seçected2-id="40">
                        <p class="success">${message}</p>
                            <g:form controller="label" action="createLabel">
                                <div class="form-group">
                                    <label for="addLabel">Label Tag</label><br>
                                    <g:field require="" class="form-control" id="addLabel" type="text" name="addLabel" placeholder="Input the tag name"/><br>
                                </div>
                                <div class="form-group">
                                    <label>Submit</label><br>
                                    <g:submitButton class="btn btn-primary b" name="createLabel"/>
                                </div>
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

<!-- jQuery -->
<asset:javascript src="jquery/jquery.min.js"/>

<!-- jQuery UI 1.11.4 -->
<asset:javascript src="jquery-ui/jquery-ui.min.css"/>

<!-- Select2 -->
<asset:javascript src="select2/js/select2.full.min.js"/>

<!-- Bootstrap4 Duallistbox -->
<asset:javascript src="bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"/>

<!-- date-range-picker -->
<asset:javascript src="daterangepicker/daterangepicker.js"/>


<!-- InputMask -->
<asset:javascript src="moment/moment.min.js"/>
<asset:javascript src="inputmask/min/jquery.inputmask.bundle.min.js"/>

<!-- bootstrap color picker -->
<asset:javascript src="bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"/>

<!-- Bootstrap Switch -->
<asset:javascript src="bootstrap-switch/js/bootstrap-switch.min.js"/>

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

<asset:javascript src="adminlte.min.js"/>

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

<!-- Page script -->
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

        //Date range picker
        $('#reservation').daterangepicker()
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY hh:mm A'
            }
        })
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges   : {
                    'Today'       : [moment(), moment()],
                    'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                    'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate  : moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        )

        //Timepicker
        $('#timepicker').datetimepicker({
            format: 'LT'
        })

        //Bootstrap Duallistbox
        $('.duallistbox').bootstrapDualListbox()

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        $('.my-colorpicker2').on('colorpickerChange', function(event) {
            $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
        });

        $("input[data-bootstrap-switch]").each(function(){
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

    })
</script>

</body>

</html>