 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="shortcut icon" href="/pandora/front-end/information/img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="/pandora/front-end/information/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="/pandora/front-end/information/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="/pandora/front-end/information/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="/pandora/front-end/information/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="/pandora/front-end/information/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/pandora/front-end/information/css/style.css" rel="stylesheet" />
    <link href="/pandora/front-end/information/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="/pandora/front-end/information/css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
      }
    </style>
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
          <h1>活動新訊</h1>
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
          <p>關於Pandora最新資訊與優惠活動</p>
        </div>
        <hr />
        <div class="row justify-content-between">
          <div class="col-lg-4 col-md-5">
            <img
              src="/pandora/images/information1.jpg"
              alt="Image"
              class="img-fluid styled"
            />
          </div>
          <div class="col-lg-7 col-md-7">
            <h3>臺灣為全球第三大市場</h3>
            <p>
              亞洲遊輪市場蓬勃發展，臺灣更為遊輪產業中的最大亮點！根據國際郵輪協會(CLIA)的調查，遊輪可以說是亞洲發展最迅速的度假選擇，其中臺灣是亞洲區成長第二名的重點地區！全球豪華遊輪品牌－Pandora遊輪2022年進入臺灣市場後，積極耕耘有成，在2020年的創市際市場研究民調中勇奪遊輪品牌好感度調查冠軍，成為臺灣人心中最想搭的遊輪品牌。而Pandora遊輪在2014到2018短短五年之內，航次成長6.5倍、載客率更是飆升近10倍！專為亞洲打造的豪華遊輪Pandora號明年將以基隆作為母港進行長達半年的服務，預計自今年三月至八月都可以在基隆港看到Pandora號的身影。
            </p>
          </div>
        </div>
        <!-- End row -->
        <hr />
        <div class="row justify-content-between">
          <div class="col-lg-4 col-md-5">
            <img
              src="/pandora/images/information2.jpg"
              alt="Image"
              class="img-fluid styled"
            />
          </div>
          <div class="col-lg-7 col-md-7">
            <h3>清潔服務</span></h3>
            <p>
              Pandora遊輪宣布將徵求全球頂尖、專業認證的清潔公司，替Pandora號進行全船全面清潔及消毒工作。此清潔工作需待所有賓客和船員隔離完、下船後，於日本橫濱港進行。Pandora遊輪積極徵求在此行業中具有先進技術的公司，提供Pandora號上清潔、消毒及翻新工程的專業評估及建議。
            </p>
          </div>
        </div>
        <!-- End row -->
        <hr />
        <div class="row justify-content-between">
          <div class="col-lg-4 col-md-5 text-center">
            <img
              src="/pandora/images/information3.jpg"
              alt="Image"
              class="img-fluid styled"
            />
          </div>
          <div class="col-lg-7 col-md-7">
            <h3>麗星郵輪助你掌握業務成功</h3>
            <h4>
              Pandora郵輪皆備有國際級的一流酒店式配套，除舒適雅致的客房、設施完備的多用途空間之外，更額外精心呈獻一系列工餘活動。我們的專業活動團隊經驗豐富，能彈性配合你的要求，更具備卓越的策劃能力與細膩觸角，定能為你的團隊塑造完美體驗。
            </h4>

            <!-- End row  -->
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
    <script src="/pandora/front-end/information/js/jquery-3.6.0.min.js"></script>
    <script src="/pandora/front-end/information/js/common_scripts_min.js"></script>
    <script src="/pandora/front-end/information/js/functions.js"></script>
  </body>
</html>
