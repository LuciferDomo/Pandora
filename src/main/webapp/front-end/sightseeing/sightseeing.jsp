<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/front-end/sightseeing/img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="<%=request.getContextPath()%>/front-end/sightseeing/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="<%=request.getContextPath()%>/front-end/sightseeing/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="<%=request.getContextPath()%>/front-end/sightseeing/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="<%=request.getContextPath()%>/front-end/sightseeing/img/apple-touch-icon-144x144-precomposed.png"
    />
    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/sightseeing/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/sightseeing/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/sightseeing/css/vendors.css" rel="stylesheet" />
    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/sightseeing/css/custom.css" rel="stylesheet" />
    <style>
      #map {
        border-bottom: none;
        height: 550px;
      }
      .like_title ul {
        height: 50px;
        width: 80%;
        background-color: #bbcfe2;
        position: relative;
      }
      .like_title ul p {
        font-size: 20px;
        font-family: "Montserrat", Arial, sans-serif;
        justify-content: center;
        display: flex;
        margin: 0;
        position: absolute;
        top: 10px;
      }
      .like_content ul {
        height: 400px;
        width: 100%;
        background-color: #fff;
      }
      .mpa_list {
        margin-top: 0;
        background-color: #fff;
        height: 550px;
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
    <!-- Header Plain:  add the id plain to header and change logo.png to logo_sticky.png ======================= -->
    <header id="plain">
      <div id="top_line">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <i class="icon-phone"></i><strong>02 23456789</strong>
            </div>
            <div class="col-6">
              <ul id="top_links">
                <li><a href="#sign-in-dialog" id="access_link">登入</a></li>
                <li>
                  <a href="wishlist.html" id="wishlist_link">連絡我們</a>
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
          <div class="col-4">
            <div id="logo_home">
              <h1>
                <a href="index.html" title="Welcome to royal Pandora"
                  >Welcome to royal Pandora</a
                >
              </h1>
            </div>
          </div>
          <nav class="col-8">
            <a
              class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
              href="javascript:void(0);"
              ><span>選單</span></a
            >
            <div class="main-menu">
              <div id="header_menu">
                <img
                  src="<%=request.getContextPath()%>/front-end/sightseeing/img/logo_sticky.png"
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
                    ><i class="icon_bag_alt"></i><strong>3</strong></a
                  >
                  <ul class="dropdown-menu" id="cart_items">
                    <li>
                      <div class="image">
                        <img src="<%=request.getContextPath()%>/front-end/sightseeing/img/thumb_cart_1.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="<%=request.getContextPath()%>/front-end/sightseeing/img/thumb_cart_2.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="<%=request.getContextPath()%>/front-end/sightseeing/img/thumb_cart_3.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Versailles tour</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div>Total: <span>$120.00</span></div>
                      <a href="cart.html" class="button_drop">Go to cart</a>
                      <a href="payment.html" class="button_drop outline"
                        >Check out</a
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
    <div class="container">
      <div class="row" style="margin-top: 12%">
        <div class="col-3">
          <select name="" id="">
            <option value="">請選擇航線</option>
            <option value="">基隆-花蓮</option>
            <option value="">台中</option>
            <option value="">高雄</option>
          </select>
          <select name="" id="">
            <option value="">請選擇停靠點</option>
            <option value="">基隆</option>
            <option value="">台中</option>
            <option value="">高雄</option>
            <option value="">花蓮</option>
          </select>
        </div>
      </div>
      <div class="row">
        <div class="col-6">
          <div id="map" class="map"></div>
        </div>
        <div class="col-6">
          <div class="mpa_list">
            <ul></ul>
          </div>
        </div>
      </div>
      <div class="row wearherTitle"></div>
      <div class="row">
        <div class="col-4 like_title">
          <ul>
            <p>想去的餐廳</p>
          </ul>
        </div>
        <div class="col-4 like_title">
          <ul>
            <p>想去的景點</p>
          </ul>
        </div>
        <div class="col-4 like_title">
          <ul>
            <p>想去的活動</p>
          </ul>
        </div>
        <div class="col-4 like_content">
          <ul></ul>
        </div>
        <div class="col-4 like_content">
          <ul></ul>
        </div>
        <div class="col-4 like_content">
          <ul></ul>
        </div>
      </div>
    </div>
    <footer>
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
    <footer class="revealed"></footer>
    <!-- Common scripts -->
    <script src="<%=request.getContextPath()%>/front-end/sightseeing/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/sightseeing/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/sightseeing/js/functions.js"></script>
    <!-- Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaLnCT5X3SOIuBBlEMSlXuFLIh4qLyXxQ&libraries=places"></script>
    <script src="<%=request.getContextPath()%>/front-end/sightseeing/js/map_full_page.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/sightseeing/js/infobox.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.min.js"
      integrity="sha512-odNmoc1XJy5x1TMVMdC7EMs3IVdItLPlCeL5vSUPN2llYKMJ2eByTTAIiiuqLg+GdNr9hF6z81p27DArRFKT7A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <script>
      axios
        .get("http://localhost:8080/pandora/CruiseLineServlet", {
          action: "selectCruiseNo",
        })
        .then((response) => console.log(response));
    </script>
  </body>
</html>
