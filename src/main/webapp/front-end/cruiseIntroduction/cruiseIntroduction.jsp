<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
    <link
      rel="shortcut icon"
      href="/pandora/front-end/cruiseIntroduction/img/favicon.ico"
      type="image/x-icon"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="/pandora/front-end/cruiseIntroduction/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="/pandora/front-end/cruiseIntroduction/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="/pandora/front-end/cruiseIntroduction/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="/pandora/front-end/cruiseIntroduction/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link
      href="/pandora/front-end/cruiseIntroduction/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="/pandora/front-end/cruiseIntroduction/css/style.css"
      rel="stylesheet"
    />
    <link
      href="/pandora/front-end/cruiseIntroduction/css/vendors.css"
      rel="stylesheet"
    />

    <!-- CUSTOM CSS -->
    <link
      href="/pandora/front-end/cruiseIntroduction/css/custom.css"
      rel="stylesheet"
    />
    
  </head>

  <body>
    <!--[if lte IE 8]>
      <p class="chromeframe">
        You are using an <strong>outdated</strong> browser. Please
        <a href="http://browsehappy.com/">upgrade your browser</a>.
      </p>
    <![endif]-->

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
      data-image-src="/pandora/images/fagtitle.png"
    >
      <div
        class="parallax-content-1 opacity-mask"
        data-opacity-mask="rgba(0, 0, 0, 0.6)"
      >
        <div class="animated fadeInDown">
          <h1>郵輪介紹</h1>
          <!-- <p>Cursus neque cursus curae ante scelerisque vehicula</p> -->
        </div>
      </div>
    </section>
    <!-- End Section -->

    <main>
      <!-- <div id="position">
        <div class="container">
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li>Page active</li>
          </ul>
        </div>
      </div> -->
      <!-- End Position -->

      <div class="container margin_60">
        <div class="main_title">
          <h2>CruiseHealth™ 安心防疫</h2>
          <p>確保感到受照顧（與安全）</p>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="col-lg-12 col-md-12">
            <p style="text-align: center">
              您期望有盡可能安全的假期，我們也是。因此您、我們的船員與我們所到之處的健康與安全是我們的首要任務，這也是為什麼在我們船上的所有人員疫苗接種率接近
              100%，以及與衛生當局制定將安全視為首位的防疫措施，同時視情況變化隨時進行更新。
              <br />
              <br />
              此外，我們的勛章假期（MedallionClass®）體驗將讓您可以藉由真正無接觸（TrulyTouchless™）體驗和個人化服務來掌控一切，讓您感到特別。
              這意味著為您開門；意味著您所愛的飲品送至身旁，並在假期中隨心所欲地享受，包括住宿、娛樂和餐飲。
              <br />
              <br />
              與潘多拉遊輪一起巡航不僅高CP。這是你所能擁有的最安全的假期之一。
            </p>
            <!-- <div class="general_icons">
              <ul>
                <li><i class="icon_set_1_icon-34"></i>Camera</li>
                <li><i class="icon_set_1_icon-31"></i>Video camera</li>
                <li><i class="icon_set_1_icon-35"></i>Credit cards</li>
                <li><i class="icon_set_1_icon-63"></i>Mobile</li>
                <li><i class="icon_set_1_icon-33"></i>Travel bag</li>
                <li><i class="icon_set_1_icon-9"></i>Snack</li>
                <li><i class="icon_set_1_icon-37"></i>Map</li>
              </ul>
            </div> -->
          </div>
        </div>
        <!-- End row -->
        <hr />
        <div class="row justify-content-between">
          <div class="col-md-12">
            <img
              src="/pandora/images/cruiseIntroduction1.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <!-- End row -->
        <hr />

        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction2.png"
              alt=""
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction3.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction4.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction5.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction6.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction7.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction8.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction9.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="clo-md-12">
            <img
              src="/pandora/images/cruiseIntroduction10.png"
              alt=""
              style="width: 100%"
              class="img-fluid styled"
            />
          </div>
        </div>
        <!-- End row -->
      </div>
      <!-- End container -->

      <!-- <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 nopadding features-intro-img">
            <div class="features-bg">
              <div class="features-img"></div>
            </div>
          </div>
          <div class="col-md-6 nopadding">
            <div class="features-content">
              <h3>"Ex vero mediocrem"</h3>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a
                lorem quis neque interdum consequat ut sed sem. Duis quis tempor
                nunc. Interdum et malesuada fames ac ante ipsum primis in
                faucibus.
              </p>
              <p>
                <a href="#" class="btn_1 white">Read more</a>
              </p>
            </div>
          </div>
        </div>
      </div> -->
      <!-- End container-fluid -->
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
    <script src="/pandora/front-end/cruiseIntroduction/js/jquery-3.6.0.min.js"></script>
    <script src="/pandora/front-end/cruiseIntroduction/js/common_scripts_min.js"></script>
    <script src="/pandora/front-end/cruiseIntroduction/js/functions.js"></script>
  </body>
</html>
