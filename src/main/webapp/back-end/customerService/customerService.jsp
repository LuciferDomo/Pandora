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
      href="<%=request.getContextPath()%>/css/adminlte.css"
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
    </style>
  </head>

  <body class="hold-transition sidebar-mini">
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

              <!-- /.card -->
            </div>
            <!--/.col (left) -->
            <!-- right column -->
            <div class="talk_con">
              <div class="conbox">
                <h4 align="center">聊天室管理</h4>
                <form
                  id="myForm"
                  action="<%=request.getContextPath()%>/admin/chat"
                  method="POST"
                  autocomplete="off"
                >
                  <div
                    class="forminput"
                    style="
                      display: flex;
                      justify-content: center;
                      align-items: center;
                    "
                  >
                    <input
                    id="userName"
                      name="userName"
                      class="text-field"
                      type="hidden"
                      value="manager"
                    />
                    <button
                    id="send"
                      type="submit"
                      class="contactFormSubmitBtn"
                      style="
                        width: 100px;
                        border-radius: 10px;
                        background-color: #bbcfe2;
                      "
                      value="送出"
                      onclick="sendName();"
                    >
                      進入管理
                    </button>
                  </div>
                </form>
              </div>
              <!--/.col (right) -->
            </div>
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
    <script>
      
        var inputUserName = document.getElementById("userName");
        inputUserName.focus();

        function sendName() {
          var userName = inputUserName.value.trim();
          if (userName === "") {
        	  
            alert("請輸入名稱");
            inputUserName.focus();
            return;
          } else {
            document.getElementById("myForm").submit();
          }
        }
    </script>
  </body>
</html>
