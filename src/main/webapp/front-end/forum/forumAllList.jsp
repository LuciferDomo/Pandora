<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="web.forum.service.impl.ForumServiceImpl"%>
<%@page import="web.forum.bean.ForumVO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    ForumServiceImpl forumSvc = new ForumServiceImpl();
    List<ForumVO> list = forumSvc.getAll();
    pageContext.setAttribute("list",list);
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
    <meta name="author" content="Ansonika" />
    <title>CITY TOURS - City tours and travel site template by Ansonika</title>

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
    <link href="<%=request.getContextPath()%>/front-end/forum/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/forum/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/forum/css/vendors.css" rel="stylesheet" />

    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/forum/css/adminlte.css" />
    <!-- 引用後台css -->

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/forum/css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
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
    <header id="plan">
      <div id="top_line">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <i class="icon-phone"></i><strong>02 23456789</strong>
            </div>
            <div class="col-6">
              <ul id="top_links">
                <li><a href="#sign-in-dialog" id="access_link">登入</a></li>
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
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >行程管理
                  </a>
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >郵輪介紹
                  </a>
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >活動新訊
                  </a>
                </li>
                <li class="megamenu submenu">
                  <a href="javascript:void(0);" class="show-submenu-mega"
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

    <!-- End hero -->

    <main>
    <br>
    <br>
    <br>
    
    
<%--         <jsp:include page="/views/userMainPage-header.jsp" /> --%>
            <div class="page-header mt-30 mb-75">
                <div class="container">
                    <div class="archive-header">
                        <div class="row align-items-center">
                            <div class="col-xl-3">
                                <h1 class="mb-15">討論區</h1>
                                <div class="breadcrumb">
                                    <a href="forumAdd.jsp" rel="nofollow"><i class="fi-rs-home mr-5"></i>發表文章</a>
                                    <span></span> 
                                </div>
                            </div>
<!--                             <div class="col-xl-9 text-end d-none d-xl-block"> -->
<!--                                 <ul class="tags-list"> -->
<!--                                     <li class="hover-up"> -->
<!--                                         <a href="#"><i class="fi-rs-cross mr-10"></i>貓貓</a> -->
<!--                                     </li> -->
<!--                                     <li class="hover-up active"> -->
<!--                                         <a href="#"><i class="fi-rs-cross mr-10"></i>寵物知識</a> -->
<!--                                     </li> -->
<!--                                     <li class="hover-up"> -->
<!--                                         <a href="#"><i class="fi-rs-cross mr-10"></i>米克斯</a> -->
<!--                                     </li> -->
<!--                                     <li class="hover-up"> -->
<!--                                         <a href="#"><i class="fi-rs-cross mr-10"></i>天竺鼠車車</a> -->
<!--                                     </li> -->
<!--                                     <li class="hover-up mr-0"> -->
<!--                                         <a href="#"><i class="fi-rs-cross mr-10"></i>木木梟</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
                        </div>
                    </div>
                </div>
    
    <div class="page-content mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-10 col-md-12 m-auto">
                            <div class="shop-product-fillter mb-50">
                                <div class="totall-product">
                                    <h2>
                                        <img class="w-36px mr-10" src="assets/imgs/theme/icons/category-1.svg" alt="" />
                                        最新文章
                                    </h2>
                                </div>
<!--                                 <div class="sort-by-product-area"> -->
<!--                                     <div class="sort-by-cover mr-10"> -->
<!--                                         <div class="sort-by-product-wrap"> -->
<!--                                             <div class="sort-by"> -->
<!--                                                 <span><i class="fi-rs-apps"></i>Show:</span> -->
<!--                                             </div> -->
<!--                                             <div class="sort-by-dropdown-wrap"> -->
<!--                                                 <span> 50 <i class="fi-rs-angle-small-down"></i></span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="sort-by-dropdown"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="active" href="#">3</a></li> -->
<!--                                                 <li><a href="#">5</a></li> -->
<!--                                                 <li><a href="#">7</a></li> -->
<!--                                                 <li><a href="#">10</a></li> -->
<!--                                                 <li><a href="#">All</a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
                                    </div>
<!--                                     <div class="sort-by-cover"> -->
<!--                                         <div class="sort-by-product-wrap"> -->
<!--                                             <div class="sort-by"> -->
<!--                                                 <span><i class="fi-rs-apps-sort"></i>Sort:</span> -->
<!--                                             </div> -->
<!--                                             <div class="sort-by-dropdown-wrap"> -->
<!--                                                 <span>Featured <i class="fi-rs-angle-small-down"></i></span> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="sort-by-dropdown"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="active" href="#">Featured</a></li> -->
<!--                                                 <li><a href="#">Newest</a></li> -->
<!--                                                 <li><a href="#">Most comments</a></li> -->
<!--                                                 <li><a href="#">Release Date</a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </div>
                            </div>
                            <div class="loop-grid loop-big">
                                <div class="row">
                                
                                <c:forEach items="${list}" var="forumVO">
									
                                    <article class="first-post mb-30 hover-up animated" style="visibility: visible">
                                        <div class="position-relative overflow-hidden">
                                            <div class="post-thumb border-radius-15">
                                                 <a href="<%=request.getContextPath()%>/ForumServlet?action=getOne_For_Display&postId=${forumVO.postId}">            
                                                 	<img class="border-radius-15" src="<%= request.getContextPath() %>/GetPic?action=forumVOUpdate&postId=${forumVO.postId}" alt="" />
