<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@ page import="web.member.service.impl.MemberServiceImpl"%>
<%@ page import="java.util.*"%>
<%@ page import="web.order.service.impl.OrderServiceImpl"%>
<%@ page import="web.order.beam.OrderVO"%>

<% 
MemberServiceImpl memService = new MemberServiceImpl();

MemberVO memVO = (MemberVO)session.getAttribute("loginMember");


OrderServiceImpl orderService = new OrderServiceImpl(); 
List<OrderVO> orders = orderService.getAllOrders(memVO.getMemberId());
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="description"
      content="Citytours - Premium site template for city tours agencies, transfers and tickets."
    />
    <meta name="author" content="Ansonika"/>
    <title>訂單查詢</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="img/apple-touch-icon-144x144-precomposed.png"
    />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/Member/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/vendors.css" rel="stylesheet" />

    <!-- SPECIFIC CSS -->
    <link href="css/shop.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
    <style>
        .parallax-window{
            height: auto;
            display: block;
            text-transform: none;
            font-size: 14px;
            background: url(https://www.celebritycruises.com/content/dam/celebrity/new-images/ships/celebrity-fleet-image-ships-v2-2560x1440.jpg)
          no-repeat center center;
            background-size: cover;
        }
        .options, .colName th:last-child, .colName th:nth-child(7){
            text-align: center;
        }
    </style>
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
     <%@include file="/front-end/header.jsp" %>
    <!-- End Header -->

    <section
      class="parallax-window"
      data-parallax="scroll"
      data-image-src= url(https://www.celebritycruises.com/content/dam/celebrity/new-images/ships/celebrity-fleet-image-ships-v2-2560x1440.jpg)
      data-natural-width="1400"
      data-natural-height="470"
    >
      <div
        class="parallax-content-1 opacity-mask"
        data-opacity-mask="rgba(0, 0, 0, 0.3)"
      >
        <div class="animated fadeInDown">
          <h1>訂單查詢</h1>
        </div>
      </div>
    </section>
    <!-- End Section -->

    <main>
      <div id="position">
        <div class="container">
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">會員中心</a></li>
            <li>訂單查詢</li>
          </ul>
        </div>
      </div>
      <!-- End Position -->
    
<form action="<%=request.getContextPath()%>/MemberLoginServlet" method="Post" enctype="multipart/form-data" >
      <div class="container margin_60">
        <div class="cart-section">
          <table class="table table-striped cart-list shopping-cart">
            <thead>
              <tr class="colName">
                <th>訂單編號</th>
                <th>出發日期</th>
                <th>行程</th>
                <th>總計</th>
                <th>狀態</th>
              <!--   <th>取消</th> -->
                <th>訂單明細</th>
              </tr>
<%
for (int index = 0; index < orders.size(); index++){
	OrderVO order = orders.get(index);
%>              
            </thead>
            <tbody>
              <tr>				
                <td><strong><%=order.getOrderNo()%></strong></td>
                <td>
                  <strong><%=order.getDepartureTime()%></strong>
                </td>
                <td>
                  <strong><%=order.getPackageName()%></strong>
                </td>
                <td> <strong><%=order.getPriceAfterDiscount()%></strong> </td>
                <td><%=order.getStatus()%></td>
               <!--  <td class="options">
                  <a><i class="icon-cancel-3"></i></a>
                </td> -->
                <td class="options">
                  <a href="#"><i class="fa fa-file-text" aria-hidden="true"></i></a>
                </td>
              </tr>
              <%}%>
            </tbody>
          </table>

          
        </div>
      </div>
      </form>
      <!-- End Container -->
    </main>
    <!-- End main -->

    <footer class="revealed">
      <div class="container">
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
      <span class="search-overlay-close"
        ><i class="icon_set_1_icon-77"></i
      ></span>
      <form role="search" id="searchform" method="get">
        <input value="" name="q" type="text" placeholder="Search..." />
        <button type="submit"><i class="icon_set_1_icon-78"></i></button>
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
          <div class="divider"><span>Or</span></div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" id="email" />
            <i class="icon_mail_alt"></i>
          </div>
          <div class="form-group">
            <label>Password</label>
            <input
              type="password"
              class="form-control"
              name="password"
              id="password"
              value=""
            />
            <i class="icon_lock_alt"></i>
          </div>
          <div class="clearfix add_bottom_15">
            <div class="checkboxes float-start">
              <label class="container_check"
                >Remember me
                <input type="checkbox" />
                <span class="checkmark"></span>
              </label>
            </div>
            <div class="float-end">
              <a id="forgot" href="javascript:void(0);">Forgot Password?</a>
            </div>
          </div>
          <div class="text-center">
            <input type="submit" value="Log In" class="btn_login" />
          </div>
          <div class="text-center">
            Don’t have an account? <a href="javascript:void(0);">Sign up</a>
          </div>
          <div id="forgot_pw">
            <div class="form-group">
              <label>Please confirm login email below</label>
              <input
                type="email"
                class="form-control"
                name="email_forgot"
                id="email_forgot"
              />
              <i class="icon_mail_alt"></i>
            </div>
            <p>
              You will receive an email containing a link allowing you to reset
              your password to a new preferred one.
            </p>
            <div class="text-center">
              <input type="submit" value="Reset Password" class="btn_1" />
            </div>
          </div>
        </div>
      </form>
      <!--form -->
    </div>
    <!-- /Sign In Popup -->

    <!-- Common scripts -->
    <script src="<%=request.getContextPath()%>/front-end/Member/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/functions.js"></script>

    <script>
      if ($(".prod-tabs .tab-btn").length) {
        $(".prod-tabs .tab-btn").on("click", function (e) {
          e.preventDefault();
          var target = $($(this).attr("href"));
          $(".prod-tabs .tab-btn").removeClass("active-btn");
          $(this).addClass("active-btn");
          $(".prod-tabs .tab").fadeOut(0);
          $(".prod-tabs .tab").removeClass("active-tab");
          $(target).fadeIn(500);
          $(target).addClass("active-tab");
        });
      }
    </script>
  </body>
</html>
