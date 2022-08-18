<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                  <c:if test="${loginMember != null}">
                    <font
                      >${loginMember.memberEnglishLastName}&nbsp${loginMember.memberEnglishFirstName}</font
                    >
                  </c:if>
                </li>
                <li>
                  <c:choose>
                    <c:when test="${loginMember != null}">
                      <a
                        href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberSignOut"
                      >
                        登出<i class="icon-logout-1" id="logout"></i>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <a
                        href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberLogin"
                      >
                        登入<i class="icon-logout-1" id="logout"></i>
                      </a>
                    </c:otherwise>
                  </c:choose>
                </li>
                <li>
                  <a
                    href="javascript:window.location.href='/pandora/front-end/faq/faq.jsp'"
                    id="wishlist_link"
                    >聯絡我們</a
                  >
                </li>
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
                <a href="javascript:window.location.href='/pandora/PackagesServlet?action=homePage'" title="Welcome to royal Pandora"
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
                  src="/pandora/front-end/cruiseIntroduction/img/logo.png"
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
                  <a
                    href="javascript:window.location.href='/pandora/PackagesServlet?action=homePage'"
                    class="show-submenu"
                    style="width: 100px"
                    >預定行程
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="javascript:window.location.href='/pandora/front-end/cruiseIntroduction/cruiseIntroduction.jsp'"
                    class="show-submenu"
                    style="width: 100px"
                    >郵輪介紹
                  </a>
                </li>
                <li class="submenu">
                  <a
                    href="javascript:window.location.href='/pandora/front-end/information/information.jsp'"
                    class="show-submenu"
                    style="width: 100px"
                    >活動新訊
                  </a>
                </li>
                <li class="megamenu submenu">
                  <a
                    href="javascript:window.location.href='/pandora/front-end/sightseeing/sightseeing2.jsp'"
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
                      <a
                        href="javascript:window.location.href='/pandora/front-end/Member/Member_Info.jsp'"
                        >會員資訊</a
                      >
                    </li>
                    <li>
                      <a
                        href="javascript:window.location.href='/pandora/front-end/Member/Member_InfoAlter.jsp'"
                        >會員資料修改</a
                      >
                    </li>
                    <li>
                      <a
                        href="javascript:window.location.href='/pandora/front-end/Member/MemberPasswordChange.jsp'"
                        >密碼更改</a
                      >
                    </li>
                    <li>
                      <a
                        href="javascript:window.location.href='/pandora/front-end/Member/OrderRecord.jsp'"
                        >訂單查詢</a
                      >
                    </li>
                    <li>
                      <a
                        href="javascript:window.location.href='/pandora/front-end/chatroom/chatroom.jsp'"
                        >聊天室</a
                      >
                    </li>
                    <li>
                      <a
                        href="javascript:window.location.href='/pandora/front-end/forum/forumAllList.jsp'"
                        >討論區</a
                      >
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- End main-menu -->
          </nav>
        </div>
      </div>
      <!-- container -->
    </header>