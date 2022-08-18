<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.member.bean.DiscountVO"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@page import="com.mysql.cj.protocol.x.ReusableOutputStream"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
DiscountVO discountVO=new DiscountVO();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="description"
      content="Citytours - Premium site template for city tours agencies, transfers and tickets."
    />
    <meta name="author" content="Ansonika" />
    <title>會員資訊</title>

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

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/Member/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/Member/css/custom.css" rel="stylesheet" />
    <style>
      .col-xl-4 col-lg-5 col-md-6 col-sm-8 {
        border: 1px solid red;
        /* width: 800px; */
      }
      #memberInfo {
        margin: 170px 0 60px 0;
        color: rgb(51, 51, 51);
        text-align: center;
        background-color: #fff;
        -webkit-box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
        box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
        padding: 30px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        width: 700px;
      }
      .memberHeadtext {
        text-align: center;
        font-size: 24px;
      }
      .memberAll {
        /* border: 1px solid yellow; */
        padding: 0;
        margin: 40px 0;
        box-sizing: border-box;
      }
      .memberGroup {
        /* border: 1px solid black; */
        padding: 0;
        margin: 14px;
        box-sizing: border-box;
        display: flex;
      }
      .memberInfoLeft {
        /* border: 1px solid blue; */
        padding: 0;
        margin: 0 15px 0 0;
        /* width: calc(100% / 2); */
        width: 30%;
        box-sizing: border-box;
        /* display: flex; */
        /* background-color: gray; */
      }
      .memberInfoRight {
        /* border: 1px solid blue; */
        padding: 0;
        margin: 0 0 0 15px;
        /* width: calc(100% / 2); */
        width: 70%;
        box-sizing: border-box;
        /* display: flex; */
        /* background-color: gray; */
      }
      .memberInfoLeftText {
        text-align: right;
        font-weight: bold;
      }
      .memberInfoRightText {
        text-align: left;
      }
      .memberCenter {
        display: flex;
        flex-direction: row;
        justify-content: center;
      }
    </style>
  </head>
