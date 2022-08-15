<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PANDORA_員工登入</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/adminlte.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./css/adminlte.css">

</head>

<body class="hold-transition layout-top-nav">
  <div class="wrapper" style="height:100%">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand-md navbar-dark navbar-dark">
      <div class="container">

        <img src="./images/LOGo.png" class="brand-image img-circle" style="opacity: .8">


        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-starget="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>




    </nav>
    <!-- /.navbar -->

    <!-- Content Wrapper. Contains page content -->

    <div class="content-wrapper">

      <!-- Content Header (Page header) -->
      <div class="content-header" style="width:100%;text-align:center">
        <div class="container" style="width:100%;text-align:center">


          <center>
            <img src="./images/shipwheel.gif">


            <body class="hold-transition login-page">Ï
              <div class="login-box">
                <!-- /.login-logo -->
                <div class="card card-outline card-primary">
                  <div class="card-header text-center">
                    <a href="<%=request.getContextPath()%>/back-end/emp/EMP_login.jsp" class="h2">PANDORA員工登入</a>
                  </div>
                  <div class="card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form action="<%=request.getContextPath()%>/EmpLoginUserOnly" method="Post">
                      <div class="input-group mb-3">
                        <input name="email" type="email" class="form-control" placeholder="Email">
                        <div class="input-group-append">
                          <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                          </div>
                        </div>
                      </div>
                      <div class="input-group mb-3">
                        <input name="password" type="password" class="form-control" placeholder="password">
                        <div class="input-group-append">
                          <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                          </div>
                        </div>
                      </div>
                      <div class="row text-danger"  >
                           <div class="text-center"> ${errorMsg}</div>                                         
                      </div>
                      <div class="row">
                        <div class="col-8">
                          <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                              Remember Me
                            </label>
                          </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                          <button  name="action" value="EMPLogin" type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                      </div>
                    </form>

                    <div class="social-auth-links text-center mt-2 mb-3">


                    </div>
                    <!-- /.social-auth-links -->

                    <p class="mb-1">
                      <a href="forgot-password.html">I forgot my password</a>
                    </p>

                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
              <!-- /.login-box -->

              <!-- jQuery -->
              <script src="../../plugins/jquery/jquery.min.js"></script>
              <!-- Bootstrap 4 -->
              <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
              <!-- AdminLTE App -->
              <script src="../../dist/js/adminlte.min.js"></script>
            </body>
          </center>

        </div><!-- /.col -->

      </div><!-- /.container-fluid -->
    </div>

    <!-- 登入開始-->


    <!-- 登入結束-->

    <!-- Main content -->
    <div class="content">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">


          </div>

        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Tibame_TGA102 第五組
    </div>

  </footer>
  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED SCRIPTS -->

  <!-- jQuery -->
  <script src="../../plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../../dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="../../dist/js/demo.js"></script>
</body>

</html>