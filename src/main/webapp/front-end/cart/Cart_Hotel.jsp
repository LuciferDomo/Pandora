<%@page import="web.emp.bean.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%@ page import="web.discount.service.impl.DiscountServiceImpl"%>
<%@ page import="web.roomType.service.impl.RoomTypeServiceImpl"%>
<%@ page import="web.member.service.impl.MemberServiceImpl"%>
<%@ page import="web.packages.service.impl.PackagesServiceImpl"%>
<%@ page import="web.discount.bean.*"%>
<%@ page import="web.discount.bean.DiscountVO"%>
<%@ page import="web.room.bean.RoomTypeVO"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@ page import="web.packages.bean.PackagesVO"%>
<%@ page import="java.text.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.math.*"%>
<%@ include file="/front-end/header.jsp" %>

<%	
	// 測試用行程
	PackagesServiceImpl packagesService = new PackagesServiceImpl();
	PackagesVO packagesVO= (PackagesVO) request.getSession().getAttribute("packagesVO");
	PackagesVO packagesVOaa = packagesService.getOnePackage(packagesVO.getPackageNo());

	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	MemberVO memVO = (MemberVO)session.getAttribute("loginMember");
	DiscountServiceImpl discountService = new DiscountServiceImpl();
	session.setAttribute("discountVO", discountService.getOneDiscount(memVO.getDiscountNo()));
	RoomTypeServiceImpl roomTypeService = new RoomTypeServiceImpl();
	List<RoomTypeVO> roomTypeVOList = roomTypeService.getAll();
	
	DiscountVO discountVO = (DiscountVO)session.getAttribute("discountVO");
