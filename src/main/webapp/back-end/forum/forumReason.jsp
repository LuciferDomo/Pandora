<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="web.forum.service.impl.ForumServiceImpl"%>
<%@page import="web.forum.service.impl.CommentServiceImpl"%>

<%@page import="web.forum.bean.ForumVO"%>
<%@page import="web.forum.bean.CommentVO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
ForumServiceImpl forumSvc = new ForumServiceImpl();
List<ForumVO> list = forumSvc.getAll();
pageContext.setAttribute("list", list);

CommentServiceImpl comSvc = new CommentServiceImpl();
List<CommentVO> list2 = comSvc.getAll();
pageContext.setAttribute("list2", list2);
%>



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
		<%@ include file="/back-end/aside.jsp" %>
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


									<table id="table" data-toggle="table" data-search="true"
										data-filter-control="true" data-show-export="true"
										data-click-to-select="true" data-toolbar="#toolbar">
										<thead>
											<tr>

												<th>文章編號</th>
<!-- 												<th>作者</th> -->
												<th>標題</th>
												<th>內容</th>
<!-- 												<th>發表時間</th> -->
<!-- 												<th>次數</th> -->
												<th>狀態</th>
												<th>原因</th>
												<th>失敗</th>
												<th>成功</th>




											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="forumVO">
												<c:if test="${forumVO.status eq 1}">
	
													<tr>
														<td>${forumVO.postId }</td>
<%-- 														<td>${forumVO.memberId }</td> --%>
														<td>${forumVO.postTitle }</td>
														<td>${forumVO.postContent }</td>
<%-- 														<td>${forumVO.postTime }</td> --%>
<%-- 														<td>${forumVO.clicks }</td> --%>
														<td>${forumVO.status eq 1? '被檢舉': '正常'}</td>
														<td>${forumVO.reason }</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/ForumServlet"
																style="margin-bottom: 0px;">
																<input type="submit" value="撤銷檢舉"> <input
																	type="hidden" name="postID" value="${forumVO.postId}">
																<input type="hidden" name="action"
																	value="cancel_report">
															</FORM>
														</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/ForumServlet"
																style="margin-bottom: 0px;">
																<input type="submit" value="刪除"> <input
																	type="hidden" name="postID" value="${forumVO.postId}">
																<input type="hidden" name="action" value="delete">
															</FORM>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
									
									<table id="table" data-toggle="table" data-search="true"
										data-filter-control="true" data-show-export="true"
										data-click-to-select="true" data-toolbar="#toolbar">
										<thead>
											<tr>

												<th>留言編號</th>
												<th>文章編號</th>
												<th>留言內容</th>
<!-- 												<th>內容</th> -->
<!-- 												<th>發表時間</th> -->
<!-- 												<th>次數</th> -->
												<th>狀態</th>
												<th>原因</th>
												<th>失敗</th>
												<th>成功</th>




											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list2}" var="commentVO">
												<c:if test="${commentVO.status eq 1}">
	
													<tr>
														<td>${commentVO.commentNo }</td>
														<td>${commentVO.postId }</td>
														<td>${commentVO.commentContent }</td>
<%-- 														<td>${forumVO.postContent }</td> --%>
<%-- 														<td>${forumVO.postTime }</td> --%>
<%-- 														<td>${forumVO.clicks }</td> --%>
														<td>${commentVO.status eq 1? '被檢舉': '正常'}</td>
														<td>${commentVO.reason }</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/ForumServlet"
																style="margin-bottom: 0px;">
																<input type="submit" value="撤銷檢舉"> <input
																	type="hidden" name="postID" value="${commentVO.commentNo}">
																<input type="hidden" name="action"
																	value="cancel_report2">
															</FORM>
														</td>
														<td>
															<FORM METHOD="post"
																ACTION="<%=request.getContextPath()%>/ForumServlet"
																style="margin-bottom: 0px;">
																<input type="submit" value="刪除"> <input
																	type="hidden" name="commentNo" value="${commentVO.commentNo}">
																<input type="hidden" name="action" value="deleteComment">
															</FORM>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
									
									
									<input type="button" name="EMPregister" value="備用按鈕"
										text-align=center
										style="margin-right: 0%; width: 250px; float: right;"
										onclick="javascript:window.location.href='https://www.juksy.com/article/96554-%E5%8F%B2%E4%B8%8A%E6%9C%80%E5%8D%B1%E9%9A%AA%E7%9A%84%E5%A5%B3%E4%BA%BA%EF%BC%81Dua+Lipa+%E6%80%A7%E6%84%9F%E5%8F%88%E8%BF%B7%E4%BA%BA%E7%9A%84%E9%AD%85%E5%8A%9B%E8%AA%B0%E6%93%8B%E5%BE%97%E4%BA%86%EF%BC%9F%E8%87%AA%E6%8B%8D%E7%A7%80%E3%80%8C%E9%9B%95%E5%88%BB%E8%85%B9%E8%82%8C%E3%80%8D%E5%85%A8%E9%9D%A0+15+%E5%88%86%E9%90%98%E5%B0%B1%E8%83%BD%E9%A4%8A%E6%88%90%EF%BD%9E'" />
								
								
								
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