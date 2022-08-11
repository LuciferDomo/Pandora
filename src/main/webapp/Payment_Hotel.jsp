<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="web.discount.service.impl.*"%>
<%@ page import="web.roomType.service.impl.*"%>
<%@ page import="web.member.service.impl.*"%>
<%@ page import="web.packages.service.impl.*"%>
<%@ page import="web.discount.bean.*"%>
<%@ page import="web.room.bean.*"%>
<%@ page import="web.member.bean.*"%>
<%@ page import="web.packages.bean.*"%>
<%@ page import="web.room.joinbean.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.math.*"%>

<%
	DiscountVO discountVO = (DiscountVO) session.getAttribute("discountVO");
	PackagesVO packagesVO = (PackagesVO) session.getAttribute("packagesVO");
	MemberVO memVO = (MemberVO) session.getAttribute("memVO");
	List<RoomTypeAndRoomListVO> seletedRoomInfo = (List<RoomTypeAndRoomListVO>) session.getAttribute("seletedRoomInfo");

	BigDecimal discount = discountVO != null ? discountVO.getDiscount() : BigDecimal.valueOf(1);

	// 計算行程天數
	ZoneId defaultZoneId = ZoneId.systemDefault();
	DateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date startDate = Date.from(packagesVO.getDepartureTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
	Date endDate = Date.from(packagesVO.getArrivalTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
	long startTime = startDate.getTime();
	long endTime = endDate.getTime();
	int days = (int) ((endTime - startTime) / (1000 * 60 * 60 * 24));

	// 總金額
	int totalPrice = 0;
	for (RoomTypeAndRoomListVO bean : seletedRoomInfo) {
		totalPrice += bean.getRoomPrice();
	}
	totalPrice = (int) (totalPrice * days * Double.parseDouble(String.valueOf(discount)));
	session.setAttribute("totalPrice", totalPrice);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
<meta name="author" content="Ansonika">
<title>CITY TOURS - City tours and travel site template by
	Ansonika</title>

<!-- Favicons-->
<link rel="shortcut icon" href="Cart/html/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="Cart/html/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="Cart/html/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="Cart/html/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="Cart/html/img/apple-touch-icon-144x144-precomposed.png">

<!-- GOOGLE WEB FONT -->
<link
	href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- COMMON CSS -->
<link href="Cart/html/css/bootstrap.min.css" rel="stylesheet">
<link href="Cart/html/css/style.css" rel="stylesheet">
<link href="Cart/html/css/vendors.css" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="Cart/html/css/custom.css" rel="stylesheet">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="Cart/html/https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="Cart/html/https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="Cart/html/https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->

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
	<header>
		<div id="top_line">
			<div class="container">
				<div class="row">
					<div class="col-6" style="width: 630px; left: -100; right: 100px;">
						<i class="icon-phone"></i><strong>0045 043204434</strong>
					</div>
					<div class="col-6" style="left: 95px; right: -95px;">
						<ul id="top_links">
							<li><a href="Cart/html/#sign-in-dialog" id="access_link"
								style="text-shadow: none;">登入</a></li>
							<li><a href="Cart/html/wishlist.html" id="wishlist_link"
								style="text-shadow: none;">聯絡我們</a></li>
						</ul>
					</div>
				</div>
				<!-- End row -->
			</div>
			<!-- End container-->
		</div>
		<!-- End top line-->

		<div class="container justify-content-right"
			style="width: 1296px; padding: 0 12px 0 12px; margin: 0 52.5px 0 52.5px;">
			<div class="row">
				<div class="col-3">
					<div id="logo">
						<a href="Cart/html/index.html"><img
							src="Cart/html/img/logo.png" width="160" height="34"
							alt="City tours" class="logo_normal"></a> <a
							href="Cart/html/index.html"><img
							src="Cart/html/img/logo_sticky.png" width="160" height="34"
							alt="City tours" class="logo_sticky"></a>
					</div>
				</div>
				<nav class="col-9">
					<a class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
						href="Cart/html/javascript:void(0);"><span>Menu mobile</span></a>
					<div class="main-menu">
						<div id="header_menu">
							<img src="Cart/html/img/logo_sticky.png" width="160" height="34"
								alt="City tours">
						</div>
						<a href="Cart/html/#" class="open_close" id="close_in"><i
							class="icon_set_1_icon-77"></i></a>
						<ul
							style="padding-right: 0px; right: auto; left: 40px; width: 900px;">
							<li class="submenu" style="margin: 0 0 0 75px;"><a
								href="Cart/html/javascript:void(0);" class="show-submenu"
								style="width: 100px; text-shadow: none;">預定行程 </a></li>
							<li class="submenu"><a href="Cart/html/javascript:void(0);"
								class="show-submenu" style="width: 100px; text-shadow: none;">郵輪介紹
							</a></li>
							<li class="submenu"><a href="Cart/html/javascript:void(0);"
								class="show-submenu" style="width: 100px; text-shadow: none;">活動新訊
							</a></li>
							<li class="submenu"><a href="Cart/html/javascript:void(0);"
								class="show-submenu" style="width: 100px; text-shadow: none;">旅遊資訊
							</a></li>
							<li class="submenu"><a href="Cart/html/javascript:void(0);"
								class="show-submenu" style="width: 100px; text-shadow: none;">會員中心
									<i class="icon-down-open-mini"></i>
							</a>
								<ul>
									<li><a href="Cart/html/all_restaurants_list.html">會員資訊
									</a></li>
									<li><a href="Cart/html/all_restaurants_grid.html">會員資料修改</a></li>
									<li><a href="Cart/html/all_restaurants_grid_masonry.html">密碼更改</a></li>
									<li><a href="Cart/html/all_restaurants_map_listing.html">訂單查詢修改</a></li>
									<li><a href="Cart/html/single_restaurant.html">聊天室</a></li>
									<li><a href="Cart/html/payment_restaurant.html">討論區</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- End main-menu -->
					<ul id="top_tools"
						style="width: 100px; position: 900px; left: 940px;">
						<li><a href="Cart/html/javascript:void(0);"
							class="search-overlay-menu-btn"><i class="icon_search"></i></a></li>
						<li>
							<div class="dropdown dropdown-cart">
								<a href="Cart/html/#" data-bs-toggle="dropdown" class="cart_bt"><i
									class="icon_bag_alt"></i><strong>3</strong></a>
								<ul class="dropdown-menu" id="cart_items">
									<li>
										<div class="image">
											<img src="Cart/html/img/thumb_cart_1.jpg" alt="image">
										</div> <strong><a href="Cart/html/#">Louvre museum</a>1x
											$36.00 </strong> <a href="Cart/html/#" class="action"><i
											class="icon-trash"></i></a>
									</li>
									<li>
										<div class="image">
											<img src="Cart/html/img/thumb_cart_2.jpg" alt="image">
										</div> <strong><a href="Cart/html/#">Versailles tour</a>2x
											$36.00 </strong> <a href="Cart/html/#" class="action"><i
											class="icon-trash"></i></a>
									</li>
									<li>
										<div class="image">
											<img src="Cart/html/img/thumb_cart_3.jpg" alt="image">
										</div> <strong><a href="Cart/html/#">Versailles tour</a>1x
											$36.00 </strong> <a href="Cart/html/#" class="action"><i
											class="icon-trash"></i></a>
									</li>
									<li>
										<div>
											Total: <span>$120.00</span>
										</div> <a href="Cart/html/cart.html" class="button_drop">Go to
											cart</a> <a href="Cart/html/payment.html"
										class="button_drop outline">Check out</a>
									</li>
								</ul>
							</div> <!-- End dropdown-cart-->
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- container -->
	</header>
	<!-- End Header -->

	<section id="hero_2" class="background-image"
		data-background="url(img/slide_hero_2.jpg)" style="text-align: center">
		<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
			<div class="intro_title">
				<h1 style="text-shadow: none;">規劃您的行程</h1>
				<center>
					<div class="bs-wizard row" style="text-align: right">
						<div class="col-4 bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum"
								style="text-align: right">選定行程</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="Cart/html/#" class="bs-wizard-dot"></a>
						</div>

						<div class="col-4 bs-wizard-step disabled"
							style="text-align: right">
							<div class="text-center bs-wizard-stepnum"
								style="text-align: right">填寫資料</div>
							<div class="progress" style="text-align: right">
								<div class="progress-bar" style="text-align: right"></div>
							</div>
							<a href="Cart/html/payment_hotel.html" class="bs-wizard-dot"></a>
						</div>

						<div class="col-4 bs-wizard-step disabled"
							style="text-align: right">
							<div class="text-center bs-wizard-stepnum"
								style="text-align: right">完成預定！</div>
							<div class="progress" style="text-align: right">
								<div class="progress-bar"></div>
							</div>
							<a href="Cart/html/confirmation_hotel.html" class="bs-wizard-dot"></a>
						</div>
					</div>
				</center>
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
					<li><a href="Cart/html/#">首頁</a></li>
					<li><a href="Cart/html/#">Category</a></li>
					<li>Page active</li>
				</ul>
			</div>
		</div>
		<!-- End position -->

		<div class="container mt-3">
			<div class="row">
				<div class="col-lg-8 add_bottom_15">
					<div class="form_title">
						<h3>
							<strong></strong>詳細資訊
						</h3>
					</div>
					<div id="passenger_info" class="step">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>中文姓名*</label> <input type="text" class="form-control"
										name="chineseName"
										value="<%=memVO != null ? memVO.getChineseName() : ""%>">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>出生日期＊</label> <input class="date-pick form-control"
										name="birthday"
										type="date"
										value="<%=memVO != null ? memVO.getMemberBirthday() : ""%>">
								</div>
							</div>
							<div class="form-group col-md-6">
							<label>性別＊</label>
								<select name="sex" class="form-control" required>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照英文名字*</label> <input type="text" class="form-control"
										name="firstName"
										value="<%=memVO != null ? memVO.getMemberEnglishFirstName() : ""%>">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照英文姓氏*</label> <input type="text" class="form-control"
										name="lastName"
										value="<%=memVO != null ? memVO.getMemberEnglishLastName() : ""%>">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照號碼*</label> <input type="text" class="form-control"
										name="passportNumber"
										value="<%=memVO != null ? memVO.getMemberIdNo() : ""%>">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>電子信箱＊</label> <input type="email"
										name="email" class="form-control"
										value="<%=memVO != null ? memVO.getMemberEmail() : ""%>">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>聯絡電話</label> <input type="text"
										name="telephone" class="form-control"
										value="<%=memVO != null ? memVO.getMemberPhoneNumber() : ""%>">
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 改善建議/開始 -->
							<div class="col-sm-12">
							<label>地址</label>
									<div id="twzipcode" class="form-row">
										<div class="form-group col">
											<div data-role="county" data-style="form-control"
												data-name="county" data-value=""></div>
										</div>
										<div class="form-group col">
											<div data-role="district" data-style="form-control"
												data-name="district" data-value=""></div>
										</div>
										<div class="form-group col">
											<div data-role="zipcode" data-style="form-control"
												data-name="zipcode" data-value=""></div>
										</div>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="inputAddress2"
											placeholder="居住地址" name="address">
									</div>
									<!--End row -->
							</div>
							<!--End step -->
							
						</div>
					</div>
					
					<div class="targetParaent" style="display:none">
					<div class="copyTarget step">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>中文姓名*</label> <input type="text" class="form-control" name="peerChineseName" >
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>出生日期＊</label> <input class="date-pick form-control" name="peerBirthday" type="date">
								</div>
							</div>
							<div class="form-group col-md-6">
							<label>性別＊</label>
								<select name="peerSex" class="form-control" required>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照英文名字*</label> <input type="text" class="form-control"
										name="peerFirstName" >
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照英文姓氏*</label> <input type="text" class="form-control"
										name="peerLastName">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>護照號碼*</label> <input type="text" class="form-control"
										name="peerPassportNumber">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>電子信箱＊</label> <input type="email" name="peerEmail" class="form-control">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>聯絡電話</label> <input type="text" name="peerTelephone" class="form-control">
								</div>
							</div>
						</div>
					</div>
					</div>

					<div id="div_block" style="background: none; color: #222;">
						<h3 style="padding-left: 51px;">同行人資料</h3>
						
					</div>
					<div style="display: inline-block;">
					<a type=" button" id="the_btn" class="btn_1 medium;" style="text-shadow: none; margin-left: 51px; margin-bottom: 30px; color: white">新增同行人資料</a>
					</div>
					<div id="Book_now" style="display: inline-block; float: right;">
						<a class="btn_1 green medium" id="sendOrder" style="text-shadow: none;">送出訂單</a>
					</div>
					<div id="ecpay"></div>
					<!--End step -->

				<head>
					<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
					<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
				</head>
						
				</div>

				<aside class="col-lg-4"
					style="padding-left: 5px; padding-right: 5px;">
					<div class="box_style_1">
						<h3 class="inner" style="text-shadow: none;">-行程概要-</h3>
						<table class="table table_summary">
							<tbody>
								<tr>
									<td>行程名稱</td>
									<td id="PackageB" class="text-end"><%=packagesVO.getPackageName()%></td>
								</tr>
								<tr>
									<td>行程天數</td>
									<td id="Start_Date" class="text-end"><%=days%></td>
								</tr>
								<tr>
									<td>出發日期</td>
									<td id="End_Date" class="text-end"><%=packagesVO.getRegistrationStartTime()%></td>
								</tr>
								<tr>
									<td>房間資訊</td>
									<td id="Room_Type" class="text-end">
										<%
											for (RoomTypeAndRoomListVO bean : seletedRoomInfo) {
										%> <%=bean.getRoomType()%> - <%=bean.getRoomNo()%><br> 
										<%
											}
										%>
									</td>
								</tr>
								<tr class="total">
									<td>-總計-</td>
									<td id="Total_Cost" class="text-end">TWD<%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
						<a class="btn_full_outline" href="Cart/html/index_7.html"><i
							class="icon-right"></i>變更搜尋條件</a>
					</div>
				</aside>
				</div>
				<!--End row -->
			</div>
			<!--End container -->
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
				<a href="Cart/html/#0" class="social_bt facebook">Login with
					Facebook</a> <a href="Cart/html/#0" class="social_bt google">Login
					with Google</a>
				<div class="divider">
					<span>Or</span>
				</div>
				<div class="form-group">
					<label>Email</label> <input type="email" class="form-control"
						name="email" id="email"> <i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" class="form-control"
						name="password" id="password" value=""> <i
						class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-start">
						<label class="container_check">Remember me <input
							type="checkbox"> <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-end">
						<a id="forgot" href="Cart/html/javascript:void(0);">Forgot
							Password?</a>
					</div>
				</div>
				<div class="text-center">
					<input type="submit" value="Log In" class="btn_login">
				</div>
				<div class="text-center">
					Don’t have an account? <a href="Cart/html/javascript:void(0);">Sign
						up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label> <input
							type="email" class="form-control" name="email_forgot"
							id="email_forgot"> <i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to
						reset your password to a new preferred one.</p>
					<div class="text-center">
						<input type="submit" value="Reset Password" class="btn_1">
					</div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->

	<!-- Common scripts -->
	<script src="Cart/html/js/jquery-3.6.0.min.js"></script>
	<script src="Cart/html/js/common_scripts_min.js"></script>
	<script src="Cart/html/js/functions.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

	<script>
		$(function() {
			$('input.date-pick').daterangepicker(
					{
						changeMonth : true,
						changeYear : true,
						autoUpdateInput : true,
						singleDatePicker : true,
						autoApply : true,

						showCustomRangeLabel : false,
						locale : {
							format : 'MM-DD-YYYY'
						}
					},
					function(start, end, label) {
						console.log('New date range selected: '
								+ start.format('YYYY-MM-DD') + ' to '
								+ end.format('DD-MM-YYYY')
								+ ' (predefined range: ' + label + ')');
					});
		});
	</script>

	<script>
		$("#twzipcode").twzipcode({});

		$("#the_btn").on("click", function() {

			let more_passenger = $(".targetParaent .copyTarget").clone();
			//console.log(div_p.get(0));
			$("#div_block").append(more_passenger);

		});
		
		$('#sendOrder').on('click', function() {
			let mainOrdererInfo = {};
			for(let inputIndex = 0; inputIndex < $('#passenger_info input, #passenger_info select').length; inputIndex++){
				mainOrdererInfo[$('#passenger_info input, #passenger_info select')[inputIndex].getAttribute('name')] = $('#passenger_info input, #passenger_info select')[inputIndex].value;
			}
			
			let peerPeoleInfoArray = [];
			let peerPeopleInfo = {};
			for(let inputIndex = 0; inputIndex < $('#div_block input, #div_block select').length; inputIndex++){
				peerPeopleInfo[$('#div_block input, #div_block select')[inputIndex].getAttribute('name')] = $('#div_block input, #div_block select')[inputIndex].value;
				if((inputIndex + 1) % 8 === 0){
					peerPeoleInfoArray.push(JSON.stringify(peerPeopleInfo));
					peerPeopleInfo = {};
				}
			}
			
			let data = {};
			data.action = 'test';
			data.mainOrdererInfo = JSON.stringify(mainOrdererInfo);
			data.peerPeoleInfoArray = peerPeoleInfoArray;
			$.ajax({
			  url: "<%=request.getContextPath()%>/PaymentHotelServlet",
			  type : "post",
			  data: data,
			  dataType: 'json',
			  success: function(res){
			    console.log("SUCCESS");
				  console.log(res);
				  $('#ecpay').html(res.text);
			  }  
			}); 
		});
	</script>

</body>
</html>