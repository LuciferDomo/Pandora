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
    <title>ROYAL CLASS PANDORA</title>

    <!-- Favicons-->
    <link
      rel="shortcut icon"
      href="<%=request.getContextPath() %>/front-end/chatroom/img/favicon.ico"
      type="image/x-icon"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="<%=request.getContextPath() %>/front-end/chatroom/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="<%=request.getContextPath() %>/front-end/chatroom/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="<%=request.getContextPath() %>/front-end/chatroom/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="<%=request.getContextPath() %>/front-end/chatroom/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath() %>/front-end/chatroom/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/front-end/chatroom/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/front-end/chatroom/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath() %>/front-end/chatroom/css/custom.css" rel="stylesheet" />
    <style>
      
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
        min-width: 50%;
        max-width: 60%;
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
<%@ include file="/front-end/header.jsp" %>
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
          <h1>聊天室</h1>
          <!-- <p>Cursus neque cursus curae ante scelerisque vehicula</p> -->
        </div>
      </div>
    </section>
    <!-- End Section -->

    <main>
      <!-- End Position -->

      <div class="container">
        <div class="row">
          <div class="col-12">
            <h1>線上聊天室</h1>
            <h3
              id="statusOutput"
              class="statusOutput"
              style="height: 50px"
            ></h3>
            <textarea
              id="messagesArea"
              class="panel message-area"
              readonly
              style="height: 350px"
            ></textarea>
            <div class="panel input-area">
                            <input
                              id="userName"
                              class="text-field"
                              type="text"
                              placeholder="會員名稱" disabled="disabled" style=color:white;“
              value="${loginMember.chineseName}"
                            />
<!--               <input -->
<!--                 id="userName" -->
<!--                 class="text-field" -->
<!--                 type="text" -->
<!--                 placeholder="使用者名稱" -->
<!--               /> -->
              <input
                id="message"
                class="text-field"
                type="text"
                placeholder="請輸入訊息..."
                onkeydown="if (event.keyCode == 13) sendMessage();"
              />
              <input
                type="submit"
                id="sendMessage"
                class="button"
                value="傳送訊息"
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
    <script src="<%=request.getContextPath() %>/front-end/chatroom/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/front-end/chatroom/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath() %>/front-end/chatroom/js/functions.js"></script>
    <script src="<%=request.getContextPath() %>/front-end/chatroom/js/moment.min.js"></script>
    <script>
      var MyPoint = "/TogetherWS/james";
      var host = window.location.host;
      var path = window.location.pathname;
      var webCtx = path.substring(0, path.indexOf("/", 1));
      var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
      // ws://localhost:8081+/WebSocketChatWeb + /TogetherWS/james
      var statusOutput = document.getElementById("statusOutput");
      var webSocket;

      function connect() {
        // create a websocket
        webSocket = new WebSocket(endPointURL);

        webSocket.onopen = function (event) {
          updateStatus("線上聊天室");
          document.getElementById("sendMessage").disabled = false;
          document.getElementById("connect").disabled = true;
          document.getElementById("disconnect").disabled = false;
        };

        webSocket.onmessage = function (event) {
          var messagesArea = document.getElementById("messagesArea");
          var jsonObj = JSON.parse(event.data);
          var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
          messagesArea.value = messagesArea.value + message;
          messagesArea.scrollTop = messagesArea.scrollHeight;
        };

        webSocket.onclose = function (event) {
          updateStatus("WebSocket Disconnected");
        };
      }

      var inputUserName = document.getElementById("userName");
      inputUserName.focus();

      function sendMessage() {
        var userName = inputUserName.value.trim();
        if (userName === "") {
          alert("請輸入名稱");
          inputUserName.focus();
          return;
        }

        var inputMessage = document.getElementById("message");
        var message = inputMessage.value.trim();
        if (message === "") {
          alert("請輸入訊息...");
          inputMessage.focus();
        } else {
          var jsonObj = {
            userName: userName,
            message: message + " " + moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
          };
          webSocket.send(JSON.stringify(jsonObj));
          inputMessage.value = "";
          inputMessage.focus();
        }
      }

      function disconnect() {
        webSocket.close();
        document.getElementById("sendMessage").disabled = true;
        document.getElementById("connect").disabled = false;
        document.getElementById("disconnect").disabled = true;
      }

      function updateStatus(newStatus) {
        statusOutput.innerHTML = newStatus;
      }
    </script>
  </body>
</html>
