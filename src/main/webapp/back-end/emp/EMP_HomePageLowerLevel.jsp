<%@page import="com.mysql.cj.protocol.x.ReusableOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_員工系統</title>


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
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>

            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">

                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">

                </div>
                <li class="nav-item"> 
                    <a class="nav-link" data-widget="login-out" href="<%=request.getContextPath()%>/EmpLoginServlet?action=EMPSignOut" role="button">
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
                       <img src="<%=request.getContextPath()%>/EMPImageServlet?action=usesrImage"  name="action" class="img-circle elevation-2" alt="User Image" />
                    </div>
                    <div class="info">
                    
                 <form method="Post" action="<%=request.getContextPath()%>/EmpLoginServlet?action=LoginUserForUpdate" name="loginUser">
                   <a href="<%=request.getContextPath()%>/EmpLoginServlet?action=LoginUserForUpdate"  class="d-block" type="submit">${loginUser.englishFirstName}&nbsp${loginUser.englishLastName}</a>
							                
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
                                    <a href="<%=request.getContextPath()%>/back-end/emp/EMP_InfoAll.jsp" class="nav-link" >
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>員工資料表</p>
                                    </a>
                                </li>
                                 <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/back-end/emp/EMP_Register.jsp"  class="nav-link">
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
                                    <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=getAllPackage" class="nav-link">
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
                            <marquee style="width:1000px;height:40px" direction="left" height="40" scrollamount="10"
                                behavior="alternate">
                                <font size="5" face="Mogra" style="color:red">${loginUser.englishFirstName}&nbsp${loginUser.englishLastName} 職等權限不足 </font>

                            </marquee>

                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">
                                    <a href="#">Home</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    Starter Page
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

                                <!-- /.card-header -->
                                <!-- form start -->
                                <img style="width:50%;display:block; margin:auto;" src="./images/smile.gif">

                                </tfoot>
                                </table>
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

</html>