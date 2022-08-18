<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
    This is a starter template page. Use this page to start your new project from
    scratch. This page gets rid of all links and provides the needed markup only.
    -->
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_後台系統</title>

    <!-- Google Font: Source Sans Pro -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"
    />
    <!-- Font Awesome Icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- Theme style -->
    <link
      rel="stylesheet"
      href="<%=request.getContextPath()%>/back-end/customerService/css/adminlte.css"
    />
    <style>
      .container {
        width: 1024px;
        padding: 2em;
      }

      .bold-blue {
        font-weight: bold;
        color: #0277bd;
      }
      .preview span.text {
        color: lightgray;
      }
      .preview {
        border: 1px solid lightgray;
      }
      .panel {
        float: right;
        border: 2px solid #0078ae;
        border-radius: 5px;
        width: 100%;
      }
      .message-area {
        height: 300px;
        resize: none;
        box-sizing: border-box;
        overflow: auto;
        background-color: #ffffff;
      }

      .input-area {
        background: #0078ae;
        box-shadow: inset 0 0 10px #00568c;
      }

      .input-area input {
        margin: 0.5em 0em 0.5em 0.5em;
      }

      .text-field {
        border: 1px solid grey;
        padding: 0.2em;
        box-shadow: 0 0 5px #000000;
      }
      #message {
        min-width: 65%;
        max-width: 100%;
      }

      .statusOutput {
        background: #0078ae;
        text-align: center;
        color: #ffffff;
        border: 1px solid grey;
        padding: 0.2em;
        box-shadow: 0 0 5px #000000;
        width: 30%;
        margin-top: 10%;
        margin-left: 30%;
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

  <body class="hold-transition sidebar-mini" onunload="disconnect();">
    <!-- 主要開發區塊 -->
    <div class="wrapper">
      <!-- Navbar header區塊-->
      <nav
        id="navbar-header"
        class="main-header navbar navbar-expand navbar-white navbar-light"
      >
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"
              ><i class="fas fa-bars"></i
            ></a>
          </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"></div>
          <li class="nav-item">
            <a class="nav-link" data-widget="login-out" href="#" role="button">
              <i class="fas fa-arrow-right-from-bracket"></i>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.navbar -->
      <!-- Main Sidebar Container 主側邊欄-->
<%@ include file="/back-end/aside.jsp" %>
      <!-- Content Wrapper. Contains page content 主頁面欄位-->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class="m-0">PANDORA後台系統</h1>
              </div>
              <!-- /.col -->
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item">
                    <a href="#">聊天室管理</a>
                  </li>
                  <li class="breadcrumb-item active">客服聊天室</li>
                </ol>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <!-- left column -->
              <div class="col-12 textc">
                <h3 id="statusOutput" class="statusOutput"></h3>
                <div id="row"></div>
                <div id="messagesArea" class="panel message-area"></div>
                <div class="panel input-area">
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
            <!-- /.card -->

            <!--/.col (left) -->
            <!-- right column -->

            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
      </div>
      <!-- ============ Footer段落 ============ -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">Tibame_TGA102 第五組</div>
        <!-- Default to the left -->
        <!-- <strong
                        >Copyright &copy; 2014-2021
                        <a href="https://adminlte.io">AdminLTE.io</a>.</strong
                    >
                    All rights reserved. -->
      </footer>
      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
      <!-- ============ Footer段落 ============ -->
      <!-- /.content-wrapper -->
    </div>
    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/back-end/customerService/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<%=request.getContextPath()%>/back-end/customerService/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/back-end/customerService/js/adminlte.js"></script>
    <script>
      //exporte les données sélectionnées
      var $table = $("#table");

      var trBoldBlue = $(" table");
      $(trBoldBlue).on("click", "tr", function () {
        $(this).toggleClass("bold-blue");
      });
    </script>

    <!-- 上下頁 -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://github.com/kayalshri/tableExport.jquery.plugin/blob/master/jquery.base64.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css"
    />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
      crossorigin="anonymous"
    ></script>
    <script src="<%=request.getContextPath() %>/front-end/chatroom/js/moment.min.js"></script>
    <script>
      var MyPoint = "/FriendWS/${userName}";
      var host = window.location.host;
      var path = window.location.pathname;
      var webCtx = path.substring(0, path.indexOf("/", 1));
      var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
      var statusOutput = document.getElementById("statusOutput");
      var messagesArea = document.getElementById("messagesArea");
      var self = "${userName}";
      var friend;
      var webSocket;

      connect();
      function connect() {
        // create a websocket
        webSocket = new WebSocket(endPointURL);
        webSocket.onopen = function (event) {
          console.log("Connect Success!");
          document.getElementById("sendMessage").disabled = false;
          document.getElementById("connect").disabled = true;
          document.getElementById("disconnect").disabled = false;
        };
        webSocket.onmessage = function (event) {
          var jsonObj = JSON.parse(event.data);
          if ("open" === jsonObj.type) {
            refreshFriendList(jsonObj);
          } else if ("history" === jsonObj.type) {
            messagesArea.innerHTML = "";
            var ul = document.createElement("ul");
            ul.id = "area";
            ul.style = "list-style: none; margin: 0; padding: 0;";
            messagesArea.appendChild(ul);
            var messages = JSON.parse(jsonObj.message);
            for (var i = 0; i < messages.length; i++) {
              var historyData = JSON.parse(messages[i]);
              var showMsg = historyData.message;
              var li = document.createElement("li");
              li.style =
                "display: inline-block;clear: both;padding: 20px;border-radius: 30px;margin-bottom: 2px;font-family: Helvetica, Arial, sans-serif;";
              historyData.sender === self
                ? (li.className += "me")
                : (li.className += "friend");

              li.innerHTML = showMsg;
              ul.appendChild(li);
            }
            messagesArea.scrollTop = messagesArea.scrollHeight;
          } else if ("chat" === jsonObj.type) {
            var li = document.createElement("li");
            li.style =
              "display: inline-block;clear: both;padding: 20px;border-radius: 30px;margin-bottom: 2px;font-family: Helvetica, Arial, sans-serif;";
            jsonObj.sender === self
              ? (li.className += "me")
              : (li.className += "friend");

            li.innerHTML = jsonObj.message;
            console.log(li);
            document.getElementById("area").appendChild(li);
            messagesArea.scrollTop = messagesArea.scrollHeight;
          } else if ("close" === jsonObj.type) {
            refreshFriendList(jsonObj);
          }
        };
        webSocket.onclose = function (event) {
          console.log("Disconnected!");
        };
      }

      const sendMessage = () => {
        var inputMessage = document.getElementById("message");
        var friend = statusOutput.textContent;
        var message = inputMessage.value.trim();
        if (message === "") {
        	
          alert("請輸入訊息");
          inputMessage.focus();
        } else if (friend === "") {
        	
          alert("請選擇對話視窗");
        } else {
          var jsonObj = {
            type: "chat",
            sender: self,
            receiver: friend,
            message: message + " " + moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
          };
          webSocket.send(JSON.stringify(jsonObj));
          inputMessage.value = "";
          inputMessage.focus();
        }
      };

      function refreshFriendList(jsonObj) {
        var friends = jsonObj.users;
        var row = document.getElementById("row");
        row.innerHTML = "";
        for (var i = 0; i < friends.length; i++) {
          if (friends[i] === self) {
            continue;
          }
          row.innerHTML +=
            "<div id=" +
            i +
            ' class="column" name="friendName" value=' +
            friends[i] +
            " ><h2>" +
            friends[i] +
            "</h2></div>";
        }
        addListener();
      }
      function addListener() {
        var container = document.getElementById("row");
        container.addEventListener("click", function (e) {
          friend = e.srcElement.textContent;
          updateFriendName(friend);
          var jsonObj = {
            type: "history",
            sender: self,
            receiver: friend,
            message: ""+ moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
          };
          webSocket.send(JSON.stringify(jsonObj));
        });
      }

      function disconnect() {
        webSocket.close();
        document.getElementById("sendMessage").disabled = true;
        document.getElementById("connect").disabled = false;
        document.getElementById("disconnect").disabled = true;
      }

      function updateFriendName(name) {
        statusOutput.innerHTML = name;
      }
    </script>
  </body>
</html>
