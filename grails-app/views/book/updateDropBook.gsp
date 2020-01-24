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
    <title>Update: ${book.title}</title>
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
                        <h1 class="m-0 text-dark">Update or Drop Book</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card" data-select2-id="30">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-1">
                                    <a href="${g.createLink(controller: 'book', action: 'drop', params: [book: book.id])}"><i class="nav-icon fas fa-trash"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" data-seçected2-id="40">
                            <g:form controller="book" action="update" params="[book:book.id]">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="title">Title</label><br>
                                            <g:field  required="" class="form-control" id="title" type="text" name="title" placeholder="Input the title book" value="${book.title}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="subtitle">Subtitle</label><br>
                                            <g:field class="form-control" id="subtitle" type="text" name="subtitle" placeholder="Input the subtitle book" value="${book.subtitle}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="edition">Edition</label><br>
                                            <g:field class="form-control" id="edition" type="text" name="edition" placeholder="Input the edition book" value="${book.edition}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="isbn">ISBN</label><br>
                                            <g:field require="" class="form-control" id="isbn" type="text" name="isbn" placeholder="Input the ISBN book" value="${book.isbn}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="pageNumber">Page number</label><br>
                                            <g:field require="" class="form-control" id="pageNumber" type="text" name="pageNumber" placeholder="Input the page number book" value="${book.page}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="publication">Publication:</label><br>
                                            <g:field class="form-control" id="publication" type="date" name="publication" placeholder="Input the date of publication book" value="${book.publication}"/><br>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="publisher">Publisher</label><br>
                                            <g:field  class="form-control" id="publisher" type="text" name="publisher" placeholder="Input the publisher book" value="${book.publisher}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="queue">Estante</label><br>
                                            <g:field require="" class="form-control" id="queue" type="text" name="queue" placeholder="Input the queue of book" value="${book.queue}"/><br>
                                        </div>
                                        <div class="form-group">
                                            <label for="shelf">Prateleira</label><br>
                                            <g:field require="" class="form-control" id="text" type="text" name="shelf" placeholder="Input the shelf of book" value="${book.shelf}"/><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Labels</label><br>
                                            <select class="select2bs4" multiple="multiple" name="labels" data-placeholder="Select a State"
                                                    style="width: 100%;">
                                                <g:each in="${book.labels}" var="label">
                                                    <option value="${label.id}" selected="">${label.tag}</option>
                                                </g:each>
                                                <g:each in="${labels}" var="label">
                                                    <option value="${label.id}" >${label.tag}</option>
                                                </g:each>
                                            </select><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Authors</label><br>
                                            <select class="select2bs4" multiple="multiple" name="authors" data-placeholder="Select a State"
                                                    style="width: 100%;">
                                                <g:each in="${book.authors}" var="author">
                                                    <option value="${author.id}" selected="">${author.fullName}</option>
                                                </g:each>
                                                <g:each in="${authors}" var="author">
                                                    <option value="${author.id}" >${author.fullName}</option>
                                                </g:each>
                                            </select><br>
                                        </div>

                                        <div class="form-group">
                                            <label>Submit</label><br>
                                            <g:submitButton class="btn btn-primary b" name="createBook"/>
                                        </div>
                                    </div>
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