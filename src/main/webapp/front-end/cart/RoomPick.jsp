<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<style>
#Package {
	margin: 0 60px;
}
</style>
<link rel="stylesheet" href="Cart/html/css/roompick.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<section id="bus_container">
					<div class="d-flex justify-content-left" id="bus"
						style="padding-bottom: 100px; padding-top: 60px;">
						<div class="">
							<ul class="bus bus2"
								style="padding: 20px; border-radius: 100px 100px 10px 10px;">
								<li style="margin: 60px 0 0 0;">
									<!--seat1 = 潘多拉套房--> <a class="seat1"
									style="margin-left: 18px; background-color: #00FFFF"></a> <span
									class="passage"></span> <a class="seat1 justify-content-center"
									style="background-color: #00FFFF"></a>
								</li>
								<li><span class="passage" style="height: 10px;"></span></li>
								<li>
									<!--seat2 = 精緻客房--> <a class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <a
									class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <span class="passage"></span>
									<a class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <a
									class="seat2 justify-content-center"
									style="background-color: #52eb11"></a>
								</li>
								<li><a class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <a
									class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <span class="passage"></span>
									<a class="seat2 justify-content-center"
									style="background-color: #52eb11"></a> <a
									class="seat2 justify-content-center"
									style="background-color: #52eb11"></a></li>
								<li><span class="passage" style="height: 10px;"></span></li>
								<li>
									<!--seat3 = 家庭客房--> <a class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <a
									class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <span class="passage"></span>
									<a class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <a
									class="seat3 justify-content-center"
									style="background-color: #546d8f"></a>
								</li>
								<li><a class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <a
									class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <span class="passage"></span>
									<a class="seat3 justify-content-center"
									style="background-color: #546d8f"></a> <a
									class="seat3 justify-content-center"
									style="background-color: #546d8f"></a></li>
								<li><span class="passage" style="height: 10px;"></span></li>
								<li>
									<!--seat4 = 豪華客房--> <a class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <a
									class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <span class="passage"></span>
									<a class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <a
									class="seat4 justify-content-center"
									style="background-color: #e3b981"></a>
								</li>
								<li><a class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <a
									class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <span class="passage"></span>
									<a class="seat4 justify-content-center"
									style="background-color: #e3b981"></a> <a
									class="seat4 justify-content-center"
									style="background-color: #e3b981"></a></li>
								<li><span class="passage" style="height: 10px;"></span></li>

								<li><a class="seat1"
									style="margin-left: 18px; background-color: #00FFFF"></a> <span
									class="passage"></span> <a class="seat1"
									style="background-color: #00FFFF"></a></li>
							</ul>
							<div>
								<small>*房型分類： Ａ = 潘多拉套房，B = 精緻客房，C = 家庭客房，D = 豪華客房</small>
							</div>
						</div>
					</div>
				</section>
			</div>

			<aside class="col-lg-4" style="margin-top: 60px;">
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
					<a class="btn_full" href="payment_hotel.jsp">預定此房間</a>
				</div>
			</aside>
</body>

<script src="Cart/html/js/jquery-3.6.0.min.js"></script>
<script src="Cart/html/js/common_scripts_min.js"></script>
<script src="Cart/html/js/functions.js"></script>
<script src="Cart/html/js/yang.js"></script>

<script>
	$(document).ready(function() {
		/*print seat number--------------*/
		let b2 = 0;
		$(".bus2 .seat1").each(function() {
			b2++;
			$(this).append("<em class='seat1_num'>" + 'A0' + b2 + "</em>");
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
	$('.bus.bus2 a').on('click', function(e) {
		/* let pickedRoom = document.getElementById('A01').value; */
		console.log(e.target.textContent);
		let roomNumber = e.target.textContent;
		
		let data = {};
		data.action = "getRoomPickInfo";
		data.shipNo = "1";
		data.roomNo = roomNumber;
		
		console.log("<%=request.getContextPath()%>/cartHotel.do");
		
		$.ajax({
			url : "<%=request.getContextPath()%>/cartHotel.do",
			type : "post",
			data : data,
			success : function(result) {
				console.log(result);
				let obj = JSON.parse(result);
				console.log(obj.roomListNo);
				console.log(obj);
				
					
					// 取得element 並使用innerHTML 將obj.room 放入html結構
					let roomNo = document.getElementById('PickedRoomNo');
					roomNo.innerHTML = obj.roomNo;

					let roomType = document.getElementById('PickedRoomType');
					roomType.innerHTML = obj.roomType;

					let maxCapacity = document.getElementById('Capacity');
					maxCapacity.innerHTML = obj.maxCapacity;
				
			}
		});
	});
</script>
</html>