<body>
<!--     <div id="preloader"> -->
<!--       <div class="sk-spinner sk-spinner-wave"> -->
<!--         <div class="sk-rect1"></div> -->
<!--         <div class="sk-rect2"></div> -->
<!--         <div class="sk-rect3"></div> -->
<!--         <div class="sk-rect4"></div> -->
<!--         <div class="sk-rect5"></div> -->
<!--       </div> -->
<!--     </div> -->
    <!-- End Preload 載入畫面-->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <header>
      <div id="top_line">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <i class="icon-phone"></i><strong>02 23456789</strong>
            </div>
            <div class="col-6">
              <ul id="top_links">
                <li><c:choose>
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
              </c:choose></li>
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
            <div id="logo_home">
              <h1>
                <a href="index7.html" title="Welcome to royal Pandora"
                  >Welcome to royal Pandora</a
                >
              </h1>
            </div>
          </div>
          <nav class="col-9">
            <a
              class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
              href="javascript:void(0);"
              ><span>選單</span></a
            >
            <div class="main-menu">
              <div id="header_menu">
                <img
                  src="./img/logo.png"
                  width="160"
                  height="34"
                  alt="City tours"
                />
              </div>
              <a href="#" class="open_close" id="close_in"
                ><i class="icon_set_1_icon-77"></i
              ></a>
              <ul>
                <li class="submenu" style="margin: 0 0 0 75px">
                  <a
                    href="javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >行程管理
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >郵輪介紹
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >活動新訊
                  </a>
                </li>
                <li class="megamenu submenu">
                  <a
                    href="javascript:void(0);"
                    class="show-submenu-mega"
                    style="width: 100px"
                    >旅遊資訊</a
                  >

                  <!-- End row -->

                  <!-- End menu-wrapper -->
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >會員中心<i class="icon-down-open-mini"></i
                  ></a>
                  <ul>
                    <li>
                      <a href="all_restaurants_list.html">會員資訊</a>
                    </li>
                    <li>
                      <a href="all_restaurants_grid.html">會員資料修改</a>
                    </li>
                    <li>
                      <a href="all_restaurants_grid_masonry.html">密碼更改</a>
                    </li>
                    <li>
                      <a href="all_restaurants_map_listing.html"
                        >訂單查詢修改</a
                      >
                    </li>
                    <li>
                      <a href="single_restaurant.html">聊天室</a>
                    </li>
                    <li>
                      <a href="payment_restaurant.html">討論區</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- End main-menu -->
            <ul id="top_tools">
              <li>
                <div class="dropdown dropdown-cart">
                  <a href="#" data-bs-toggle="dropdown" class="cart_bt"
                    ><i class="icon_bag_alt"></i><strong>8</strong></a
                  >
                  <ul class="dropdown-menu" id="cart_items">
                    <li>
                      <div class="image">
                        <img src="img/thumb_cart_1.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="img/thumb_cart_2.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="img/thumb_cart_3.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Versailles tour</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div>合計: <span>$120.00</span></div>
                      <a href="cart.html" class="button_drop">前往購物車</a>
                      <a href="payment.html" class="button_drop outline"
                        >退出</a
                      >
                    </li>
                  </ul>
                </div>
                <!-- End dropdown-cart-->
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- container -->
    </header>
    <!-- End Header -->

    <main>
      <section
        id="hero"
        class="login"
        style="background: url('https://picsum.photos/1903/800?random=5')"
      >
        <div class="container">
          <div class="row justify-content-center">
            <div class="memberCenter">
              <div id="memberInfo">
                <div class="memberHeadtext"></div>
                <div class="text-center">
                  <img
                    src="<%=request.getContextPath()%>/front-end/Member/img/logo_sticky_2x.png"
                    alt="Image"
                    width="160"
                    height="34"
                  />
                  <h3>會員資訊</h3>
                  
                  <c:if test="${loginMember.memberPictureId != null}">
                  	<div class="image">
                       <img src="<%=request.getContextPath()%>/MemberImageServlet?action=memberImage"  name="action" class="img-circle elevation-2" alt="User Image" />
                    </div>
                  </c:if>
                  <c:if test="${loginMember.memberPictureId == null}">
	                  <img
	                    src="<%=request.getContextPath()%>/front-end/Member/img/headshot.png"
	                    alt="Image"
	                    width="160"
	                    height="160"
	                  />
                  </c:if>
                  <!-- 登入白框上方LOGO -->
                </div>
                <hr />
                <form action="<%=request.getContextPath()%>/MemberLoginServlet" method="Post">
                  <div class="memberAll">
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">中文姓名</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.chineseName}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">英文姓名</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberEnglishLastName}&nbsp${loginMember.memberEnglishFirstName}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">手機</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberPhoneNumber}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">性別</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.gender}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">生日</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberBirthday}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">身分證字號</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberIdNo}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">護照號碼</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberPassportNo}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">E-MAIL</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberEmail}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">地址</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberAddress}</div>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">會員等級</div>
                      </div>
                      <div class="memberInfoRight">
                        <div class="memberInfoRightText">${loginMember.memberLevel}</div>
<%--                         <div>${loginMember.discountVO.memberLevel}</div>  --%>
                      </div>
                    </div>
                    <div class="memberGroup">
                      <div class="memberInfoLeft">
                        <div class="memberInfoLeftText">累積消費金額</div>
                      </div>
                      <div class="memberInfoRight" id="money">
                        <div class="memberInfoRightText">${loginMember.accumulatedConsumption}</div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
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
    <!-- End footer -->
    <!-- End footer -->
    <!-- End footer -->
    <!-- End footer -->
    <!-- End footer -->
    <!-- End footer -->
    <!-- End footer -->
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
      
    </script>
  </body>
</html>