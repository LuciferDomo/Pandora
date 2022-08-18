<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>ROYAL CLASS PANDORA</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/front-end/customerService/img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="<%=request.getContextPath()%>/front-end/customerService/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="<%=request.getContextPath()%>/customerService/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="<%=request.getContextPath()%>/front-end/customerService/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="<%=request.getContextPath()%>/front-end/customerService/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/customerService/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/customerService/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/customerService/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/customerService/css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
      }
      .statusOutput {
        background: #0078ae;
        text-align: center;
        color: #ffffff;
        border: 1px solid grey;
        padding: 0.2em;
        box-shadow: 0 0 5px #000000;
        width: 30%;
      }
      #userName {
        width: 20%;
      }

      #message {
        min-width: 75%;
        max-width: 100%;
      }
      .text-field {
        border: 1px solid grey;
        padding: 0.2em;
        box-shadow: 0 0 5px #000000;
      }

      h1 {
        font-size: 1.5em;
        padding: 5px;
        margin: 5px;
      }
      .input-area {
        background: #0078ae;
        box-shadow: inset 0 0 10px #00568c;
      }

      .input-area input {
        margin: 0.5em 0em 0.5em 0.5em;
      }
      .panel {
        border: 2px solid #0078ae;
        border-radius: 5px;
        width: 100%;
      }

      .message-area {
        height: 70%;
        resize: none;
        box-sizing: border-box;
        overflow: auto;
      }
      * {
        margin: auto;
        padding: 0px;
      }
      html,
      body {
        font: 15px verdana, Times New Roman, arial, helvetica, sans-serif,
          Microsoft JhengHei;
      }
