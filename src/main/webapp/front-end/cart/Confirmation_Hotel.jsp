<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/front-end/header.jsp" %>

<%@ page import="java.util.*"%>
<%@ page import="web.discount.service.impl.DiscountServiceImpl"%>
<%@ page import="web.roomType.service.impl.RoomTypeServiceImpl"%>
<%@ page import="web.member.service.impl.MemberServiceImpl"%>
<%@ page import="web.packages.service.impl.PackagesServiceImpl"%>
<%@ page import="web.discount.bean.*"%>
<%@ page import="web.room.joinbean.*"%>
<%@ page import="web.discount.bean.DiscountVO"%>
<%@ page import="web.room.bean.RoomTypeVO"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@ page import="web.packages.bean.PackagesVO"%>
<%@ page import="java.text.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.math.*"%>

<%
	Integer totalNumberOfPeople = (Integer) session.getAttribute("totalNumberOfPeople");
	PackagesVO packagesVO = (PackagesVO) session.getAttribute("packagesVO");
	List<RoomTypeAndRoomListVO> seletedRoomInfoList = (List<RoomTypeAndRoomListVO>) session.getAttribute("seletedRoomInfoList");
	Integer afterDiscountTotalPrice = (Integer) session.getAttribute("afterDiscountTotalPrice");
	MemberVO memVO = (MemberVO) session.getAttribute("loginMember");
	
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
 <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta
      name="description"
      content="Citytours - Premium site template for city tours agencies, transfers and tickets."
    />
    <meta name="author" content="Ansonika" />
    <title>CITY TOURS - City tours and travel site template by Ansonika</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/Cart/html/img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/Cart/html/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/Cart/html/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/Cart/html/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/Cart/html/css/custom.css" rel="stylesheet" />
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
   <%--  <header>
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
                <li><a href="<%=request.getContextPath()%>/Cart/html/wishlist.html" id="wishlist_link">聯絡我們</a></li>
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
              <a href="<%=request.getContextPath()%>/Cart/html/index.html"
                ><img
                  src="<%=request.getContextPath()%>/Cart/html/img/logo.png"
                  width="160"
                  height="34"
                  alt="City tours"
                  class="logo_normal"
              /></a>
              <a href="<%=request.getContextPath()%>/Cart/html/index.html"
                ><img
                  src="<%=request.getContextPath()%>/Cart/html/img/logo_sticky.png"
                  width="160"
                  height="34"
                  alt="City tours"
                  class="logo_sticky"
              /></a>
            </div>
          </div>
          <nav class="col-9">
            <a
              class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
              href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
              ><span>Menu mobile</span></a
            >
            <div class="main-menu">
              <div id="header_menu">
                <img
                  src="<%=request.getContextPath()%>/Cart/html/img/logo_sticky.png"
                  width="160"
                  height="34"
                  alt="City tours"
                />
              </div>
              <a href="<%=request.getContextPath()%>/Cart/html/#" class="open_close" id="close_in"
                ><i class="icon_set_1_icon-77"></i
              ></a>
              <ul>
                <li class="submenu" style="margin: 0 0 0 75px">
                  <a
                    href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >預定行程
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >郵輪介紹
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >活動新訊
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >旅遊資訊
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);"
                    class="show-submenu"
                    style="width: 100px"
                    >會員中心 <i class="icon-down-open-mini"></i
                  ></a>
                  <ul>
                    <li><a href="<%=request.getContextPath()%>/Cart/html/all_restaurants_list.html">會員資訊 </a></li>
                    <li>
                      <a href="<%=request.getContextPath()%>/Cart/html/all_restaurants_grid.html">會員資料修改</a>
                    </li>
                    <li>
                      <a href="<%=request.getContextPath()%>/Cart/html/all_restaurants_grid_masonry.html">密碼更改</a>
                    </li>
                    <li>
                      <a href="<%=request.getContextPath()%>/Cart/html/all_restaurants_map_listing.html"
                        >訂單查詢修改</a
                      >
                    </li>
                    <li><a href="<%=request.getContextPath()%>/Cart/html/single_restaurant.html">聊天室</a></li>
                    <li><a href="<%=request.getContextPath()%>/Cart/html/payment_restaurant.html">討論區</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- End main-menu -->
            <ul id="top_tools">
              <li>
                <a href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);" class="search-overlay-menu-btn"
                  ><i class="icon_search"></i
                ></a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- container -->
    </header> --%>
    <!-- End Header -->

    <section
      id="hero_2"
      class="background-image"
      style="background: url('https://picsum.photos/1903/800?random=5')"
    >
      <div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
        <div class="intro_title">
          <h1>規劃您的行程</h1>
          <div class="bs-wizard row">
            <div class="col-4 bs-wizard-step disabled">
              <div class="text-center bs-wizard-stepnum">選定行程</div>
              <div class="progress">
                <div class="progress-bar"></div>
              </div>
              <a href="<%=request.getContextPath()%>/Cart/html/#" class="bs-wizard-dot"></a>
            </div>

            <div class="col-4 bs-wizard-step disabled">
              <div class="text-center bs-wizard-stepnum">填寫資料</div>
              <div class="progress">
                <div class="progress-bar"></div>
              </div>
              <a href="<%=request.getContextPath()%>/Cart/html/payment_hotel.html" class="bs-wizard-dot"></a>
            </div>

            <div class="col-4 bs-wizard-step active">
              <div class="text-center bs-wizard-stepnum">完成預定！</div>
              <div class="progress">
                <div class="progress-bar"></div>
              </div>
              <a href="<%=request.getContextPath()%>/Cart/html/confirmation_hotel.html" class="bs-wizard-dot"></a>
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
            <li><a href="<%=request.getContextPath()%>/Cart/html/#">首頁</a></li>
            <li><a href="<%=request.getContextPath()%>/Cart/html/#">Category</a></li>
            <li>Page active</li>
          </ul>
        </div>
      </div>
      <!-- End position -->

      <div class="container margin_60">
        <div class="row">
          <div class="col-lg-8 add_bottom_15">
            <div class="form_title">
              <h3>
                <strong><i class="icon-ok"></i></strong>感謝您的訂購!
              </h3>
            </div>
            <div class="step">
              <p>
                以下是您預定的假期，請協助核對確認。<br />
                如內容正確，可點選右側"查看您的訂單明細"按鈕至該頁面。<br />
                或有需任何協助之處，請不吝聯繫我們。
              </p>
            </div>
            <!--End step -->

            <div class="form_title">
              <h3>
                <strong><i class="icon-tag-1"></i></strong>您的訂購內容
              </h3>
            </div>
            <div class="step">
              <table class="table table-striped confirm">
                <tbody>
                  <tr>
                    <td>
                      <strong>訂購人姓名</strong>
                    </td>
                    <td><%=memVO.getChineseName() %></td>
                  </tr>
                  <tr>
                    <td>
                      <strong>行程名稱</strong>
                    </td>
                    <td><%=packagesVO.getPackageName() %></td>
                  </tr>
                  <tr>
                    <td><strong>出發日期</strong></td>
                    <td><%=packagesVO.getRegistrationStartTime() %></td>
                  </tr>
                  <tr>
                    <td><strong>行程天數</strong></td>
                    <td><%=days %></td>
                  </tr>
                  <tr>
                    <td><strong>房間數量</strong></td>
                    <td><%=seletedRoomInfoList.size() %></td>
                  </tr>
                  <tr>
                    <td><strong>人數</strong></td>
                    <td><%=totalNumberOfPeople %></td>
                  </tr>

                  <tr>
                    <td>
                      <strong>付款方式</strong>
                    </td>
                    <td>Credit card</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>總計</strong>
                    </td>
                    <td>$<%=afterDiscountTotalPrice %></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!--End step -->
          </div>
          <!--End col -->

          <aside class="col-lg-4">
            <div class="box_style_1">
              <h3 class="inner">感謝您的訂購!</h3>
              <p>
                感謝您選擇與Royal Pandora一同航行!我們引頸盼望啟程的那天。
                <br />
                在此之前，請您仔細過目左邊欄位內的訂購內容。確保您的行程如規劃一般。雖然已經將訂購明細寄至您登記的Email，您仍可以選下面按鈕至該頁面。也建議您列印一份留存。謝謝!
              </p>
              <hr />
              <a class="btn_full_outline" href="<%=request.getContextPath()%>/front-end/cart/Invoice.jsp" target="_blank"
                >查看您的訂單明細</a
              >
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
          <a href="<%=request.getContextPath()%>/Cart/html/#0" class="social_bt facebook">Login with Facebook</a>
          <a href="<%=request.getContextPath()%>/Cart/html/#0" class="social_bt google">Login with Google</a>
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
              <a id="forgot" href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);">Forgot Password?</a>
            </div>
          </div>
          <div class="text-center">
            <input type="submit" value="Log In" class="btn_login" />
          </div>
          <div class="text-center">
            Don’t have an account? <a href="<%=request.getContextPath()%>/Cart/html/javascript:void(0);">Sign up</a>
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

    <!-- Jquery -->
    <script src="<%=request.getContextPath()%>/Cart/html/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/Cart/html/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/Cart/html/js/functions.js"></script>
</body>
</html>