<%--                                                 	<c:forEach var="forumVO" items="${list2}"> --%>
<%--                    										 <c:if test="${forumVO.postId==forumVO.postPic}"> --%>
<%--                <img class="border-radius-15" src="<%= request.getContextPath() %>/GetPic?postId=${forumVO.postId}" alt="" /> --%>
	                 									
<%--                    										 </c:if> --%>
<%--                 									</c:forEach> --%>
                									
                                                </a>
                                            </div>
                                        </div>
                                        <div class="entry-content">
                                            <h2 class="post-title mb-20">
                                                <a href="<%=request.getContextPath()%>/ForumServlet?action=getOne_For_Display&postId=${forumVO.postId}">${forumVO.postTitle}</a>
                                            </h2>
                                            <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                            <p class="post-exerpt font-medium text-muted mb-30">${forumVO.postContent}</p>
                                            </div>
                                            <div class="mb-20 entry-meta meta-2">
                                                <div class="entry-meta meta-1 mb-30">
                                                    <div class="font-sm">
                                                        <span
                                                            ><span class="mr-10 text-muted"><i class="fi-rs-eye"></i></span>11k</span
                                                        >
                                                        <span class="ml-30"
                                                            ><span class="mr-10 text-muted"><i class="fi-rs-comment-alt"></i></span>1k</span
                                                        >
                                                        <span class="ml-30"
                                                            ><span class="mr-10 text-muted"><i class="fi-rs-share"></i></span>18k</span
                                                        >
                                                    </div>
                                                </div>
                                                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ForumServlet" style="margin-bottom: 0px;">
                                                <input type="hidden" name="artid"  value="${forumVO.postId}">
                                                <input type="hidden" name="action" value="getOne_For_Display">
                                                <button type="submit" class="btn btn-sm"><i class="fi-rs-arrow-right ml-10"></i>更多...</button>
                                                </FORM>
                                                
                                            </div>
                                        </div>
                                    </article>
                                   
                                    </c:forEach>
                                </div>
                            </div>
<!--                             <div class="pagination-area mt-15 mb-sm-5 mb-lg-0"> -->
<!--                                 <nav aria-label="Page navigation example"> -->
<!--                                     <ul class="pagination justify-content-start"> -->
<!--                                         <li class="page-item"> -->
<%--                                             <a class="page-link" href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>"><i class="fi-rs-arrow-small-left"></i></a> --%>
<!--                                         </li> -->
<%--                                         <%if (pageNumber>1) {%> --%>
                                        
<%--                                         <%for (int i=1; i<=pageNumber; i++){%> --%>
<%--                                         <li class="page-item"><a class="page-link" href="<%=request.getRequestURI()%>?whichPage=<%=whichPage=i%>"><%=i%></a></li> --%>
<%--                                         <%}%>  --%>
<%--                                         <%}%> --%>
<!--                                         <li class="page-item"> -->
<%--                                             <a class="page-link" href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>"><i class="fi-rs-arrow-small-right"></i></a> --%>
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </nav> -->
<!--                             </div> -->
                        </div>
                    </div>
                </div>
            </div>
    
    
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--       <div class="content"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row"> -->
<!--                         left column -->
<!--                         <div class="col-md-12"> -->
<!--                             jquery validation -->
<!--                             <div class="card card-primary"> -->
<!--                                 <div class="card-header"> -->
<!--                                     <h3 class="card-title"> -->
<!--                                         討論區 -->

<!--                                     </h3> -->
<!--                                 </div> -->
<!--                                 /.card-header -->
<!--                                 form start                                 -->
<!--                                 <div class="container"> -->
                                
<!--                                 <table id="table" data-toggle="table" data-search="true" -->
<!-- 										data-filter-control="true" data-show-export="true" -->
<!-- 										data-click-to-select="true" data-toolbar="#toolbar"> -->
<!-- 										<thead> -->
<!-- 											<tr> -->

<!-- 												<th>文章編號</th> -->
<!-- 												<th>作者</th> -->
<!-- 												<th>標題</th> -->
<!-- 												<th>內容</th> -->
<!-- 												<th>發表時間</th> -->
<!-- 												<th>次數</th> -->
<!-- 												<th>狀態</th> -->
<!-- 												<th>修改</th> -->
<!-- 												<th>刪除</th> -->




<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<%-- 											<c:forEach items="${list}" var="forumVO"> --%>