.friend {
        background: #eee;
        float: left;
      }

      .me {
        float: right;
        background: #0084ff;
        color: #fff;
      }

      .friend + .me {
        border-bottom-right-radius: 5px;
      }

      .me + .me {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }

      .me:last-of-type {
        border-bottom-right-radius: 30px;
      }
    </style>
  </head>

  <body onload="connect();" onunload="disconnect();">
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
                  src="<%=request.getContextPath()%>/front-end/customerService/img/logo.png"
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
                        <img src="<%=request.getContextPath()%>/front-end/customerService/img/thumb_cart_1.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="<%=request.getContextPath()%>/front-end/customerService/img/thumb_cart_2.jpg" alt="image" />
                      </div>
                      <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img src="<%=request.getContextPath()%>/front-end/customerService/img/thumb_cart_3.jpg" alt="image" />
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

    <section
      class="parallax-window"
      data-image-src="<%=request.getContextPath()%>/images/fagtitle.png"
    >
      <div
        class="parallax-content-1 opacity-mask"
        data-opacity-mask="rgba(0, 0, 0, 0.6)"
      >
        <div class="animated fadeInDown">
          <h1>線上客服系統</h1>
        </div>
      </div>
    </section>
    <!-- End Section -->

    <main style="height: 550px;">
      <!-- End Position -->

      <div class="container">
        <div class="row">
          <div class="col-12" style="height: 450px">
            <div class="talk_input row">
                <div class="col-12">
                    <h3 id="statusOutput" class="statusOutput" style="display: none">friend</h3>
                  <h3
                    id="statusOutput"
                    class="statusOutput"
                    style="text-align: left;display: none"
                  ></h3>
                </div>
                <div class="col-12" >
                  <div id="messagesArea" class="panel message-area" style="height: 300px;margin-top:5px"></div>
                </div>
                <div class="col-12">
                  <div class="panel input-area">
                    <input
                      id="message"
                      class="text-field"
                      type="text"
                      placeholder="請輸入訊息"
                      onkeydown="if (event.keyCode == 13) sendMessage();"
                    />
                    <input
                      type="submit"
                      id="sendMessage"
                      class="button"
                      value="確認送出"
                      onclick="sendMessage();"
                    />
                    <input
                      type="button"
                      id="connect"
                      class="button"
                      value="連線"
                      onclick="connect();"
                    />
                    <input
                      type="button"
                      id="disconnect"
                      class="button"
                      value="離線"
                      onclick="disconnect();"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div
              id="row"
              class="choose"
              style="display: block; display: none"
            ></div>
          </div>
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
    <script src="<%=request.getContextPath()%>/front-end/customerService/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/chatroom/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/customerService/js/functions.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/customerService/js/moment.min.js"></script>
    <script>var MyPoint = "/FriendWS/${userName}";
        var host = window.location.host;
        var path = window.location.pathname;
        var webCtx = path.substring(0, path.indexOf('/', 1));
        var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
        var statusOutput = document.getElementById("statusOutput");
        var messagesArea = document.getElementById("messagesArea");
        var self = '${userName}';
        var webSocket;
        function connect() {
            // create a websocket
            webSocket = new WebSocket(endPointURL);
            webSocket.onopen = function(event) {
                console.log("Connect Success!");
                document.getElementById('sendMessage').disabled = false;
                document.getElementById('connect').disabled = true;
                document.getElementById('disconnect').disabled = false;
            };
            webSocket.onmessage = function(event) {
                var jsonObj = JSON.parse(event.data);
                if ("open" === jsonObj.type) {
                    refreshFriendList(jsonObj);
                } else if ("history" === jsonObj.type) {
                    messagesArea.innerHTML = '';
                    var ul = document.createElement('ul');
                    ul.style = "list-style: none; margin: 0; padding: 0;";
                    ul.id = "area";
                    messagesArea.appendChild(ul);
                    var messages = JSON.parse(jsonObj.message);
                    for (var i = 0; i < messages.length; i++) {
                        var historyData = JSON.parse(messages[i]);
                        var showMsg = historyData.message;
                        var li = document.createElement('li');
                        li.style =
                            "display: inline-block;clear: both;padding: 20px;border-radius: 30px;margin-bottom: 2px;font-family: Helvetica, Arial, sans-serif;";
                        historyData.sender === self ? li.className += 'me' : li.className += 'friend';
                        li.innerHTML = showMsg;
                        ul.appendChild(li);
                    }
                    messagesArea.scrollTop = messagesArea.scrollHeight;
                } else if ("chat" === jsonObj.type) {
                    var li = document.createElement('li');
                    li.style =
                        "display: inline-block;clear: both;padding: 20px;border-radius: 30px;margin-bottom: 2px;font-family: Helvetica, Arial, sans-serif;";
                    jsonObj.sender === self ? li.className += 'me' : li.className += 'friend';
                    li.innerHTML = jsonObj.message;
                    console.log(li);
                    document.getElementById("area").appendChild(li);
                    messagesArea.scrollTop = messagesArea.scrollHeight;
                } else if ("close" === jsonObj.type) {
                    refreshFriendList(jsonObj);
                }
                
            };
            webSocket.onclose = function(event) {
                console.log("Disconnected!");
            };
            
        }
        
        function sendMessage() {
            var inputMessage = document.getElementById("message");
            var friend = statusOutput.textContent;
            var message = inputMessage.value.trim();
            if (friend === "" ||  true != /manager/i.test(friend)) {
            	
    			alert("非服務時間，請致電");
            
            } else if (message === "") {
            	
                alert("請輸入訊息...");
                inputMessage.focus();
            } else {
                var jsonObj = {
                    "type" : "chat",
                    "sender" : self,
                    "receiver" : "manager",
                    "message" : message  + " " + moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
                    "status": 1,
                };
                webSocket.send(JSON.stringify(jsonObj));
                inputMessage.value = "";
                inputMessage.focus();
            }
        }
        
        function refreshFriendList(jsonObj) {
            var friends = jsonObj.users;
            var row = document.getElementById("row");
            row.innerHTML = '';
            for (var i = 0; i < friends.length; i++) {
                if (friends[i] === self) { continue; }
                row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
            }
            addListener();
        }
    function addListener() {
            var container = document.getElementById("row");
            container.addEventListener("click", function(e) {
                var friend = e.srcElement.textContent;
                updateFriendName(friend);
                var jsonObj = {
                        "type" : "history",
                        "sender" : self,
                        "receiver" : friend,
                        "message" : ""+ moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
                    };
                webSocket.send(JSON.stringify(jsonObj));
            });
        }
        
    setTimeout(function(e){
        document.getElementById("row").click();
    },1000);
        
        function disconnect() {
            webSocket.close();
            document.getElementById('sendMessage').disabled = true;
            document.getElementById('connect').disabled = false;
            document.getElementById('disconnect').disabled = true;
        }
        
        function updateFriendName(name) {
            statusOutput.innerHTML = name;
        }</script>
  </body>
</html>
