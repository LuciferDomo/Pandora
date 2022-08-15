<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="web.cruiseline.bean.CruiseLineVO" %>
<%@	page import="web.cruiseline.dao.PortNameListDAO" %>
<%@	page import="web.cruiseline.dao.impl.PortNameListDAOImpl" %>
<%@	page import="web.cruiseline.bean.PortNameListVO" %>
<%@ page import="web.port.dao.impl.PortDAOImpl" %>
<%@ page import="web.port.bean.PortVO" %>
<%
	CruiseLineVO cruiseLineVO =(CruiseLineVO) request.getAttribute("cruiseLineVO");
	Integer cruiseLineNo = cruiseLineVO.getCruiseLineNo();
	PortNameListDAOImpl pnlSVC =new PortNameListDAOImpl();
	List<PortNameListVO> pNLlist =pnlSVC.getAll(cruiseLineNo);
	Integer count = 0;
	pageContext.setAttribute("pNLlist",pNLlist);
	pageContext.setAttribute("count", count);
	PortDAOImpl pSVC = new PortDAOImpl();
	List<PortVO> plist = pSVC.getAll();
	pageContext.setAttribute("plist", plist);
%>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>back-end/cruiseline/css/adminlte.css" />
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
			<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">請修正以下錯誤:</font>
					<ul>
					    <c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
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
                                       <div class="col-md-3">航線編號</div>
                                       <div class="col-md-9"> <input type="hidden" name="cruiseLineNo" value="${cruiseLineVO.cruiseLineNo }"> <%=cruiseLineVO.getCruiseLineNo() %></div>
                                       <div class="col-md-3">航線名稱</div>
                                       <div class="col-md-9"><input type="hidden" name="cruiseLines" value="<%=cruiseLineVO.getCruiseLines() %>"><%=cruiseLineVO.getCruiseLines() %></div>
                                       <div class="col-md-3">最後維護時間</div>
                                       <div class="col-md-9"><input id="f_date1" class="date-pick form-control" type="hidden" name="time" value="${cruiseLineVO.time}">${cruiseLineVO.time}</div>
                                       <div class="col-6">
                                           <label>航線圖片：</label>
                                           <input type="file" id="p_file" name="cruiselinePic" />
                                           <div id="preview">
                                               <img id="img_content" src="<%=request.getContextPath()%>/CruiseLineServlet?action=cruiseLineVOUpdate&cruiseLineNo=${cruiseLineVO.cruiseLineNo}"  name="action" class="img-circle elevation-2 col-12" alt="CruiseLine Image" style=width:100% />
                                           </div>
                                       </div>
                                       <div class="col-md-4">
                                       		<input type="hidden" name="action" value="updateCL">
                                            <input type="submit" name="EMPregister" value="編輯航線" text-align=center
                                            style="margin-left: 0%;width:250px;float: left;"
                                            onclick="javascript:window.location.href=''" />
                                        </div>
                                        </form>
                                        <div class="col-md-4">
                                        <form method="post"  action="<%=request.getContextPath()%>/CruiseLineServlet">
                                        <input type="hidden" name="cruiseLineNo" value="${cruiseLineVO.cruiseLineNo}">
                                        <input type="hidden" name="action" value="insertPCL">
                                            <select name="portOfCallNo" id="" style="width:250px;float: center;">
                                            <c:forEach items="${plist}"	 var="pVO">
                                            <option value="${pVO.portOfCallNo }" >${pVO.portName }</option>
                                            </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="submit" style="margin-right: 0%;width:250px;float: right;">新增停靠點</button>
                                        </div>
                                        </form>
                                       <div class="col-md-12 " data-click-to-select="true" data-toolbar="#toolbar">
                                        <table>
                                            <table class=" col-md-12" id="table" data-toggle="table" data-filter-control="true"
                                        data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>
                                                <th data-field="Employee_ID" data-filter-control="input"
                                                    >行程</th>
                                                <th data-field="Job_Levels" data-filter-control="select"
                                                    >國家/城市</th>
                                                    <th data-field="update" data-filter-control="select"
                                                    >變更</th>
                                                    <th data-field="delete" data-filter-control="select"
                                                    >去除</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${pNLlist }" var="pNLVO">
                                            <tr>
                                                <td>停靠點<%=count+=1%></td>
                                                <td>${pNLVO.portName}</td>
                                                <td>
                                                	<form method="post"  action="<%=request.getContextPath()%>/CruiseLineServlet">
                                                	<input name="portsOfCallListNo" type="hidden" value="${pNLVO.portsOfCallListNo}">
                                                	<input name="cruiseLines" type="hidden" value="${cruiseLineVO.cruiseLines }">
                                                	<input name="cruiseLineNo" type="hidden" value="${cruiseLineVO.cruiseLineNo }">
                                                    <input name="action" type="hidden" value="updatePCLBefore">
                                                    <button class="btn btn-primary btn-sm" type="submit"
                                                        onclick="對應謀個function"
                                               			style="width:100%;height:100%">更改</button>
                                                    </form>
                                                </td>
                                                <td><form method="get" id="update" action="<%=request.getContextPath()%>/CruiseLineServlet">
                                                    <input name="action" type="hidden" value="deletePCL">
                                                    <input name="portsOfCallListNo" type="hidden" value="${pNLVO.portsOfCallListNo}">
                                                    <input name="cruiseLineNo" type="hidden" value="${cruiseLineVO.cruiseLineNo }">
                                                    <button class="btn btn-primary btn-sm" type="submit"
                                                        style="width:100%;height:100%;">刪除</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        	</c:forEach>
                                        </tbody>
                                        </table>
                                       </div>
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
        var photo = document.getElementById('photo');
        var img = document.getElementById('img_content');
        function readURL(input){
        	if(input.files && input.files[0]){
        	    var reader = new FileReader();
        	    reader.onload = function (e) {
        	       img.setAttribute('src', e.target.result);
        	    }
        	    reader.readAsDataURL(input.files[0]);
        	  }
        }
          });
        </script>
</body>
</html>