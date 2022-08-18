<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.bean.*"%>
<%@page import="web.member.bean.MemberVO"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	

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
    <title>註冊</title>

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
      #sexOption {
        margin-right: 5px;
        margin-top: 10px;
      }
      .verifyImg {
        display: inline-block;
        width: 80px;
        height: 26px;
        vertical-align: top;
        border: 1px solid rgb(91, 91, 91);
      }
      #hero.login {
        height: auto;
        display: block;
        text-transform: none;
        font-size: 14px;
        background: url(https://www.celebritycruises.com/content/dam/celebrity/new-images/ships/celebrity-fleet-image-ships-v2-2560x1440.jpg)
          no-repeat center center;
        background-size: cover;
      }
      #twzipcode.form-row {
        display: flex;
        align-items: flex-end;
        flex-direction: row;
      }
      .address {
        margin-right: 10px;
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
    <!-- End Preload -->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <!-- Header================================================== -->
    <header>
    <div id="top_line">
      <div class="container">
        <div class="row">
          <div class="col-6">
            <i class="icon-phone"></i><strong>02 23456789</strong>
          </div>
          <div class="col-6">
            <ul id="top_links">
              <li>
              	
                <font>${loginMember.memberEnglishLastName}&nbsp${loginMember.memberEnglishFirstName}</font>  
                
              </li>
              <li>
              	<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberSignOut">
              		登出<i class="icon-logout-1" id="logout"></i>
              	</a>
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
          <div id="logo_home">
            <h1>
              <a href="index7.html" title="Welcome to royal Pandora">Welcome to royal Pandora</a>
            </h1>
          </div>
        </div>
        <nav class="col-9">
          <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>選單</span></a>
          <div class="main-menu">
            <div id="header_menu">
              <img src="<%=request.getContextPath()%>/front-end/Member/img/logo.png" width="160" height="34" alt="City tours" />
            </div>
            <a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
            <ul>
              <li class="submenu" style="margin: 0 0 0 75px;">
                <a href="javascript:void(0);" class="show-submenu " style="width: 100px;">行程管理
                </a>
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu" style="width: 100px;">郵輪介紹
                </a>
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu" style="width: 100px;">活動新訊
                </a>
              </li>
              <li class="megamenu submenu">
                <a href="javascript:void(0);" class="show-submenu-mega" style="width: 100px;">旅遊資訊</a>

                <!-- End row -->

                <!-- End menu-wrapper -->
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu">會員中心<i class="icon-down-open-mini"></i></a>
                <ul>
                  <li>
                  	<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=GetOneMember" class="nav-link" >會員資訊</a>
                  </li>
                  <li>
                    <a href="all_restaurants_grid.html">會員資料修改</a>
                  </li>
                  <li>
                    <a href="all_restaurants_grid_masonry.html">密碼更改</a>
                  </li>
                  <li>
                    <a href="all_restaurants_map_listing.html">訂單查詢修改</a>
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
                <a href="#" data-bs-toggle="dropdown" class="cart_bt"><i class="icon_bag_alt"></i><strong>8</strong></a>
                <ul class="dropdown-menu" id="cart_items">
                  <li>
                    <div class="image">
                      <img src="<%=request.getContextPath()%>/front-end/Member/img/thumb_cart_1.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div class="image">
                      <img src="<%=request.getContextPath()%>/front-end/Member/img/thumb_cart_2.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div class="image">
                      <img src="<%=request.getContextPath()%>/front-end/Member/img/thumb_cart_3.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Versailles tour</a>1x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div>合計: <span>$120.00</span></div>
                    <a href="cart.html" class="button_drop">前往購物車</a>
                    <a href="payment.html" class="button_drop outline">退出</a>
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
      <section id="hero" class="login" style="background: url('https://picsum.photos/1903/800?random=5')"
      >
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-5 col-md-6 col-sm-8">
              <div id="login">
                <div class="text-center">
                  <img
                    src="<%=request.getContextPath()%>/front-end/Member/img/logo_sticky_2x.png"
                    alt="Image"
                    width="160"
                    height="34"
                  />
                  <h3>註冊會員</h3>
                </div>
                <hr />
                <form action="<%=request.getContextPath()%>/MemberLoginServlet" method="Post" enctype="multipart/form-data" >
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>中文姓名*</label>
                        <input type="text" class="form-control" name="chineseName" value="<%=(memberVO==null)? "王凱文" : memberVO.getChineseName()%>">
                        <font class="text-danger">${errorMsgsMap["chineseName"]}</font>
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>出生日期＊</label>
                        <input class="date-pick form-control" type="date" name="memberBirthday" value="<%=(memberVO==null)? "2020-01-01" : memberVO.getMemberBirthday()%>">
                        <font class="text-danger">${errorMsgsMap["memberBirthday"]}</font>
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照英文名字*</label>
                        <input type="text" class="form-control" name="memberEnglishFirstName" value="<%=(memberVO==null)? "Kevin" : memberVO.getMemberEnglishFirstName()%>">
                        <font class="text-danger">${errorMsgsMap["memberEnglishFirstName"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照英文姓氏*</label>
                        <input type="text" class="form-control" name="memberEnglishLastName" value="<%=(memberVO==null)? "Wang" : memberVO.getMemberEnglishLastName()%>">
                        <font class="text-danger">${errorMsgsMap["memberEnglishLastName"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照號碼*</label>
                        <input type="text" class="form-control" name="memberPassportNo" value="<%=(memberVO==null)? "555553782" : memberVO.getMemberPassportNo()%>">
                        <font class="text-danger">${errorMsgsMap["memberPassportNo"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>身分證字號</label>
                        <input type="text" class="form-control" name="memberIdNo" value="<%=(memberVO==null)? "A122438597" : memberVO.getMemberIdNo()%>">
                        <font class="text-danger">${errorMsgsMap["memberIdNo"]}</font>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>手機號碼</label>
                        <input type="text" class="form-control" name="memberPhoneNumber" value="<%=(memberVO==null)? "0937586251" : memberVO.getMemberPhoneNumber()%>">
                        <font class="text-danger">${errorMsgsMap["memberPhoneNumber"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>性別</label>
                        <br />
                        <input type="radio" name="gender" value="Male" id="sexOption" checked="checked">男
                        <input type="radio" name="gender" value="Female" id="sexOption" />女
                        <font class="text-danger">${errorMsgsMap["gender"]}</font>
                      </div>
                    </div>
                  </div>

                  <div id="twzipcode" class="form-row">
                    <div class="form-group col-2">
                      <label>地址</label>
                      <div class="address" data-role="county" data-style="form-control" data-name="county" data-value="110"></div>
                    </div>
                    <div class="form-group col-2">
                      <div class="address" data-role="district" data-style="form-control" data-name="district" data-value="臺北市"></div>
                    </div>
                    <div class="form-group col-2">
                      <div data-role="zipcode" data-style="form-control" data-name="zipcode" data-value="信義區"></div>
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" name="memberAddress" value="<%=(memberVO==null)? "八德路一段1號" : memberVO.getMemberAddress()%>" placeholder="居住地址" />
                    <font class="text-danger">${errorMsgsMap["memberAddress"]}</font>
                  </div>
                  
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>電子信箱＊</label>
                        <input type="email" id="Email" class="form-control" name="memberEmail" value="<%=(memberVO==null)? "kevinwang111@gmail.com" : memberVO.getMemberEmail()%>">
                        <font class="text-danger">${errorMsgsMap["memberEmail"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>上傳照片＊</label>
                        <input type="file" name="memberPictureId" />
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>設定密碼＊</label>
                        <input type="password" id="set_password" name="memberPassword" class="form-control" value="${memberVO.memberPassword}"/>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>確認密碼＊</label><font class="text-danger">${errorMsgsMap["PwErr"]}</font>
                        <input
                          type="password" id="confirm_password_2" name="memberPasswordRp" class="form-control"/>
                      </div>
                    </div>
                  </div>
<!--                   <div class="row d-flex align-items-end"> -->
<!--                     <div class="col-sm-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <label>驗證碼＊</label> -->
<!--                         <input -->
<!--                           type="text" -->
<!--                           id="set_password" -->
<!--                           name="set_password" -->
<!--                           class="form-control" -->
<!--                         /> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-sm-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <img -->
<!--                           class="verifyImg" -->
<!--                           src="./img/verifyImg.jpg" -->
<!--                           alt="" -->
<!--                         /> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                  <div class="row d-flex justify-content-center">
                    <div class="col-sm-6">
                    
                      <div class="form-group">
                        <button class="btn_full col-sm-6" type="submit" name="action" value="MemberAdd">確認註冊</button>
<%--                         <div>${errorMsgs}</div> --%>
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

    
    

    <!-- Common scripts -->
    <script src="<%=request.getContextPath()%>/front-end/Member/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/functions.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <!-- Specific scripts -->
    <script src="<%=request.getContextPath()%>/front-end/Member/js/pw_strenght.js"></script>
    <script>
      function myFunction() {
        var input = $("#datePicker").val();
        var birthday = new Date(input.replace(/-/g, "\/"));
        var birthYear = birthday.getFullYear();
        var birthMonth = birthday.getMonth();
        var birthDay = birthday.getDate();
        var today = new Date();
        var currentYear = today.getFullYear();
        var age = currentYear - birthYear;

        if (
          today.getMonth() < birthMonth ||
          (today.getMonth() == birthMonth && today.getDate() < birthDay)
        ) {
          age--;
        }
      }
    </script>

    <script>
      $("#twzipcode").twzipcode({});
    </script>
  </body>
</html>
