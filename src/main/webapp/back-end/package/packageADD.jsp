<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>ROYAL CLASS PANDORA_行程資料表</title>


                <!-- Google Font: Source Sans Pro -->
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
                <!-- Font Awesome Icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
                    integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <!-- Theme style -->
                <link rel="stylesheet" href="css/adminlte.css" />
                <style>

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
                                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i
                                        class="fas fa-bars"></i></a>
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
                    <aside id="sidebar" class="main-sidebar sidebar-dark-primary elevation-4">
                        <!-- Brand Logo -->
                        <a href="#" class="brand-link">
                            <img src="images/LOGo.png" alt="PANDORA Logo" class="brand-image img-circle elevation-3"
                                style="opacity: 0.8" />
                            <pre></pre>
                        </a>

                        <!-- Sidebar -->
                        <div class="sidebar">
                            <!-- Sidebar user panel (optional) -->

                            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                                <div class="image">
                                    <img src="<%=request.getContextPath()%>/EMPImageServlet?action=usesrImage"
                                        name="action" class="img-circle elevation-2" alt="User Image" />
                                </div>
                                <div class="info">

                                    <form method="Post"
                                        action="<%=request.getContextPath()%>/EmpLoginServlet?action=LoginUserForUpdate"
                                        name="loginUser">
                                        <a href="<%=request.getContextPath()%>/EmpLoginServlet?action=LoginUserForUpdate"
                                            class="d-block"
                                            type="submit">${loginUser.englishFirstName}&nbsp${loginUser.englishLastName}</a>

                                    </form>

                                </div>
                            </div>


                            <!-- Sidebar Menu -->
                            <nav class="mt-2">
                                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                                    data-accordion="false">
                                    <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
                                    <li class="nav-item">
                                        <a href="#" class="nav-link ">
                                            <i class="fa-solid fa-briefcase"></i>
                                            <p type="">
                                                員工資料
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="<%=request.getContextPath()%>/EmpLoginServlet?action=EMPAllList"
                                                    class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>員工資料表</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="<%=request.getContextPath()%>/back-end/emp/EMP_Register.jsp"
                                                    class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>新增員工</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-address-card"></i>
                                            <p>
                                                會員管理
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>會員資料管理</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="nav-item menu-open">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-ship"></i>
                                            <p>


                                                行程管理<i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=getAllPackage"
                                                    class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>行程資訊管理</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>郵輪管理</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>航線管理</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>停靠點管理</p>
                                                </a>
                                            </li>


                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-house-chimney-user"></i>
                                            <p>
                                                房間管理<i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>房間狀態查詢</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>房間資訊管理</p>
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-comments"></i>
                                            <p>
                                                聊天室管理
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>
                                                        客服聊天室<span class="right badge badge-danger">New</span>
                                                    </p>
                                                </a>
                                            </li>


                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-list"></i>
                                            <p>
                                                討論區管理<i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>文章管理</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>留言管理</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>檢舉管理</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="fa-solid fa-chart-pie"></i>
                                            <p>
                                                分析系統
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>收益分析</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>年齡分析</p>
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">

                                            <i class="fa-solid fa-image"></i>
                                            <p>
                                                網頁圖文管理
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>
                                                        圖文管理
                                                    </p>
                                                </a>
                                            </li>


                                        </ul>
                                    </li>


                                </ul>
                            </nav>
                            <!-- /.sidebar-menu -->
                        </div>
                        <!-- /.sidebar -->
                    </aside>
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
                                                <a href="#">行程資訊管理</a>
                                            </li>
                                            <li class="breadcrumb-item active">
                                                新增行程
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
                        <form method="Post"
                            action="<%=request.getContextPath()%>/PackagesBackEndServlet"
                            enctype="multipart/form-data">
                            <input type="hidden" value="packageAddDone" name="action">
                            <div class="container-fluid">
                                <div class="row">
                                    <!-- left column -->
                                    <!-- 行程圖文編輯開始 -->
                                    <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                    </div>
                                </div>
                                </br>
                                <div class=" col-md-12">

                                    <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                        <div class="card-header" style="background-color: rgb(112, 150, 189) ;">
                                            <h4 class="card-title" style="color:white">
                                                新增行程圖片
                                            </h4>
                                        </div>
                                        <div class="container">
                                            <center>
                                                <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">

                                                    <div class="col"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                        <label>行程圖片：</label>
                                                        <input type="file" id="p_file" name="packageImages" />
                                                    </div>
                                                    <div id="preview" class="preview col-md-12" style="width:100% ;">
                                                    </div>

                                                </div>
                                            </center>
                                        </div>

                                        <!-- jquery validation -->
                                        <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                            <div class="card-header" style="background-color: rgb(112, 150, 189) ;">
                                                <h4 class="card-title" style="color:white">
                                                    新增行程
                                                </h4>
                                            </div>
                                            <!-- /.card-header -->
                                            <!-- form start -->
                                            <div class="container"></div>

                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    行程名稱
                                                </div>
                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">

                                                    <input type="text" class="right border" style="width:calc(100%);"
                                                        placeholder="請輸入行程名稱" name="packageName">

                                                </div>
                                            </div>
                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    郵輪
                                                </div>

                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div class="button dropdown;col-8"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">


                                                        <select name="ship" style="width:calc(100%);">
                                                            <option value="">請選擇郵輪</option>
                                                            <c:forEach var="shipVO" items="${shipList}">
                                                                <option value="${shipVO.shipNo}">
                                                                    ${shipVO.shipNo}.${shipVO.shipName}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    航線
                                                </div>
                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div class="button dropdown;col-8"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">

                                                        <select class="select" style="width:calc(100%);"
                                                            name="cruiseLine" id="cruiseLineID">
                                                            <option value="">請選擇航線</option>
                                                            <c:forEach var="cruiseLineVO" items="${cruiseLineList}">
                                                                <option value="${cruiseLineVO.cruiseLineNo}">
                                                                    ${cruiseLineVO.cruiseLineNo}.${cruiseLineVO.cruiseLines}
                                                                </option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>





                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    啟航時間
                                                </div>
                                                <div class="col-8" id="startTimeDivID"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    航線設定的第一個停靠點_停靠時間,自動設定為啟航時間
                                                </div>
                                            </div>
                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    結束時間
                                                </div>
                                                <div class="col-8" id="endTimeDivID"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    航線設定的最後一個停靠點_停靠時間,自動設定為結束時間
                                                </div>
                                            </div>
                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    行程天數
                                                </div>
                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div class="button dropdown;col-8"  id="durationID"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                        啟航日與結束日自動計算
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    上架日期
                                                </div>
                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div class="button dropdown;col-8"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                        <input name="registrationStartTime" type="date"
                                                            id="registrationStartTimeID" style="width:calc(100%);">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                <div class="col-4"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    下架日期
                                                </div>
                                                <div class="col-8"
                                                    style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div class="button dropdown;col-8"
                                                        style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                        <input name="registrationDeadTime" type="date"
                                                            id="registrationStartTimeID" style="width:calc(100%);">
                                                    </div>
                                                </div>
                                            </div>




                                            <!-- 停靠點停靠時間 -->


                                            <!-- 停靠點停靠時間 -->

                                            <div class="row" id="criuse"
                                                style="border: 1px solid #ddd;margin: 0; padding: 0;">

                                                <!-- 停靠點停靠時間 -->

                                                <div class="card-header" style="background-color: rgb(112, 150, 189) ;"
                                                    id="criuseNoID">
                                                    <h4 class="card-title" style="color:white">
                                                        航線編號:
                                                    </h4>
                                                </div>

                                                <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                    <div id="cruiseImageDiv" class="col-4"
                                                        style="border: 1px solid #ddd;">
                                                        <img id="img_content"
                                                            src="https://i.ibb.co/HCJV5js/hqdefault.jpg" "
                                                            alt="CruiseLine Image" style="width:100%;" />

                                                    </div>



                                                    <div class="col-8"
                                                        style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                                                        <div class="row"
                                                            style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                            <div class="col-2"
                                                                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                                                                停靠點
                                                            </div>
                                                            <div class="col-4"
                                                                style="border: 1px solid #ddd;margin: 0; padding: 0;">
                                                                國家/港口
                                                            </div>
                                                            <div class="col-3" id="startTimeHeadID"
                                                                style="border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px">
                                                                啟航時間
                                                            </div>
                                                            <div class="col-3" id="endTimeHeadID"
                                                                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                                                                抵達時間
                                                            </div>
                                                        </div>
                                                        <div id="cruiseEdiotrBar"></div>
                                                    </div>

                                                    <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=packageAddDone"
                                                        class="nav-link">
                                                        <input type="submit" name="packageAddDone" value="確認新增"
                                                            style="margin-right: 0%;width:250px;float: right;">
                                                    </a>

                                                </div>

                                                </br>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- /.card -->
                                </div>
                            </div>
                        </form>
                        <!-- /.row -->
                    </div>

                    <hr>

                </div>
                </div>

                </br>


                <!-- End container -->



                <!-- End main -->

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
                    <!-- Default to the left -->
                    <!-- <strong
                    >Copyright &copy; 2014-2021
                    <a href="https://adminlte.io">AdminLTE.io</a>.</strong
                >
                All rights reserved. -->
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
                <script src="plugins/jquery/jquery.min.js"></script>
                <!-- Bootstrap 4 -->
                <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                <!-- AdminLTE App -->
                <script src="js/adminlte.js"></script>

                <script>
                    $(function () {
                        $("#cruiseLineID").change(function () {
//                             alert($(this).val());
                            console.log("你媽的")
                            var request = $.ajax({
                                url: "<%=request.getContextPath()%>/PackagesBackEndServlet",
                                method: "POST",
                                data: { "action": "updateOption", "cruiseLine": $(this).val() },
                                dataType: "json",
                            });
                            request.done(function (data) {
                                console.log(data)
                                console.log("hi" + data.portNameNoList[0])

                                let portNameNoListAll = '';
                                let portNameNoListAllFirst = '';
                                let portNameNoListAllLast = '';
                                let c = 1;
                                let a = `<img id='img_content' src="/pandora/CruiseLineServlet?action=getImage&cruiseLineNo=`
                                let b = "style=width:375px />"
                                let cruiseImageDiv = a + data.cruiseLinesNoList + '"' + b;
                                console.log(data.portNameNoList[c]);
                                for (let c = 0; c < data.portNameNoList.length; c++) {
                                    if (c == 0) {
                                        portNameNoListAllFirst =
                                            "<div class='row' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<div class='col-2' style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>第" + data.portOfCallSequenceList[c] +
                                            "個停靠港口</div><div class='col-4'  id='" + data.portOfCallNoList[c] + "' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<input type='hidden' name='portOfCallNo' value='"+data.portOfCallNoList[c]+"'>"+data.portNameNoList[c] +
                                            "</div><div class='col-3' style='border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px'>" +
                                            "<input name='startTime' id='startTimeID' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div><div class='col-3'" +
                                            "style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>" +
                                            "<input readonly name='endTime' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div></div>"
                                    } else if (c == data.portNameNoList.length - 1) {
                                        portNameNoListAllLast =
                                            "<div class='row' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<div class='col-2' style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>第" + data.portOfCallSequenceList[c] +
                                            "個停靠港口</div><div class='col-4' id='" + data.portOfCallNoList[c] + "' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<input type='hidden' name='portOfCallNo' value='"+data.portOfCallNoList[c]+"'>"+data.portNameNoList[c] +
                                            "</div><div class='col-3' style='border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px'>" +
                                            "<input readonly name='startTime' id='startTimeID' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div><div class='col-3'" +
                                            "style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>" +
                                            "<input name='endTime' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div></div>"
                                    } else {
                                        portNameNoListAll +=
                                            "<div class='row' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<div class='col-2' style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>第" + data.portOfCallSequenceList[c] +
                                            "個停靠港口</div><div class='col-4' id='" + data.portOfCallNoList[c] + "' style='border: 1px solid #ddd;margin: 0; padding: 0;'>" +
                                            "<input type='hidden' name='portOfCallNo' value='"+data.portOfCallNoList[c]+"'>"+data.portNameNoList[c] +
                                            "</div><div class='col-3' style='border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px'>" +
                                            "<input name='startTime' id='startTimeID' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div><div class='col-3'" +
                                            "style='border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;'>" +
                                            "<input name='endTime' type='datetime-local' style='width:calc(100%);max-height:25px;padding:0'></div></div>"
                                    }


                                }
                                var criuseNo = "<div class='card-header' style='background-color: rgb(112, 150, 189) ;'>" + "<h4 class='card-title' style='color:white'>  航線編號:" + data.cruiseLinesNoList + "</h4 >" + "</div>"
                                var criuseNo1 = "航線編號:" + data.cruiseLinesNoList;
                                document.getElementById('criuseNoID').innerHTML = "<h4 class='card-title' style='color:white'>" + criuseNo1 + "</h4>";



                                //  $('#criuseNoID').html(criuseNo);
                                $('#cruiseImageDiv').html(cruiseImageDiv);
                                $('#cruiseEdiotrBar').html(portNameNoListAllFirst + portNameNoListAll + portNameNoListAllLast);


                                // <div class="card-header" style="background-color: rgb(112, 150, 189) ;">
                                //     <h4 class="card-title" style="color:white">
                                //         航線編號:data.cruiseLinesNoList[c]
                                //     </h4>
                                // </div>





                            });

                        });

                    });	    
                </script>

                <script>
                    $(function () {

                        $('body').on('change', $('#startTimeID'), function () {
//                             alert('我來囉')

                            var gogoTime = Date.parse($("[name=startTime]")[0].value)
                            var ggTime = Date.parse($("[name=endTime]")[$("[name=endTime]").length - 1].value);
                            time_difference = Math.ceil((ggTime - gogoTime) / (60 * 60 * 24 * 1000));
                            console.log(time_difference);

                            document.getElementById('startTimeDivID').innerHTML = $("[name=startTime]")[0].value;
                            document.getElementById('endTimeDivID').innerHTML = $("[name=endTime]")[$("[name=endTime]").length - 1].value;

                            if ($("[name=startTime]")[0].value !== '' && $("[name=endTime]")[$("[name=endTime]").length - 1].value !== '') {
                                document.getElementById('durationID').innerHTML ="<input type='hidden' name='duration' value='"+time_difference+"'>"+ time_difference + "天"
                            }
                            //                             variable1 !== null || variable1 !== undefined || variable1 !== ”


                            // var startTimeA =
                            //     "<div class='col-8' id='startTimeDivID' style='border: 1px solid #ddd;margin: 0; padding: 0;'>"
                            // AAAAAAAAAAAAAAAAAAAAAAAA
                            // "</div>"



                            // $('#startTimeDivID').html(startTimeA);




                        });
                    })

                    // "[name=startTime]"
                    // $("[name=startTime]")[0].value +

                </script>

                <script>
                    window.addEventListener("load", function (e) {
                        var preview_el = document.getElementById("preview");
                        console.log(preview_el);
                        var p_file_el = document.getElementById("p_file");
                        console.log(p_file_el);
                        //讀取預覽圖
                        var preview_img = function (file) {
                            // file是資料位置
                            // 用來讀取檔案
                            var reader = new FileReader();
                            // 讀取檔案
                            reader.readAsDataURL(file);
                            reader.addEventListener("load", function () {
                                console.log(reader.result);
                                let img_str =
                                    //設定檔案數據
                                    '<img src="' + reader.result + '" class="preview_img col-md-12" style="width:100%">';
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


                <script>
                    //exporte les données sélectionnées
                    var $table = $('#table');


                    var trBoldBlue = $(" table"); $(trBoldBlue).on("click", "tr", function () {
                        $(this).toggleClass("bold-blue");
                    }); 
                </script>

                <!-- 上下頁 -->


                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script
                    src="https://github.com/kayalshri/tableExport.jquery.plugin/blob/master/jquery.base64.js"></script>
                <!-- Latest compiled and minified CSS -->
                <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">

                <!-- Latest compiled and minified JavaScript -->
                <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
                <!-- Latest compiled and minified Locales -->
                <script
                    src="https://unpkg.com/bootstrap-table@1.20.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                    crossorigin="anonymous"></script>
            </body>

            </html>