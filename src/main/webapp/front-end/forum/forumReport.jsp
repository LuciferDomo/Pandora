<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@page import="web.forum.bean.ForumVO"%>
<%@page import="web.forum.bean.CommentVO"%>
<%@page import="web.forum.service.impl.ForumServiceImpl"%>
<%@page import="web.forum.service.impl.CommentServiceImpl"%>

<%
ForumVO forumVO = (ForumVO) request.getAttribute("forumVO");
%>
<%= forumVO==null %>--${forumVO.postId}--

<%
    ForumServiceImpl forumSvc = new ForumServiceImpl();
    List<ForumVO> list = forumSvc.getAll();
    pageContext.setAttribute("list",list);
    
    CommentServiceImpl comSvc = new CommentServiceImpl();
    List<CommentVO> list2 = comSvc.getAll();
    pageContext.setAttribute("list2", list2);
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

    <link rel="stylesheet" href="css/adminlte.css" />
    <!-- 引用後台css -->

    <!-- CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
      }
    </style>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
    <%@ include file="/front-end/header.jsp" %>
    <!-- End Header -->

    
    <!-- End hero -->

    <main>
      <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ForumServlet" enctype='multipart/form-data'>
<!-- 					<input type="hidden" name="merberusing" -->
<%--                         value="<%=memberVO.getmemberId()%>"> --%>

					<div class="col-lg-10">
						<div class="card mb-7">
							<div class="card-body">
								<div class="mb-4">
									<label for="product_title" class="form-label">文章標題</label>
									
									<td>${forumVO.postTitle}</td> 
<!-- 									　　<input -->
<!-- 										type="text" placeholder="Type here" class="form-control" -->
<!-- 										id="product_title" name="title" -->
<%-- 										value="<%=(forumVO == null) ? "" : forumVO.getPostTitle()%>"/> --%>
								</div>
								<div id="errMsg"></div>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
						</div>
						<!-- card end// -->
						<div class="card mb-7">
							<div class="card-body">
								<div>
									<label for="article_content" class="form-label">檢舉原因</label>
									<textarea id="article_content" placeholder="Type here" class="form-control"
										rows="20" name="content" style="height: 300px"><%=(forumVO == null) ? "" : forumVO.getReason()%></textarea>
								</div>
								<div id="errMsg2"/></div>
							</div>
							<div class="card-body">


<!-- 								

							</div>
						</div>
						<!-- card end// -->



<!-- 						<div class="card mb-7"> -->
<!-- 							<div class="card-body"> -->
<!-- 								<div> -->


<!-- 									<label class="form-label">上傳圖片</label> <input -->
<!-- 										class="form-control" type="file" name="file" /> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="card mb-7"></div>

						<div>
						
<input type="hidden" name="action" value="forum_report">
<input type="hidden" name="postId" value="${forumVO.postId }"> 

<input type="submit" value="確認檢舉"></FORM>

			
			</div>
		</div>        
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

    <script src="js/jquery.ddslick.js"></script>
    <script>
      $("select.ddslick").each(function () {
        $(this).ddslick({
          showSelectedHTML: true,
        });
      });
    </script>

<script src="<%=request.getContextPath()%>/front-end/forum/js/jquery.ddslick.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/style.css"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/bootstrap.min.css "></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/css/vendors.css "></script>

  </body>
  
</html>