// 	PackagesVO packagesVO = (PackagesVO)session.getAttribute("packagesVO");
	
	BigDecimal discount = discountVO != null ? discountVO.getDiscount() : BigDecimal.valueOf(1);
			
			
	// 計算行程天數
	ZoneId defaultZoneId = ZoneId.systemDefault();
	DateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date startDate = Date.from(packagesVO.getDepartureTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
    Date endDate = Date.from(packagesVO.getArrivalTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
    long startTime = startDate.getTime();
    long endTime = endDate.getTime();
    int days = (int) ((endTime - startTime) / (1000 * 60 * 60 * 24));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
<meta name="author" content="Ansonika">
<title>CITY TOURS - City tours and travel site template by
	Ansonika</title>

<!-- Favicons-->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/<%=request.getContextPath()%>/Cart/html/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-144x144-precomposed.png">

<!-- GOOGLE WEB FONT -->
<link
	href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- COMMON CSS -->
<link href="<%=request.getContextPath()%>/Cart/html/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/Cart/html/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/Cart/html/css/vendors.css" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/Cart/html/css/custom.css" rel="stylesheet">


<style>

#Package {
	margin: 0 60px;
}

.Opacity04 {
	opacity: 0.4;
}

.ARoomMargin {
	margin-left: 18px !important;
}

.seat1_num_height {
	line-height: 60px !important;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/Cart/html/css/roompick.css">
</head>
<body>
	<div id="preloader">
		<div class="sk-spinner sk-spinner-wave">
			<div class="sk-rect1"></div>
			<div class="sk-rect2"></div>
			<div class="sk-rect3"></div>
			<div class="sk-rect4"></div>
			<div class="sk-rect5"></div>
		</div>
	</div>
	<!-- End Preload -->

	<div class="layer"></div>
	<!-- Mobile menu overlay mask -->

	<!-- Header================================================== -->
	<%-- <header>
		<div id="top_line">
			<div class="container">
				<div class="row">
					<div class="col-6">
						<i class="icon-phone"></i><strong>0045 043204434</strong>
					</div>
					<div class="col-6">
						<ul id="top_links">
							<li>
							  <c:if test="${loginMember != null}">
								  <font>${loginMember.memberEnglishLastName}&nbsp${loginMember.memberEnglishFirstName}</font>
							  </c:if>
							</li>
							<li>
							<c:choose>
							  <c:when test="${loginMember != null}">
										<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberSignOut">
											登出<i class="icon-logout-1" id="logout"></i>
										</a>
									</c:when>
									<c:otherwise>
										<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberLogin">
											登入<i class="icon-logout-1" id="logout"></i>
										</a>
									</c:otherwise>
								   </c:choose>
								   </li>
								   <li><a href="wishlist.html" id="wishlist_link">聯絡我們</a></li>
						</ul>
					</div>
				</div>
				<!-- End row -->
			</div>
			<!-- End container-->
		</div>
		<!-- End top line-->

		<div class="container">
			<div class="row">
				<div class="col-3">
					<div id="logo">
						<a href="index_7.html"><img src="<%=request.getContextPath()%>/Cart/html/img/logo.png"
							width="160" height="34" alt="City tours" class="logo_normal"></a>
						<a href="index_7.html"><img
							src="<%=request.getContextPath()%>/Cart/html/img/logo_sticky.png" width="160" height="34"
							alt="City tours" class="logo_sticky"></a>
					</div>
				</div>
				<nav class="col-9">
					<a class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
						href="javascript:void(0);"><span>Menu mobile</span></a>
					<div class="main-menu">
						<div id="header_menu">
							<img src="img/logo_sticky.png" width="160" height="34"
								alt="City tours">
						</div>
						<a href="#" class="open_close" id="close_in"><i
							class="icon_set_1_icon-77"></i></a>
						<ul>
							<li class="submenu" style="margin: 0 0 0 75px;"><a
								href="javascript:void(0);" class="show-submenu"
								style="width: 100px;">預定行程 </a></li>
							<li class="submenu"><a href="javascript:void(0);"
								class="show-submenu" style="width: 100px;">郵輪介紹 </a></li>
							<li class="submenu"><a href="javascript:void(0);"
								class="show-submenu" style="width: 100px;">活動新訊 </a></li>
							<li class="submenu"><a href="javascript:void(0);"
								class="show-submenu" style="width: 100px;">旅遊資訊 </a></li>
							<li class="submenu"><a href="javascript:void(0);"
								class="show-submenu" style="width: 100px;">會員中心 <i
									class="icon-down-open-mini"></i></a>
								<ul>
									<li><a href="all_restaurants_list.html">會員資訊 </a></li>
									<li><a href="all_restaurants_grid.html">會員資料修改</a></li>
									<li><a href="all_restaurants_grid_masonry.html">密碼更改</a></li>
									<li><a href="all_restaurants_map_listing.html">訂單查詢修改</a></li>
									<li><a href="single_restaurant.html">聊天室</a></li>
									<li><a href="payment_restaurant.html">討論區</a></li>
								</ul></li>


						</ul>
					</div>
					<!-- End main-menu -->
					<ul id="top_tools">
						<li><a href="javascript:void(0);"
							class="search-overlay-menu-btn"><i class="icon_search"></i></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- container -->
	</header> --%>
	<!-- End Header -->

	<section id="hero_2" class="background-image" style="background: url('https://picsum.photos/1903/800?random=5')">
		<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
			<div class="intro_title">
				<h1>規劃您的行程</h1>
				<div class="bs-wizard row">
					<div class="col-4 bs-wizard-step active">
						<div class="text-center bs-wizard-stepnum">選定行程</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="#" class="bs-wizard-dot"></a>
					</div>

					<div class="col-4 bs-wizard-step disabled">
						<div class="text-center bs-wizard-stepnum">填寫資料</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="payment_hotel.jsp" class="bs-wizard-dot"></a>
					</div>

					<div class="col-4 bs-wizard-step disabled">
						<div class="text-center bs-wizard-stepnum">完成預定！</div>
						<div class="progress">
							<div class="progress-bar"></div>
						</div>
						<a href="confirmation_hotel.jsp" class="bs-wizard-dot"></a>
					</div>
				</div>
				<!-- End bs-wizard -->
			</div>
			<!-- End intro-title -->
		</div>
		<!-- End opacity-mask-->
	</section>
	<!-- End Section hero_2 -->
	<main>
		<div id="position">
			<div class="container">
				<ul>
					<li><a href="#">首頁</a></li>
					<li><a href="#">Category</a></li>
					<li>Page active</li>
				</ul>
			</div>
		</div>
		<!-- End position -->

		<div class="container">
			<div class="row">
				<div class="col-lg-8">

					<table class="table table-striped cart-list add_bottom_30">
						<div class="container">
							<div class="row">
								<div class="col-lg-8">

									<table class="table table-striped cart-list add_bottom_30">
										<thead>
											<tr>
												<th>房型</th>
												<th>數量</th>
												<th>價格</th>
											</tr>
										</thead>
										<tbody>
											<%
											String name = null;
											int price = 0;
											int capacity = 0;
											String[] roomInfo = {"#modal_single_room", "#modal_luxury_room", "#modal_family_room", "#modal_royal_pandora_suite"};
											for (int i = 0; i < roomTypeVOList.size(); i++) {
												RoomTypeVO order = roomTypeVOList.get(i);
												name = order.getRoomType();
												price = order.getRoomPrice();
												capacity = order.getMaxCapacity();
											%>
											<tr>
												<td>
													<div class="thumb_cart">
														<a href="#" data-bs-toggle="modal" data-bs-target="<%=roomInfo[i] %>">
														<img src="<%=request.getContextPath()%>/front-end/cart/img/img<%=i %>.jpeg" alt="Image" style="width: 100%; height: 100%;"> </a>
													</div> 
													<span class="item_cart">
														<a href="#" data-bs-toggle="modal" data-bs-target="<%=roomInfo[i] %>" data-roomName="<%=name%>" data-roomPrice="<%=price%>"><%=name%></a>
													</span>
												</td>


												<td>
													<div class="numbers-row">
														<input type="text" value="0" id="quantity_1"
															class="qty2 form-control" name="quantity_1">
													</div>
												</td>
												<td><strong><%=price%></strong></td>
											</tr>
											<%
											}
											%>

										</tbody>
									</table>
									<div class="add_bottom_15">
										<small>* 精緻/豪華客房及潘朵拉套房每間可容納2人，家庭客房可容納4人</small>
									</div>
									<div class="add_bottom_15">
										<small>* 總計 = 行程天數 * 房型價格 * 會員折扣</small>
									</div>

								</div>
								<!-- End col-lg-8 -->

								<aside class="col-lg-4" style="margin-top: 15px;">
									<div id="orderSummary1" class="box_style_1">
										<h3 class="inner">-行程概要-</h3>
										<table class="table table_summary">
											<tbody>
												<tr>
													<td>行程名稱</td>
													<td id="PackageB" class="text-end"><%=packagesVO.getPackageName() %></td>
												</tr>
												<tr>
													<td>行程天數</td>
													<td id="Duration" class="text-end"><%=days %></td>
												</tr>
												<tr>
													<td>出發日期</td>
													<td id="Start_Date" class="text-end"><%=packagesVO.getRegistrationStartTime() %></td>
												</tr>
												<tr>
													<td>預定房型</td>
													<td id="Room_Type1" class="text-end"></td>
													<!-- <td id="Number_of_Rooms" class="text-end"></td> -->
												</tr>
												<tr>
													<td>房間總數</td>
													<td id="Number_of_Rooms" class="text-end"></td>
												</tr>
												<tr class="total">
													<td>-總計-</td>
													<td id="Total_Cost" class="text-end"></td>
												</tr>
											</tbody>
										</table>
										<a id="confirmRoomType" class="btn_full">前往房間劃位</a> <a
											class="btn_full_outline" href="<%=request.getContextPath()%>/front-end/package/homePage.jsp">返回行程搜尋</a>
									</div>

								</aside>
								<!-- End aside -->
							</div>
							<!--End row -->
						</div>
						<!--End container -->

						<div id="ship" class="container" style="display: none">
							<div class="row">
								<div class="col-8">
									<section id="bus_container">
										<div class="d-flex justify-content-left" id="bus"
											style="padding-bottom: 50px; padding-top: 30px;">
											<div class="">
												<ul class="bus bus2"
													style="padding: 20px; border-radius: 100px 100px 10px 10px; margin-left: 55px;">
													<li style="margin: 60px 0 0 0;">
														<!--seat1 = 潘多拉套房--> <a id="A01"
														class="seat1 ARoomMargin Opacity04"
														style="background-color: #00FFFF" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="A02"
														class="seat1 justify-content-center Opacity04"
														style="background-color: #00FFFF" data-pickStatus="false"></a>
													</li>
													<li><span class="passage" style="height: 10px;"></span></li>
													<li>
														<!--seat2 = 精緻客房--> <a id="B01"
														class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<a id="B02" class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="B03"
														class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<a id="B04" class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
													</li>
													<li><a id="B05"
														class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<a id="B06" class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="B07"
														class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a>
														<a id="B08" class="seat2 justify-content-center Opacity04"
														style="background-color: #52eb11" data-pickStatus="false"></a></li>
													<li><span class="passage" style="height: 10px;"></span></li>
													<li>
														<!--seat3 = 家庭客房--> <a id="C01"
														class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<a id="C02" class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="C03"
														class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<a id="C04" class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
													</li>
													<li><a id="C05"
														class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<a id="C06" class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="C07"
														class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a>
														<a id="C08" class="seat3 justify-content-center Opacity04"
														style="background-color: #816cdf" data-pickStatus="false"></a></li>
													<li><span class="passage" style="height: 10px;"></span></li>
													<li>
														<!--seat4 = 豪華客房--> <a id="D01"
														class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<a id="D02" class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="D03"
														class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<a id="D04" class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
													</li>
													<li><a id="D05"
														class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<a id="D06" class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="D07"
														class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a>
														<a id="D08" class="seat4 justify-content-center Opacity04"
														style="background-color: #e3b981" data-pickStatus="false"></a></li>
													<li><span class="passage" style="height: 10px;"></span></li>

													<li><a id="A03" class="seat1 ARoomMargin Opacity04"
														style="background-color: #00FFFF" data-pickStatus="false"></a>
														<span class="passage"></span> <a id="A04"
														class="seat1 Opacity04" style="background-color: #00FFFF"
														data-pickStatus="false"></a></li>
												</ul>
												<div>
													<small>*房型分類： Ａ = 潘多拉套房，B = 精緻客房，C = 家庭客房，D = 豪華客房</small>
												</div>
											</div>
										</div>
									</section>
								</div>

								<aside class="col-lg-4" style="margin-top: 30px;">
									<div class="box_style_1">
										<h3 class="inner">-選擇房型-</h3>
										<table class="table table_summary">
											<tbody>
												<tr>
													<td>房號:</td>
													<td id="PickedRoomNo" class="text-end"></td>
												</tr>
												<tr>
													<td>房型:</td>
													<td id="PickedRoomType" class="text-end"></td>
												</tr>
												<tr>
													<td>可容納人數:</td>
													<td id="Capacity" class="text-end"></td>
												</tr>
											</tbody>
										</table>
										<a class="btn_full" id="pickOrNotButton">選擇</a> <a
											id="goToPayment" class="btn_full_outline">前往結帳</a>
									</div>
								</aside>

							</div>
						</div>
						</main>
						<!-- End main -->

						<footer class="revealed">
							<div class="container">
								<div class="row"></div>
								<!-- End row -->
								<div class="row">
									<div class="col-md-12">
										<div id="social_footer">
											<p>© Pandora 2022</p>
										</div>
									</div>
								</div>
								<!-- End row -->
							</div>
							<!-- End container -->
						</footer>
						<!-- End footer -->

						<div id="toTop"></div>
						<!-- Back to top button -->

						<!-- Search Menu -->
						<div class="search-overlay-menu">
							<span class="search-overlay-close"><i
								class="icon_set_1_icon-77"></i></span>
							<form role="search" id="searchform" method="get">
								<input value="" name="q" type="text" placeholder="Search..." />
								<button type="submit">
									<i class="icon_set_1_icon-78"></i>
								</button>
							</form>
						</div>
						<!-- End Search Menu -->

						<!-- Sign In Popup -->
						<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
							<div class="small-dialog-header">
								<h3>Sign In</h3>
							</div>
							<form>
								<div class="sign-in-wrapper">
									<a href="#0" class="social_bt facebook">Login with Facebook</a>
									<a href="#0" class="social_bt google">Login with Google</a>
									<div class="divider">
										<span>Or</span>
									</div>
									<div class="form-group">
										<label>Email</label> <input type="email" class="form-control"
											name="email" id="email"> <i class="icon_mail_alt"></i>
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password"
											class="form-control" name="password" id="password" value="">
										<i class="icon_lock_alt"></i>
									</div>
									<div class="clearfix add_bottom_15">
										<div class="checkboxes float-start">
											<label class="container_check">Remember me <input
												type="checkbox"> <span class="checkmark"></span>
											</label>
										</div>
										<div class="float-end">
											<a id="forgot" href="javascript:void(0);">忘記密碼</a>
										</div>
									</div>
									<div class="text-center">
										<input type="submit" value="Log In" class="btn_login">
									</div>
									<div class="text-center">
										Don’t have an account? <a href="javascript:void(0);">註冊</a>
									</div>
									<div id="forgot_pw">
										<div class="form-group">
											<label>Please confirm login email below</label> <input
												type="email" class="form-control" name="email_forgot"
												id="email_forgot"> <i class="icon_mail_alt"></i>
										</div>
										<p>You will receive an email containing a link allowing
											you to reset your password to a new preferred one.</p>
										<div class="text-center">
											<input type="submit" value="Reset Password" class="btn_1">
										</div>
									</div>
								</div>
							</form>
							<!--form -->
						</div>
						<!-- /Sign In Popup -->

						<!-- Modal Single room-->
						<div class="modal fade" id="modal_single_room" tabindex="-1"
							role="dialog" aria-labelledby="modal_single_room"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="modal_single_room">精緻客房</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											不論是獨自旅行，或是攜伴遊玩，精緻客房可以滿足您整趟旅程所有的需要。溫暖的床鋪，不斷線的網路，還有什麼能挑剔的? <br>
											若真有美中不足，那就只能是房型大小了。更寬闊的空間，請往下點選豪華客房或是潘多拉套房。
										</p>
										<div class="row">
											<div class="col-md-6">
												<ul class="list_icons">
													<li><i class="icon_set_1_icon-86"></i>沒有免費的Wi-Fi好嗎?</li>
													<li><i class="icon_set_2_icon-116"></i>號稱50吋液晶螢幕</li>
													<li><i class="icon_set_2_icon-106"></i>功能正常的保險箱</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="list_ok">
													<li>Wi-Fi不貴，建議購買以免無聊</li>
													<li>電視節目不多，建議多享受船上設施</li>
													<li>保險箱絕對保險，我們保證!</li>
												</ul>
											</div>
										</div>
										<!-- End row  -->
										<div
											class="owl-carousel owl-theme carousel-thumbs magnific-gallery">
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" alt="Image"> </a>
											</div>
										</div>
										<!-- End photo carousel  -->
									</div>
								</div>
							</div>
						</div>

						<!-- Modal Double room-->
						<div class="modal fade" id="modal_luxury_room" tabindex="-1"
							role="dialog" aria-labelledby="modal_luxury_room"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="modal_luxury_room">豪華客房</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											比精緻客房稍大，絕對可以滿足您整趟旅程所有需要的就是豪華客房了!溫暖的床鋪，不斷線的網路，還有什麼能挑剔的? <br>
											若真有美中不足，那就只能是空間更寬闊的潘多拉套房。
										</p>
										<div class="row">
											<div class="col-md-6">
												<ul class="list_icons">
													<li><i class="icon_set_1_icon-86"></i>沒有免費的Wi-Fi好嗎?</li>
													<li><i class="icon_set_2_icon-116"></i>號稱50吋液晶螢幕</li>
													<li><i class="icon_set_2_icon-106"></i>功能正常的保險箱</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="list_ok">
													<li>Wi-Fi不貴，建議購買以免無聊</li>
													<li>電視節目不多，建議多享受船上設施</li>
													<li>保險箱絕對保險，我們保證!</li>
												</ul>
											</div>
										</div>
										<!-- End row  -->
										<div
											class="owl-carousel owl-theme carousel-thumbs magnific-gallery">
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" alt="Image"> </a>
											</div>
										</div>
										<!-- End photo carousel  -->
									</div>
								</div>
							</div>
						</div>

						<!-- Modal Family room-->
						<div class="modal fade" id="modal_family_room" tabindex="-1"
							role="dialog" aria-labelledby="modal_family_room"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="modal_family_room">家庭客房</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											Royal Pandora郵輪上最適合家庭旅遊的房型。只要您的孩子人數不超過兩個，這個房型就是您的最佳選擇，沒有之一。 <br>
											如果超過兩位小朋友怎麼辦?請訂第二間房。
										</p>
										<div class="row">
											<div class="col-md-6">
												<ul class="list_icons">
													<li><i class="icon_set_1_icon-86"></i>沒有免費的Wi-Fi好嗎?</li>
													<li><i class="icon_set_2_icon-116"></i>號稱50吋液晶螢幕</li>
													<li><i class="icon_set_2_icon-106"></i>功能正常的保險箱</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="list_ok">
													<li>Wi-Fi不貴，建議購買以免無聊</li>
													<li>電視節目不多，建議多享受船上設施</li>
													<li>保險箱絕對保險，我們保證!</li>
												</ul>
											</div>
										</div>
										<!-- End row  -->
										<div
											class="owl-carousel owl-theme carousel-thumbs magnific-gallery">
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" alt="Image"> </a>
											</div>
										</div>
										<!-- End photo carousel  -->
									</div>
								</div>
							</div>
						</div>

						<!-- Modal Royal Pandora Suite-->
						<div class="modal fade" id="modal_royal_pandora_suite"
							tabindex="-1" role="dialog"
							aria-labelledby="modal_royal_pandora_suite" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="modal_royal_pandora_suite">潘多拉套房</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											Royal Pandora郵輪上最大最奢侈的房型。預定這間房間如同找到潘多拉的盒子底部的希望，您的旅程將充滿希望之光。 <br>
											如果還有美中不足的地方，請選別家遊輪。
										</p>
										<div class="row">
											<div class="col-md-6">
												<ul class="list_icons">
													<li><i class="icon_set_1_icon-86"></i>沒有免費的Wi-Fi好嗎?</li>
													<li><i class="icon_set_2_icon-116"></i>號稱50吋液晶螢幕</li>
													<li><i class="icon_set_2_icon-106"></i>功能正常的保險箱</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="list_ok">
													<li>Wi-Fi不貴，建議購買以免無聊</li>
													<li>電視節目不多，建議多享受船上設施</li>
													<li>保險箱絕對保險，我們保證!</li>
												</ul>
											</div>
										</div>
										<!-- End row  -->
										<div
											class="owl-carousel owl-theme carousel-thumbs magnific-gallery">
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img0.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img1.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img2.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img3.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img4.jpeg" alt="Image"> </a>
											</div>
											<div class="item">
												<a href="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" data-effect="mfp-zoom-in"><img
													src="<%=request.getContextPath()%>/front-end/cart/img/img5.jpeg" alt="Image"> </a>
											</div>
										</div>
										<!-- End photo carousel  -->
									</div>
								</div>
							</div>
						</div>
</body>
<!-- Jquery -->
<script src="<%=request.getContextPath()%>/Cart/html/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/Cart/html/js/common_scripts_min.js"></script>
<script src="<%=request.getContextPath()%>/Cart/html/js/functions.js"></script>
<script src="<%=request.getContextPath()%>/Cart/html/js/yang.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
		$('.carousel-thumbs').owlCarousel({
			loop: true,
			margin: 5,
			responsiveClass: true,
			nav: false,
			responsive: {
				0: {
					items: 1
				},
				600: {
					items: 3
				},
				1000: {
					items: 4,
					nav: false,
					loop: false
				}
			}
		});
	</script>

<script>
	$(document).ready(function() {
		/*print seat number--------------*/
		let b2 = 0;
		$(".bus2 .seat1").each(function() {
			b2++;
			$(this).append("<em class='seat1_num seat1_num_height'>" + 'A0' + b2 + "</em>");
		});
	});
</script>
<script>
	$(document).ready(function() {
		/*print seat number--------------*/
		let b2 = 0;
		$(".bus2 .seat2").each(function() {
			b2++;
			$(this).append("<em class='seat2_num'>" + 'B0' + b2 + "</em>");
		});
	});
</script>
<script>
	$(document).ready(function() {
		/*print seat number--------------*/
		let b2 = 0;
		$(".bus2 .seat3").each(function() {
			b2++;
			$(this).append("<em class='seat3_num'>" + 'C0' + b2 + "</em>");
		});
	});
</script>
<script>
	$(document).ready(function() {
		/*print seat number--------------*/
		let b2 = 0;
		$(".bus2 .seat4").each(function() {
			b2++;
			$(this).append("<em class='seat4_num'>" + 'D0' + b2 + "</em>");
		});
	});
</script>


<script>
// 房型對應英文開頭
let roomChiNameAndEng = new Map();
roomChiNameAndEng.set('B', '精緻客房');
roomChiNameAndEng.set('D', '豪華客房');
roomChiNameAndEng.set('C', '家庭客房');
roomChiNameAndEng.set('A', '潘多拉套房');

// 創建 房型對應數量 & 房型對應價格 map
let roomTypeAndCountPair = new Map();
let roomTypeAndPricePair = new Map();

$('.table.table-striped.cart-list.add_bottom_30').find('div').on('click', '.inc.button_inc', function (e) {
	let roomName = e.target.parentNode.parentNode.parentNode.firstElementChild.lastElementChild.firstElementChild.getAttribute('data-roomname');
	let roomPrice = e.target.parentNode.parentNode.parentNode.firstElementChild.lastElementChild.firstElementChild.getAttribute('data-roomprice');
	let roomCount = e.target.parentNode.parentNode.firstElementChild.firstElementChild.value;

	roomTypeAndCountPair.set(roomName, roomCount); // 將此次點及的roomType & roomCount 放進 roomTypeAndCountPair map中
	roomTypeAndPricePair.set(roomName, roomPrice); // 將此次點及的roomType & roomPrice 放進 roomTypeAndCountPair map中

	let roomTypeOneStr = ''; // 給右邊畫面 預定房型 用
	let roomTotalCount = 0; // 給右邊畫面 房間數量 用
	let roomTotalPrice = 0; // 給右邊畫面 -總計- 用

	// 將roomType key 遍例出來組成 roomTypeOneStr & 計算房間總數量
	for (let [key, value] of roomTypeAndCountPair) {
		roomTypeOneStr = roomTypeOneStr + key + "&nbsp;X&nbsp;" + (parseInt(value)) + '<br>'; // 預定房型內容文字串接
		roomTotalCount += parseInt(value);  // 房間數量累加 (parseInt 將文字轉成數字)

		// 計算總價
		let roomTypeCount = parseInt(value);
		let roomTypeName = key;
		for (let [key, value] of roomTypeAndPricePair) {
			if (roomTypeName === key) {
				roomTotalPrice += roomTypeCount * <%=days %> * value; // 房型數量*房型價格
			}
		}
	}
	roomTotalPrice = roomTotalPrice * <%=discount %>;
	roomTotalPrice = roomTotalPrice.toFixed(0);

	// 預定房型 : 取得element 並使用innerHTML 將roomTypeOneStr 放入html結構
	let roomTypeOne = document.getElementById('Room_Type1');
	roomTypeOne.innerHTML = roomTypeOneStr;

	// 房間數量 : 取得element 並使用innerHTML roomTotalCount 放入html結構
	let passengerNumber = document.getElementById('Number_of_Rooms');
	passengerNumber.innerHTML = roomTotalCount;

	// 總計 : 取得element 並使用innerHTML roomTotalPrice 放入html結構
	let totalCost = document.getElementById('Total_Cost');
	totalCost.innerHTML = 'TWD' + roomTotalPrice;
});

$('.table.table-striped.cart-list.add_bottom_30').find('div').on('click', '.dec.button_inc', function (e) {
	let roomName = e.target.parentNode.parentNode.parentNode.firstElementChild.lastElementChild.firstElementChild.getAttribute('data-roomname');
	let roomPrice = e.target.parentNode.parentNode.parentNode.firstElementChild.lastElementChild.firstElementChild.getAttribute('data-roomprice');
	let roomCount = e.target.parentNode.parentNode.firstElementChild.firstElementChild.value;
	
	if (roomCount > 0) {
		roomTypeAndCountPair.set(roomName, roomCount); // 若count > 0 更新數量
	} else {
		roomTypeAndCountPair.delete(roomName); // 若count =< 0 刪除該key資料
	}

	let roomTypeOneStr = ''; // 給右邊畫面 預定房型 用
	let roomTotalCount = 0; // 給右邊畫面 房間數量 用
	let roomTotalPrice = 0; // 給右邊畫面 -總計- 用

	// 將roomType key 遍例出來組成 roomTypeOneStr & 計算房間總數量
	for (let [key, value] of roomTypeAndCountPair) {
		roomTypeOneStr = roomTypeOneStr + key + "&nbsp;X&nbsp;" + (parseInt(value)) + '<br>';
		roomTotalCount += parseInt(value); // 房間數量累加 (parseInt 將文字轉成數字)

		// 計算總價
		let roomTypeCount = parseInt(value);
		let roomTypeName = key;
		for (let [key, value] of roomTypeAndPricePair) {
			if (roomTypeName === key) {
				roomTotalPrice += roomTypeCount * <%=days %> * value; // 房型數量*房型價格
			}
		}
	}
	roomTotalPrice = roomTotalPrice * <%=discount %>;
	roomTotalPrice = roomTotalPrice.toFixed(0);

	// 取得element 並使用innerHTML 將roomTypeOneStr 放入html結構
	let roomTypeOne = document.getElementById('Room_Type1');
	roomTypeOne.innerHTML = roomTypeOneStr;

	// 房間數量 : 取得element 並使用innerHTML roomTotalCount 放入html結構
	let passengerNumber = document.getElementById('Number_of_Rooms');
	passengerNumber.innerHTML = roomTotalCount;

	// 總計 : 取得element 並使用innerHTML roomTotalPrice 放入html結構
	let totalCost = document.getElementById('Total_Cost');
	totalCost.innerHTML = 'TWD' + roomTotalPrice;
});

$('#confirmRoomType').on('click', function(e) {
	if(roomTypeAndCountPair.size === 0){
		swal("請選擇房型", "請至少選擇一間", "error");
	} else {
		let data = {};
		data.action = "confirmRoomTypeAndShowShip";
		data.packageNo = <%=packagesVO.getPackageNo() %>;
	
		$.ajax({
			url : "<%=request.getContextPath()%>/CartHotelServlet",
			type : "post",
			data : data,
			success : function(result) {
				let obj = JSON.parse(result);
				
				if(obj.length < 28){
					document.getElementById('ship').removeAttribute('style');
					for(let o of obj){
						let doc = document.getElementById(o.bookedRoomNo);
						doc.firstElementChild.innerHTML='';
						doc.setAttribute('style', 'pointer-events: none; background-color:#494444')
					}
				}
			}
		});
	}
});
</script>

<script>
	let currentPickRoomNode = undefined;
	$('.bus.bus2 a').on('click', function(e) {
		console.log("ship room click!");
		let roomNumber = e.target.textContent;
		
		let data = {};
		data.action = "getRoomPickInfo";
		data.shipNo = <%=packagesVO.getShipNo() %>;
		data.roomNo = roomNumber;
		
		$.ajax({
			url : "<%=request.getContextPath()%>/CartHotelServlet",
			type : "post",
			data : data,
			success : function(result) {
				let obj = JSON.parse(result);
					
					// 取得element 並使用innerHTML 將obj.room 放入html結構
					let roomNo = document.getElementById('PickedRoomNo');
					roomNo.innerHTML = obj.roomNo;

					let roomType = document.getElementById('PickedRoomType');
					roomType.innerHTML = obj.roomType;

					let maxCapacity = document.getElementById('Capacity');
					maxCapacity.innerHTML = obj.maxCapacity;
					
					currentPickRoomNode = e.target.parentNode;
					
					let isPick = currentPickRoomNode.getAttribute('data-pickstatus');
					if(isPick === 'true'){
						$('#pickOrNotButton').html('取消選擇');
					} else {
						$('#pickOrNotButton').html('選擇');
					}
			}
		});
	});
	
	let selectedRoomArray = [];
	let checkMap = new Map();
	$('#pickOrNotButton').on('click', function(){
		let isPick = currentPickRoomNode.getAttribute('data-pickstatus');
		let currentRoomTypeFirstWord = currentPickRoomNode.id.substring(0, 1);
		if(isPick === 'true'){
			currentPickRoomNode.setAttribute('data-pickstatus', 'false');
			$('#pickOrNotButton').html('選擇');
			let newStyle = currentPickRoomNode.getAttribute('style').replace('; opacity: 1', '');
			currentPickRoomNode.setAttribute('style', newStyle);
			selectedRoomArray.splice(selectedRoomArray.indexOf(currentPickRoomNode.textContent), 1);
			checkMap.set(currentRoomTypeFirstWord, checkMap.get(currentRoomTypeFirstWord) - 1);
		} else {
			if(roomTypeAndCountPair.has(roomChiNameAndEng.get(currentRoomTypeFirstWord))){
				let maxCount = roomTypeAndCountPair.get(roomChiNameAndEng.get(currentRoomTypeFirstWord));
				let currentCount = checkMap.get(currentRoomTypeFirstWord) + 1;
				if(currentCount > maxCount){
					swal(roomChiNameAndEng.get(currentRoomTypeFirstWord) + '劃位數量已達上限', "", "error");
				} else {
					currentPickRoomNode.setAttribute('data-pickstatus', 'true');
					$('#pickOrNotButton').html('取消選擇');
					let newStyle = currentPickRoomNode.getAttribute('style') + '; opacity: 1';
					currentPickRoomNode.setAttribute('style', newStyle);
					selectedRoomArray.push(currentPickRoomNode.textContent);
					checkMap.set(currentRoomTypeFirstWord, checkMap.has(currentRoomTypeFirstWord) ? checkMap.get(currentRoomTypeFirstWord) + 1 : 1);
				}
			} else {
				swal(roomChiNameAndEng.get(currentRoomTypeFirstWord) + '為非預定房型', "", "error");
			}
		}
	});
	
	$('#goToPayment').on('click', function(e){
	
		let order = {};
		order.action = 'goToPayment';
		order.shipNo = <%=packagesVO.getShipNo()%>
		order.selectedRoomArray = selectedRoomArray;
		
		$.ajax({
		  url: "<%=request.getContextPath()%>/CartHotelServlet",
		  type : "post",
		  data: order,
		  dataType: 'json',
		  success: function(res){
		    console.log("ajax : goToPayment return sucess");
		    window.location.href = '/pandora/front-end/cart/Payment_Hotel.jsp';
		  }  
		}); 
	});

</script>

</html>