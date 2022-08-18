<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="web.emp.bean.*" %>



            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>ROYAL CLASS PANDORA_新增員工</title>


                <!-- Google Font: Source Sans Pro -->
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
                <!-- Font Awesome Icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
                    integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <!-- Theme style -->
                <link rel="stylesheet" href="css/adminlte.css" />
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
                                <a class="nav-link" data-widget="login-out"
                                    href="<%=request.getContextPath()%>/EmpLoginServlet?action=EMPSignOut"
                                    role="button">
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
                                        name="action" value="empVO" class="img-circle elevation-2" alt="User Image" />
                                </div>
                                <div class="info">
                                    <a href="#"
                                        class="d-block">${loginUser.englishFirstName}&nbsp${loginUser.englishLastName}</a>
                                </div>
                            </div>

                            <!-- Sidebar Menu -->
                            <nav class="mt-2">
                                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                                    data-accordion="false">
                                    <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
                                    <li class="nav-item menu-open">
                                        <a href="#" class="nav-link ">
                                            <i class="fa-solid fa-briefcase"></i>
                                            <p type="">
                                                員工資料
                                                <i class="right fas fa-angle-left"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="<%=request.getContextPath()%>/back-end/emp/EMP_InfoAll.jsp"
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

                                    <li class="nav-item">
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
                                    <div class="col-sm-6" style="width:100%">


                                    </div>
                                    <!-- /.col -->
                                    <div class="col-sm-6">
                                        <ol class="breadcrumb float-sm-right">
                                            <li class="breadcrumb-item">
                                                <a
                                                    href="<%=request.getContextPath()%>/EmpLoginServlet?action=EMPAllList">員工資料</a>
                                            </li>
                                            <li class="breadcrumb-item active">
                                                新增員工
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
                        <main>
                            <section id="hero" class="login">
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-xl-6 col-lg-5 col-md-6 col-sm-8">
                                            <div id="login">
                                                <div class="form-group">
                                                    <h1>
                                                        新增員工
                                                    </h1>
                                                    <hr />
                                                </div>
                                               

                                                <form action="<%=request.getContextPath()%>/EmpLoginServlet"
                                                    method="Post" enctype="multipart/form-data">
                                                    <div style="text-align:center">

                                                        <center>
                                                            <div class="col-sm-6" style="text-align:center">

                                                                <input type="file" id="p_file" name="empPictureId" />
                                                                <div id="preview" class="preview elevation-2"
                                                                    style="text-align:center"></div>

                                                            </div>
                                                        </center>


                                                    </div>
                                                    <hr />

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>護照英文名字*</label>
                                                                <input type="text" class="form-control"
                                                                    name="englishFirstName"
                                                                    value="${empVO.englishFirstName}" />
                                                                <font class="text-danger">
                                                                    ${errorMsgsMap["englishFirstName"]}</font>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>護照英文姓氏*</label>
                                                                <input type="text" class="form-control"
                                                                    name="englishLastName"
                                                                    value="${empVO.englishLastName}" />
                                                                <font class="text-danger">
                                                                    ${errorMsgsMap["englishLastName"]}</font>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>護照號碼*</label>
                                                                <input type="text" class="form-control"
                                                                    name="passportNo" value="${empVO.passportNo}" />
                                                                <font class="text-danger">${errorMsgsMap["passportNo"]}
                                                                </font>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>出生日期＊</label>
                                                                <input class="date-pick form-control" type="date"
                                                                    name="empBirthday" value="${empVO.empBirthday}">
                                                                <font class="text-danger">${errorMsgsMap["empBirthday"]}
                                                                </font>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>電子信箱＊</label>
                                                                <input type="email" id="Email" class="form-control"
                                                                    name="email" value="${empVO.email}" />
                                                                <font class="text-danger">${errorMsgsMap["email"]}
                                                                </font>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>聯絡電話</label>
                                                                <input type="text" name="empCellphoneNo"
                                                                    class="form-control"
                                                                    value="${empVO.empCellphoneNo}" />
                                                                <font class="text-danger">
                                                                    ${errorMsgsMap["empCellphoneNo"]}</font>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>職等</label>
                                                                </br>
                                                                <div class="form-group">
                                                                    <select style="width:100%" name="jobLevels">
                                                                        <option value="none" selected disabled hidden>
                                                                            請選擇職等</option>
                                                                        <option value="Manger">Manger</option>
                                                                        <option value="Supervisor">Supervisor</option>
                                                                        <option value="Staff">Staff</option>
                                                                    </select>
                                                                    <font class="text-danger">
                                                                        ${errorMsgsMap["jobLevels"]}</font>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>性別</label>
                                                                <br />
                                                                <input type="radio" name="gender" value="Male"
                                                                    id="sexOption" />男
                                                                <input type="radio" name="gender" value="Female"
                                                                    id="sexOption" />女
                                                            </div>
                                                            <font class="text-danger">${errorMsgsMap["gender"]}</font>

                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label>狀態</label>
                                                                <br />
                                                                <input type="radio" name="status" value="stay"
                                                                    onclick="return false" checked />在職
                                                                <input type="radio" name="status" value="leave"
                                                                    onclick="return false" />離職
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <label>地址</label>
                                                        <input type="text" class="form-control" name="empAddress"
                                                            value="${empVO.empAddress}" placeholder="居住地址" />
                                                        <font class="text-danger">${errorMsgsMap["empAddress"]}</font>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>雇用日期</label>
                                                                <input class="date-pick form-control" type="date"
                                                                    name="startDate" value="${empVO.startDate}" />
                                                            </div>
                                                            <font class="text-danger">${errorMsgsMap["startDate"]}
                                                            </font>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label>離職日期</label>
                                                                <input readonly class="date-pick form-control"
                                                                    type="date" name="resignationDate" />
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="row d-flex justify-content-center">
                                                        <div class="col-sm-12" style="text-align:right">

                                                            <div class="form-group">
                                                                <button class="btn btn-primary" type="submit"
                                                                    name="action" value="EMPAdd">確認註冊</button>
                                                                <input type="hidden" name="loginUser" value="${loginUser}">    
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </main>
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
            </body>

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
                                '<img src="' + reader.result + '" class="preview_img" style="width:100%">';
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

            </html>