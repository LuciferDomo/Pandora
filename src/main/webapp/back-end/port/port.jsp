<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.port.service.impl.PortServiceImpl"%>
<%@ page import="web.port.bean.PortVO"%>
<%
	PortServiceImpl portSvc =new PortServiceImpl();
	List<PortVO> list = portSvc.getAll();	
	pageContext.setAttribute("list",list);
%>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/port/css/adminlte.css" />
    <style>
        .content{
            width: 100%;
            padding: 2em;
        }
        .bold-blue {
            font-weight: bold;
            color: #0277BD;
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
                                    停靠點管理
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
                <div class="container">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- jquery validation -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        停靠點管理
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="container">
                                    <div class="col-md-12">
                                        <table id="table" data-toggle="table" data-search="false" data-filter-control="true"
                                        data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>
                                                <th data-field="Employee_ID" data-filter-control="input"
                                                    >停靠點編號</th>
                                                <th data-field="Job_Levels" data-filter-control="select"
                                                    >停靠點名稱</th>
                                                <th data-field="Englis_Last_Name" data-filter-control="select"
                                                    >停靠點經緯度
                                                </th>
                                                <th data-field="Englis_First_Name" data-filter-control="select"
                                                    >
                                                    觀光點名稱</th>
                                                <th data-field="Gender" data-filter-control="select"
                                                    >觀光點經緯度</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%@ include file="page1.file" %>
                                        <c:forEach var="portVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr>
                                                <td>${portVO.portOfCallNo}</td>
                                                <td>${portVO.portName}</td>
                                                <td>(${portVO.portLatitude},${portVO.portLongitude})</td>
                                                <td>${portVO.sightseeing}</td>
                                                <td>(${portVO.sightseeingLatitude},${portVO.sightseeingLongitude})</td>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                    <%@ include file="page2.file" %>
                                    </div>
                                </div>
                                </tfoot>
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
    <script src="<%=request.getContextPath()%>/back-end/port/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<%=request.getContextPath()%>/back-end/port/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/back-end/port/js/adminlte.js"></script>
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
</body>
</html>