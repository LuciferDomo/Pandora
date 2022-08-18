<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_後台系統</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/cruiseline/css/adminlte.css" />
    <style>
        .container {
            width: 1024px;
            padding: 2em;
        }
        .bold-blue {
            font-weight: bold;
            color: #0277BD;
        }
        .preview span.text {
            color: lightgray;    
        }
        .preview {
            border: 1px solid lightgray;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <!-- 主要開發區塊 -->
    <div class="wrapper">
        <!-- Navbar header區塊-->
        <nav id="navbar-header" class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                </div>
                <li class="nav-item">
                    <a class="nav-link" data-widget="login-out" href="#" role="button">
                        <i class="fas fa-arrow-right-from-bracket"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container 主側邊欄-->
        <%@ include file="/back-end/aside.jsp" %>
        <!-- Content Wrapper. Contains page content 主頁面欄位-->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">PANDORA後台系統 </h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">
                                    <a href="#">行程管理</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    航線管理
                                </li>
                            </ol>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->
            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- jquery validation -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        航線管理
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="container">
                                    <div class="row">
                                       <form method="post"  action="<%=request.getContextPath()%>/CruiseLineServlet" enctype='multipart/form-data'>
                                        <div class="col-6">
                                            <label>航線圖片：</label>
                                            <input type="file" id="p_file" name="cruiselinePic"/>
                                        </div>
                                        <div id="preview" class="preview col-md-12" >
                                            <span class="text">預覽圖</span>
                                        </div>
                                        <div class="col-md-3">最後維護時間</div>
                                        <div class="col-md-9"><input id="f_date1" type="text" name="time"></div>
                                        
                                        <div class="col-md-4">
                                        <input type="hidden" name="action" value="cruiselineInsert" />
                                            <input type="submit" name="EMPregister" value="新增航線" text-align=center
                                            style="margin-left: 0%;width:250px;float: left;" />
                                        </div>
                                        </form>
                                    </div>
                                    </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6"></div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- ============ Footer段落 ============ -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
            Tibame_TGA102 第五組
        </div>
    </footer>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    <!-- ============ Footer段落 ============ -->
    <!-- /.content-wrapper -->
    </div>
    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/back-end/cruiseline/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<%=request.getContextPath()%>/back-end/cruiseline/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/back-end/cruiseline/js/adminlte.js"></script>
    <script>
        //exporte les données sélectionnées
        var $table = $('#table');
        var trBoldBlue = $(" table"); $(trBoldBlue).on("click", "tr", function () {
            $(this).toggleClass("bold-blue");
        }); </script>
    <!-- 上下頁 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://github.com/kayalshri/tableExport.jquery.plugin/blob/master/jquery.base64.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
<link   rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/back-end/cruiseline/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/back-end/cruiseline/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
        $.datetimepicker.setLocale('zh'); // kr ko ja en
        $('#f_date1').datetimepicker({
           theme: '',          //theme: 'dark',
           timepicker: false,   //timepicker: false,
           step: 1,            //step: 60 (這是timepicker的預設間隔60分鐘)
	       format: 'Y-m-d',
	       value: new Date(),
        });
        </script>
        <script>
            window.addEventListener("load", function (e) {
                var preview_el = document.getElementById("preview");
                var p_file_el = document.getElementById("p_file");
              //讀取預覽圖
          var preview_img = function (file) {
            // file是資料位置
            // 用來讀取檔案
            var reader = new FileReader();
            // 讀取檔案
            reader.readAsDataURL(file);
            reader.addEventListener("load", function (){
              let img_str =
                //設定檔案數據
                '<img src="' + reader.result + '" class="preview_img">';
              //新增檔案數據
              preview_el.innerHTML = img_str;
            });
          };
          p_file_el.addEventListener("change", function (e) {
            if (this.files.length > 0) {
              preview_img(this.files[0]);
            } else {
              preview_el.innerHTML = '<span class="text">預覽圖</span>';
            }
          });
            });
          </script>
</body>
</html>