<!-- 												<tr> -->
<%-- 													<td>${forumVO.postId }</td> --%>
<%-- 													<td>${forumVO.memberId }</td> --%>
<%-- 													<td>${forumVO.postTitle }</td> --%>
<%-- 													<td>${forumVO.postContent }</td> --%>
<%-- 													<td>${forumVO.postTime }</td> --%>
<%-- 													<td>${forumVO.clicks }</td> --%>
<%-- 													<td>${forumVO.status }</td> --%>
<!-- 													<td> -->
<!-- 														<FORM METHOD="post" -->
<%-- 															ACTION="<%=request.getContextPath()%>/ForumServlet" --%>
<!-- 															style="margin-bottom: 0px;"> -->
<!-- 															<input type="submit" value="修改"> <input -->
<%-- 																type="hidden" name="postID" value="${forumVO.postId}"> --%>
<!-- 															<input type="hidden" name="action" -->
<!-- 																value="getOne_For_Update_Forum"> -->
<!-- 														</FORM> -->
<!-- 													</td> -->
<!-- 													<td> -->
<!-- 														<FORM METHOD="post" -->
<%-- 															ACTION="<%=request.getContextPath()%>/ForumServlet" --%>
<!-- 															style="margin-bottom: 0px;"> -->
<!-- 															<input type="submit" value="刪除"> <input -->
<%-- 																type="hidden" name="postID" value="${forumVO.postId}"> --%>
<!-- 															<input type="hidden" name="action" value="delete"> -->
<!-- 														</FORM> -->
<!-- 													</td> -->
<!-- 												</tr> -->
<%-- 											</c:forEach> --%>
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 									<input type="button" name="EMPregister" value="備用按鈕" -->
<!-- 										text-align=center -->
<!-- 										style="margin-right: 0%; width: 250px; float: right;" -->
<!-- 										onclick="javascript:window.location.href='https://www.juksy.com/article/96554-%E5%8F%B2%E4%B8%8A%E6%9C%80%E5%8D%B1%E9%9A%AA%E7%9A%84%E5%A5%B3%E4%BA%BA%EF%BC%81Dua+Lipa+%E6%80%A7%E6%84%9F%E5%8F%88%E8%BF%B7%E4%BA%BA%E7%9A%84%E9%AD%85%E5%8A%9B%E8%AA%B0%E6%93%8B%E5%BE%97%E4%BA%86%EF%BC%9F%E8%87%AA%E6%8B%8D%E7%A7%80%E3%80%8C%E9%9B%95%E5%88%BB%E8%85%B9%E8%82%8C%E3%80%8D%E5%85%A8%E9%9D%A0+15+%E5%88%86%E9%90%98%E5%B0%B1%E8%83%BD%E9%A4%8A%E6%88%90%EF%BD%9E'" /> -->
<!-- 								</div> -->

<!-- 								</tfoot> -->
<!-- 								<div style="width: 100%; text-align: center"> -->
<!-- 									<input style="display: inline-block; width: 150px" -->
<!-- 										type="button" onclick="history.go(-1)" value="上一頁"></input> <input -->
<!-- 										style="display: inline-block; width: 150px" type="button" -->
<!-- 										onclick="history.forward()" value="下一頁"> -->
<!-- 								</div> -->


<!--                                     </div> -->

<!--                                 </tfoot> -->
<!--                                 <div style="width:100%;text-align:center"> -->
<!--                                     <input style="display:inline-block;width:150px" type="button" -->
<!--                                         onclick="history.go(-1)" value="上一頁"></input> -->
<!--                                     <input style="display:inline-block;width:150px" type="button" -->
<!--                                         onclick="history.forward()" value="下一頁"> -->
<!--                                 </div> -->


<!--                             </div> -->

<!--                         </div> -->
<!--                         /.card -->
<!--                     </div> -->
<!--                     /.col (left) -->
<!--                     right column -->
<!--                     <div class="col-md-6"></div> -->
<!--                     /.col (right) -->
<!--                 </div> -->
<!--                 /.row -->
<!--             </div> -->
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
    <script src="<%=request.getContextPath()%>/front-end/forum/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/js/functions.js"></script>

    <!-- Specific scripts -->
    <script>
      $(function () {
        $("input.date-pick").daterangepicker(
          {
            autoUpdateInput: true,
            singleDatePicker: true,
            autoApply: true,
            minDate: new Date(),
            showCustomRangeLabel: false,
            locale: {
              format: "MM-DD-YYYY",
            },
          },
          function (start, end, label) {
            console.log(
              "New date range selected: " +
                start.format("YYYY-MM-DD") +
                " to " +
                end.format("DD-MM-YYYY") +
                " (predefined range: " +
                label +
                ")"
            );
          }
        );
      });
    </script>
    <script>
      $("input.time-pick").timepicker({
        minuteStep: 15,
        showInpunts: false,
      });
    </script>

    <script src="<%=request.getContextPath()%>/front-end/forum/js/jquery.ddslick.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/style.css"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/bootstrap.min.css "></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/vendors.css "></script>
    
    <script>
      $("select.ddslick").each(function () {
        $(this).ddslick({
          showSelectedHTML: true,
        });
      });
    </script>
  </body>
</html>
