<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description"
    content="Citytours - Premium site template for city tours agencies, transfers and tickets." />
  <meta name="author" content="Ansonika" />
  <title>CITY TOURS - City tours and travel site template by Ansonika</title>

  <!-- Favicons-->
  <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
  <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
    href="img/apple-touch-icon-114x114-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
    href="img/apple-touch-icon-144x144-precomposed.png" />

  <!-- GOOGLE WEB FONT -->
  <link
    href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />

  <!-- COMMON CSS -->
 <link href="<%=request.getContextPath()%>/front-end/package/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/front-end/package/css/style.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/front-end/package/css/vendors.css" rel="stylesheet" />


  <!-- CUSTOM CSS -->
  <link href="css/custom.css" rel="stylesheet" />

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
  <header>
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
              <a href="index7.html" title="Welcome to royal Pandora">Welcome to royal Pandora</a>
            </h1>
          </div>
        </div>
        <nav class="col-9">
          <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>選單</span></a>
          <div class="main-menu">
            <div id="header_menu">
              <img src="./img/logo.png" width="160" height="34" alt="City tours" />
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
                    <a href="all_restaurants_list.html">會員資訊</a>
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

  <section id="search_container" style="background: url('https://picsum.photos/1903/800?random=5')">

  </section>
  <hr>
  <!-- End hero -->
  </br>
  <div class="container margin_15"style="text-align:right;margin: top 1px" >
			<form method="get" id="reservationnow1" action="https://www.google.com/">
                    <input name="packages" type="hidden" value="1">
                    <button class="btn btn-primary btn-sm" type="submit" 
                    	 style="width:300px;height:40px;background-color: #d8691e;border:white">立即預定</button>
             </form>
 </div>   
  <main>
    <div class="container margin_60">
      <div class="container-fluid">
        <!-- 停靠點停靠時間 -->
            
        <div class="card-header" style="background-color: rgb(112, 150, 189) ;">
          <h4 class="card-title" style="color:white">
            ${packagesVO.packageName}
          </h4>
         </div> 
	 
         <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
          <div class="col-4" style="border: 1px solid #ddd;">
            <img class="img-fluid"  style="display:block; margin:auto;max-width:100%; min-height: 100%;;"
              src="<%=request.getContextPath()%>/CruiseLineServlet?action=getImage&cruiseLineNo=${cruiseLineVO.cruiseLineNo}" alt="圖片遺失">
          </div>
          
       
    
         <div class="col-8" style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
              <div class="col-2"
                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                停靠點
              </div>
              <div class="col-4" style="border: 1px solid #ddd;margin: 0; padding: 0;">
                國家/港口
              </div>
              <div class="col-3" style="border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px">
                啟航時間
              </div>
              <div class="col-3"
                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                抵達時間
              </div>
            </div>
           <c:forEach var="portsOfCallDateVO" items="${portsOfCallDateVOList}" varStatus="packageStatus"> 
            <div class="row" style="border: 1px solid #ddd;margin: 0; padding: 0;">
              <div class="col-2"
                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
               第 ${packageStatus.count}個停靠港口
              </div>
              <div class="col-4" style="border: 1px solid #ddd;margin: 0; padding: 0;">
               ${packagesService.getPortName(portsOfCallDateVO.portOfCallNo)}
              </div>
              <div class="col-3" style="border: 1px solid #ddd;margin: 0; padding: 0;min-height:25px">
                ${portsOfCallDateVO.departureTime.format(dateTimeFormat)}
              </div>
              <div class="col-3"
                style="border: 1px solid #ddd;text-align:center;margin: 0; padding: 0;min-height:27px ;">
                ${portsOfCallDateVO.arrivalTime.format(dateTimeFormat)}
              </div>
            </div>
          </c:forEach>
          </div>
  
       </div>            
        </br>
        <marquee direction="right" height="30" scrollamount="5" behavior="alternate">
          ＊港口的途經順序、抵達啟航時間均為參考訊息，具體信息以遊輪實際行程為主。</marquee>
       
       
        </div>


      </div>







    </div>



    </div>


    <!-- /.card -->
    </div>
    <!--/.col (left) -->
    <!-- right column -->
    <div class="col-md-6"></div>
    <!--/.col (right) -->
    </div>
    <!-- /.row -->
    </div>
    <hr>
    <div class="main_title">
      <h2>旅遊行程</h2>
      <p>
        我們致力規劃您的美好旅程，每次的旅遊，不僅帶來回憶，更是身心靈的滿足。
      </p>
    </div>
    <main>
      <div class="container">
        <div class="row">
          <div class="col-6">
            <img src="https://picsum.photos/500/500?random=11" style="border-radius:40px;" alt="" />
          </div>
          <div class="col-6 justify-content-center align-items-center" style="display: flex">
            <div class="col">
              <p>
                <span style="font-size:30px ;    background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
                background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
                 background-clip: text;
                -webkit-background-clip: text;
                  color: transparent;
               ;"><u>潘多拉ROYAL CLASS PANDORA</u></span>
                </br>
                PANDORA號航班密集且舒適，多為台灣環島航班，尤其適合國人攜家帶眷上船度假。一覺醒來，就到達旅遊國度，不用像搭飛機出國一般，要扛厚重的行李、擔心嬰兒或長輩搭長途飛機的不適和困擾。航程途中，有囊括了24小時玩樂&料理饗宴的各式服務，一切隨心玩樂，一票到底、超值享受－「美食＋住宿＋免機票＋無限玩樂」。
                </br>
                我想在每個人的青春年歲里，都曾有過一段關於旅行的憧憬，一段說走就走的旅行。可是在現實里，因為種種的原因，這個美好的希冀變成了每個午夜夢回的美好夢想。

                如果，你還沒有踏上那條夢寐的旅途，不妨讓我們先欣賞由小編整理的關於旅行的唯美句子開始，用心聆聽文字裡的旅行意義。


                </br>
                大理的洱海形如人耳，風平浪靜時，像一顆深綠色的寶石鑲嵌在雲南大地上，微風吹過，海面上金光閃閃，泛起一道道美麗的浪花，嫵媚動人，讓我感受到了大自然的神奇。

              </p>

            </div>

          </div>
          <div class="col-6 justify-content-center align-items-center order-last" style="display: flex">
            <img src="https://picsum.photos/500/500?random=12" style="border-radius:40px;" alt="" />
          </div>
          <div class="col-6 aligen-item">
            <p style=" margin-top: 10%">
              潘朵拉打開魔盒，釋放出人世間的所有邪惡——貪婪、虛偽、誹謗、嫉妒、痛苦等等，
              宙斯要求潘朵拉不可以開，但是潘朵拉不敵好奇心的誘惑，還是偷偷的把盒子打開了，然而在盒子裡面裝的是許多不幸的事物——疾病、禍害等。潘朵拉把盒子打開後，原本寧靜沒有任何災害動亂的世界開始動盪不安起來，但潘多拉卻照眾神之王宙斯的旨意趁「希望」（希臘文Elpis）沒有來得及釋放時，在慌亂中趕緊蓋住盒子，結果盒內只剩希望沒飛出去，永遠鎖在盒內。因此即使人類不斷地受苦受難、遭遇種種挫折和折磨，希望都不會消失。
              有指潘朵拉關住的應該是「預兆」，因為預兆這個災禍被困在盒底，所以人類才擁有希望，不致於活在絕望當中；如果潘朵拉關住了希望，那麼人類世界應該是沒有希望，活在沒有前途、充滿了毀滅的世界中。但有說法認為這盒子裡除了裝有不幸的事物之外，同時也裝有友情、愛情等幸福的事物，象徵一切美好的事物都收藏於內，所以潘朵拉在蓋上盒子時才留住了希望。
              其實「盒子中保存希望」的寓意歷來在學界頗有爭議。如果災禍被釋放出盒子會帶給人類災禍，那希望未被釋放應該是「沒帶給人類希望」，那麼這段神話記載的意涵應該是更悲觀的，亦即：本出於善意而想少放一個災禍出去的潘朵拉反而誤把「希望」截留下來，人間因此毫無希望。還有另一個問題是，宙斯為何要在盒中一堆災禍裡摻入性質不同的「希望」？這又牽涉了其希臘原文「Elpis」的詞意，古希臘這個詞其實可表達「對壞事或好事的期望」。若是「對壞事的期望」，那就是一種讓人容易「擔驚受怕」的災禍；但即使當成「對好事的期望」（最接近「希望」），尼采也曾給出最黑暗的另類詮釋：宙斯就是想要人類受盡各種災禍折磨後仍抱持虛假的希望，以致於願意苟延殘喘而繼續遭受折磨。
            </p>
          </div>
        </div>
      </div>
    </main>
    </br>


    <!-- End container -->


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
    <span class="search-overlay-close"><i class="icon_set_1_icon-77"></i></span>
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
          <input type="password" class="form-control" name="password" id="password" value="" />
          <i class="icon_lock_alt"></i>
        </div>
        <div class="clearfix add_bottom_15">
          <div class="checkboxes float-start">
            <label class="container_check">Remember me
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
            <input type="email" class="form-control" name="email_forgot" id="email_forgot" />
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
  <script src="<%=request.getContextPath()%>/front-end/package/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/front-end/package/js/common_scripts_min.js"></script>
  <script src="<%=request.getContextPath()%>/front-end/package/js/functions.js"></script>

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
</body>

</html>