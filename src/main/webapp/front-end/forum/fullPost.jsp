

<%@page import="web.forum.bean.ForumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
  ForumVO forumVO = (ForumVO) request.getAttribute("forumVO"); //ForumServlet.java (Concroller) 存入req的forumVO物件 (包括幫忙取出的forumVO, 也包括輸入資料錯誤時的forumVO物件)
%>
<%= forumVO==null %>--${forumVO.postId}--

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>ROYAL CLASS PANDORA_後台系統</title>


<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.css" />
<style>
.container {
	width: 1024px;
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
		<nav id="navbar-header"
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>

			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">

				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">

				</div>
				<li class="nav-item"><a class="nav-link"
					data-widget="login-out" href="#" role="button"> <i
						class="fas fa-arrow-right-from-bracket"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->
		<!-- Main Sidebar Container 主側邊欄-->
		<aside id="sidebar"
			class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="#" class="brand-link"> <img src="images/LOGo.png"
				alt="PANDORA Logo" class="brand-image img-circle elevation-3"
				style="opacity: 0.8" /> <pre></pre>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="./images/girlimg.jpg" class="img-circle elevation-2"
							alt="User Image" />
					</div>
					<div class="info">
						<a href="#" class="d-block">Lucifer Morningstar</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="#" class="nav-link "> <i
								class="fa-solid fa-briefcase"></i>
								<p type="">
									員工資料 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>員工資料表</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-address-card"></i>
								<p>
									會員管理 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>會員資料管理</p>
								</a></li>
							</ul></li>

						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-ship"></i>
								<p>


									行程管理<i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>行程資訊管理</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>郵輪管理</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>航線管理</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>停靠點管理</p>
								</a></li>


							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-house-chimney-user"></i>
								<p>
									房間管理<i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>房間狀態查詢</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>房間資訊管理</p>
								</a></li>

							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-comments"></i>
								<p>
									聊天室管理 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>
											客服聊天室<span class="right badge badge-danger">New</span>
										</p>
								</a></li>


							</ul></li>
						<li class="nav-item menu-open"><a href="#" class="nav-link">
								<i class="fa-solid fa-list"></i>
								<p>
									討論區管理<i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>文章管理</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>留言管理</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>檢舉管理</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-chart-pie"></i>
								<p>
									分析系統 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>收益分析</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>年齡分析</p>
								</a></li>

							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-image"></i>
								<p>
									網頁圖文管理 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>圖文管理</p>
								</a></li>


							</ul></li>


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
							<h1 class="m-0">PANDORA後台系統</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">討論區管理</a></li>
								<li class="breadcrumb-item active">EMP Page</li>
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
									<h3 class="card-title">文章管理</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<div class="container">

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ForumServlet" >
<table>
	<tr>
		<td>文章編號:<font color=red></font></td>
		<td><input type="hidden" name="postId" size="45" value="<%=forumVO.getPostId()%>" /><%=forumVO.getPostId()%></td>
	</tr>
	<tr>
		<td>作者:</td>
		<td><input type="TEXT" name="memberId" size="45" value="<%=forumVO.getMemberId()%>" /></td>
	</tr>
	<tr>
		<td>標題:</td>
		<td><input type="TEXT" name="postTitle" size="45"	value="<%=forumVO.getPostTitle()%>" /></td>
	</tr>
	<tr>
		<td>內容:</td>
		<td><input type="TEXT" name="postContent" size="45"	value="<%=forumVO.getPostContent()%>" /></td>
	</tr>
	<tr>
		<td>時間:</td>
		<td><input type="TEXT" name="postTime" size="45"	value="<%=forumVO.getPostTime()%>" /></td>
	</tr>
	<tr>
		<td>次數:</td>
		<td><input type="TEXT" name="clicks" size="45"	value="<%=forumVO.getClicks()%>" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="status" size="45"	value="<%=forumVO.getStatus()%>" /></td>
	</tr>
	

<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="postId"> -->
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="postid" value="<%=forumVO.getPostId()%>">
<input type="submit" value="送出修改"></FORM>


</div>

								</tfoot>
								<div style="width: 100%; text-align: center">
									<input style="display: inline-block; width: 150px"
										type="button" onclick="history.go(-1)" value="上一頁"></input> <input
										style="display: inline-block; width: 150px" type="button"
										onclick="history.forward()" value="下一頁">
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
		<div class="float-right d-none d-sm-inline">Tibame_TGA102 第五組</div>
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
		//exporte les données sélectionnées
		var $table = $('#table');

		var trBoldBlue = $(" table");
		$(trBoldBlue).on("click", "tr", function() {
			$(this).toggleClass("bold-blue");
		});
	</script>

	<!-- 上下頁 -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://github.com/kayalshri/tableExport.jquery.plugin/blob/master/jquery.base64.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
		href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
	<!-- Latest compiled and minified Locales -->
	<script
		src="https://unpkg.com/bootstrap-table@1.20.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>



</html>