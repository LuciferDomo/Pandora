<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="web.discount.service.impl.*"%>
<%@ page import="web.roomType.service.impl.*"%>
<%@ page import="web.member.service.impl.*"%>
<%@ page import="web.packages.service.impl.*"%>
<%@ page import="web.order.service.impl.*"%>
<%@ page import="web.discount.bean.DiscountVO"%>
<%@ page import="web.room.bean.*"%>
<%@ page import="web.order.beam.*"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@ page import="web.packages.bean.PackagesVO"%>
<%@ page import="web.room.joinbean.RoomTypeAndRoomListVO"%>
<%@ page import="java.text.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.math.*"%>

<%
	Integer newOrderNo = (Integer) session.getAttribute("newOrderNo");
	MemberVO loginMemberVO = (MemberVO) session.getAttribute("loginMember");
	OrderVO currentOrderVO = new OrderServiceImpl().selectOrderByOrderNo(newOrderNo);
	PackagesVO packagesVO = (PackagesVO)session.getAttribute("packagesVO");
	Integer afterDiscountTotalPrice = (Integer) session.getAttribute("afterDiscountTotalPrice");
	List<RoomTypeAndRoomListVO> seletedRoomInfoList = (List<RoomTypeAndRoomListVO>) session.getAttribute("seletedRoomInfoList");

	// 計算行程天數
	ZoneId defaultZoneId = ZoneId.systemDefault();
	DateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date startDate = Date.from(packagesVO.getDepartureTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
    Date endDate = Date.from(packagesVO.getArrivalTime().toLocalDate().atStartOfDay(defaultZoneId).toInstant());
    long startTime = startDate.getTime();
    long endTime = endDate.getTime();
    int days = (int) ((endTime - startTime) / (1000 * 60 * 60 * 24));
    
    // 整理房型資料
   	Map<String, Map<String, Integer>> roomTypePriceCountMap = new HashMap<>();
	for (RoomTypeAndRoomListVO vo : seletedRoomInfoList) {
		if (roomTypePriceCountMap.get(vo.getRoomType()) != null) {
			Map<String, Integer> priceCountMap = roomTypePriceCountMap.get(vo.getRoomType());
			priceCountMap.put(String.valueOf(vo.getRoomPrice()), ((Integer) priceCountMap.get(String.valueOf(vo.getRoomPrice()))+1));
			roomTypePriceCountMap.put(vo.getRoomType(), priceCountMap);
		} else {
			Map<String, Integer> priceCountMap = new HashMap<>();
			priceCountMap.put(String.valueOf(vo.getRoomPrice()), 1);
			roomTypePriceCountMap.put(vo.getRoomType(), priceCountMap);
		}
	}
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
	<meta name="author" content="Ansonika">
	<title>CITY TOURS - City tours and travel site template by Ansonika</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/Cart/html/img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	
	<!-- COMMON CSS -->
	<link href="<%=request.getContextPath()%>/Cart/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Cart/html/css/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/Cart/html/css/vendors.css" rel="stylesheet">

	<!-- CUSTOM CSS -->
	<link href="<%=request.getContextPath()%>/Cart/html/css/custom.css" rel="stylesheet">
    
	<style>
    .invoice-title h2, .invoice-title h3 {
        display: inline-block;
    }
    
    .table > tbody > tr > .no-line {
        border-top: none;
    }
    
    .table > thead > tr > .no-line {
        border-bottom: none;
    }
    
    .table > tbody > tr > .thick-line {
        border-top: 2px solid;
    }
    </style>
        
    
        
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-6">
			<div id="logo">
			<img src="<%=request.getContextPath()%>/Cart/html/img/logo_sticky.png" width="160" height="34" alt="City tours" class="logo_sticky">
			</div>
		</div>	
		<div class="col-6">
			<div class="glyph" style="margin-left: 580px; margin-top: 10px;">
				<div id="downLoad" class="fs1" aria-hidden="true" data-icon="&#xe0fa;"></div>
			</div>
		</div>
	</div>	
</div>
 <div class="container">
    <div class="row">
        <div class="col-12">
    		<div class="invoice-title">
    			<h2>訂單明細</h2><h3 class="float-end">訂單編號# <%=newOrderNo %></h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-6">
    				<address>
    				<strong>帳單地址:</strong><br>
    					<%=loginMemberVO.getChineseName() %><br>
    					<%=loginMemberVO.getMemberAddress() %>
    				</address>
    			</div>
    		
    		</div>
    		<div class="row">
    			<div class="col-6">
    				<address>
    					<strong>付款方式:</strong><br>
    					Credit card **** 2222<br>
    					<%=loginMemberVO.getMemberEmail() %>
    				</address>
    			</div>
    			<div class="col-6 text-end">
    				<address>
    					<strong>訂購日期:</strong><br>
    					<%=currentOrderVO.getOrderTime() %><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>訂購內容</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>行程與房型</strong></td>
        							<td class="text-center"><strong>出發日期</strong></td>
									<td class="text-center"><strong>行程天數</strong></td>
									<td class="text-center"><strong>價格</strong></td>
        							<td class="text-center"><strong>數量</strong></td>
        							<td class="text-end"><strong>小計</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>  <!--這一排帶入行程資訊，價格為零-->
    								<td><%=packagesVO.getPackageName() %></td>
    								<td class="text-center"><%=packagesVO.getRegistrationStartTime() %></td>
    								<td class="text-center"><%=days %></td>
    								<td class="text-center">0</td>
									<td class="text-center">1</td>
									<td class="text-end">0</td>
    							</tr>  
								<%	
									for(Map.Entry<String, Map<String, Integer>> entry : roomTypePriceCountMap.entrySet()){
										for(Map.Entry<String, Integer> innerEntry : entry.getValue().entrySet()){
								%>
                                <tr> <!--以下欄位為房型資訊，房型小計為房型價格*行程天數-->
        							<td><%=entry.getKey() %></td>
    								<td class="no-line"></td>
    								<td class="text-center"><%=days %></td>
    								<td class="text-center"><%=innerEntry.getKey() %></td>
									<td class="text-center"><%=innerEntry.getValue() %></td>
									<td class="text-end"><%=Integer.parseInt(innerEntry.getKey()) * innerEntry.getValue() * days %></td>
    							</tr>
    							
    							<%
										}
									} 
								%>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
									<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>總計</strong></td>
    								<td class="no-line text-end"><%=afterDiscountTotalPrice %></td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>

<script type="text/javascript">
	var downPdf = document.getElementById("downLoad");
	
	downPdf.onclick = function() {
	    html2canvas(document.body, {
	        onrendered:function(canvas) {
	
	            var contentWidth = canvas.width;
	            var contentHeight = canvas.height;
	
	            //一頁pdf顯示html頁面生成的canvas高度;
	            var pageHeight = contentWidth / 592.28 * 841.89;
	            //未生成pdf的html頁面高度
	            var leftHeight = contentHeight;
	            //pdf頁面偏移
	            var position = 0;
	            //a4紙的尺寸[595.28,841.89]，html頁面生成的canvas在pdf中圖片的寬高
	            var imgWidth = 595.28;
	            var imgHeight = 592.28/contentWidth * contentHeight;
	
	            var pageData = canvas.toDataURL('image/jpeg', 1.0);
	
	            var pdf = new jsPDF('', 'pt', 'a4');
	
	            //有兩個高度需要區分，一個是html頁面的實際高度，和生成pdf的頁面高度(841.89)
	            //當內容未超過pdf一頁顯示的范圍，無需分頁
	            if (leftHeight < pageHeight) {
	                pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight );
	            } else {
	                while(leftHeight > 0) {
	                    pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
	                    leftHeight -= pageHeight;
	                    position -= 841.89;
	                    //避免添加空白頁
	                    if(leftHeight > 0) {
	                        pdf.addPage();
	                    }
	                }
	            }
	
	            pdf.save('OrderDetailInfo.pdf');
	        }
	    })
	}
</script>
</body>
</html>