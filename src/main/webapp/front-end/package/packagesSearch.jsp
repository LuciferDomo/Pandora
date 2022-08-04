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
  <title>Welcome to Royal Pandora_Packages</title>

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
    <div id="search">
      <ul class="nav nav-tabs">

        <li><a href="#hotels" data-bs-toggle="tab" class="active show">行程選擇</a></li>

      </ul>

      <div class="tab-content">

        <!-- End rab -->
        <div class="tab-pane active show" id="hotels">
          <h3>全球環遊</h3>

          <!-- End row -->
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <label>出發地</label>
                <div class="styled-select-common">
                 <select id="departureID"  name="Departure" >
        			<option value=""></option>
        				 <c:forEach var="departure" items="${departureDistinctB}" > 
           		            		
         		    <option value="${departure}" ${departure==param["Departure"]?"selected":""}>
         		             	  ${departure}
         				</c:forEach>   
       		     </select>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>目的地</label>
                <div class="styled-select-common">
                 <select id="destinationID" name="Destination" >
        			<option value="" ></option>
        			<c:forEach var="destination" items="${destinationDistinctB}" > 
           		            		
         		    <option value="${destination}" ${destination==param["Destination"]?"selected":"" }>         		
         		          		    ${destination}
         			</c:forEach>   
       			</select>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>出發年月</label>
                <div class="styled-select-common">
                <select name="DepartureTime" id="departureTimeID" class="departureTimeSelect">
        			<option value=""></option>
        		<c:forEach var="departureTime" items="${departureTimeDistinctB}" > 
           		            		
         		    <option value="${departureTime}" ${departureTime==param["DepartureTime"]?"selected":"" }}>         		
         		          		    ${departureTime}
         		</c:forEach>   
       		</select>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>天數</label>
                <div class="styled-select-common">
                 <select name="Duration" id="durationID" class="durationSelect">
                    <option value="" selected>${param.Duration}</option>
                    <option value="5">1~5天</option>
                    <option value="10">6~9天</option>
                    <option value="20">10天以上</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <!-- End row -->
          <hr />
          <button class="btn_1 green" type="submit" name="action" value="listPackagesByCompositeQuery" style=width:200px>查詢行程</button>
                  
		<button class="btn_1 green" id="clearBtn" style=width:200px>清除</button></br>
		<i class="icon-search"></i>共有${count}個匹配行程
        </div>


      </div>
    </div>
  </section>
  <hr>
  <!-- End hero -->

  <main>
    <main>
      <div class="container margin_60">
        <div class="main_title">
          <h2>旅遊行程</h2>
          <p>
            我們致力規劃您的美好旅程，每次的旅遊，不僅帶來回憶，更是身心靈的滿足。
          </p>
        </div>

        <div class="row">
          <div class="col-lg-12 col-md-6 wow zoomIn" data-wow-delay="0.1s">
            <div class="tour_container">
              <div class="img_container">
                <a href="single_tour.html">
                  <img src="https://picsum.photos/1296/533?random=1" class="img-fluid" alt="Image" />
                  <div class="short_info">
                    <i class="icon_set_1_icon-8"></i>行程1<span class="price"><sup>$</sup>56000</span>

                  </div>
                </a>
              </div>
              <div class="tour_title" style="width:845px">
                <!--寫個function 觸發onclick事件=>form表單 input(查詢參數)=>送到後端  -->
                <!--action 對應到謀個servlet -->
                <h3><strong>行程1</strong>
                  &ensp;&ensp;航線:A->B
                </h3>
                <h3 style="display:inline-block;width:300px">
                  <form method="get" id="reservationnow1" action="https://www.google.com/">
                    <input name="packages" type="hidden" value="1">
                    <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                      style="width:300px;height:30px;">立即預定</button>
                  </form>

                </h3>
                <h3 style="display:inline-block;width:300px">
                  <form method="get" id="learnmore1" action="https://www.google.com/">
                    <input name="packages" type="hidden" value="1">
                    <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                      style="width:300px;height:30px;">了解航線詳情</button>
                  </form>
                </h3>

              </div>
            </div>
            <!-- End col -->

            <div class="col-lg-12 col-md-6 wow zoomIn" data-wow-delay="0.2s">
              <div class="tour_container">
                <div class="img_container">
                  <a href="single_tour.html">
                    <img src="https://picsum.photos/900/533?random=2" class="img-fluid" alt="Image" />
                    <div class="badge_save"><strong>7折</strong></div>
                    <div class="short_info">
                      <i class="icon_set_1_icon-8"></i>行程2<span class="price"><sup>$</sup>27900</span>
                    </div>
                  </a>
                </div>
                <div class="tour_title" style="width:845px">
                  <h3><strong>行程2</strong> &ensp;&ensp;航線:A->C</h3>
                  <h3 style="display:inline-block;width:300px">
                    <form method="get" id="reservationnow1" action="https://www.google.com/">
                      <input name="packages" type="hidden" value="1">
                      <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                        style="width:300px;height:30px;">立即預定</button>
                    </form>

                  </h3>
                  <h3 style="display:inline-block;width:300px">
                    <form method="get" id="learnmore1" action="https://www.google.com/">
                      <input name="packages" type="hidden" value="1">
                      <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                        style="width:300px;height:30px;">了解航線詳情</button>
                    </form>
                  </h3>


                </div>
              </div>

            </div>
            <!-- End col -->
            <div class="col-lg-12 col-md-6 wow zoomIn" data-wow-delay="0.3s">
              <div class="tour_container">
                <!-- <div class="ribbon_3 popular"><span>Popular</span></div> -->
                <div class="img_container">
                  <a href="single_tour.html">
                    <img src="https://picsum.photos/1296/533?random=3" class="img-fluid" alt="Image" />
                    <div class="short_info">
                      <i class="icon_set_1_icon-8"></i>行程3<span class="price"><sup>$</sup>48000</span>

                    </div>
                  </a>
                </div>
                <div class="tour_title" style="width:845px">
                  <!--寫個function 觸發onclick事件=>form表單 input(查詢參數)=>送到後端  -->
                  <!--action 對應到謀個servlet -->
                  <h3><strong>行程3</strong> &ensp;&ensp;航線:B->D</h3>
                  <h3 style="display:inline-block;width:300px">
                    <form method="get" id="reservationnow1" action="https://www.google.com/">
                      <input name="packages" type="hidden" value="1">
                      <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                        style="width:300px;height:30px;">立即預定</button>
                    </form>

                  </h3>
                  <h3 style="display:inline-block;width:300px">
                    <form method="get" id="learnmore1" action="https://www.google.com/">
                      <input name="packages" type="hidden" value="1">
                      <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                        style="width:300px;height:30px;">了解航線詳情</button>
                    </form>
                  </h3>
                </div>
                <!-- End col -->

                <div class="col-lg-12 col-md-6 wow zoomIn" data-wow-delay="0.4s">
                  <div class="tour_container">
                    <div class="img_container">
                      <a href="single_tour.html">
                        <img src="https://picsum.photos/1296/533?random=" class="img-fluid" alt="Image" />
                        <div class="short_info">
                          <i class="icon_set_1_icon-8"></i>行程4<span class="price"><sup>$</sup>36000</span>
                        </div>
                      </a>
                    </div>
                    <div class="tour_title" style="width:845px">
                      <h3><strong>行程4</strong> &ensp;&ensp;航線:E->F</h3>
                      <h3 style="display:inline-block;width:300px">
                        <form method="get" id="reservationnow1" action="https://www.google.com/">
                          <input name="packages" type="hidden" value="1">
                          <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                            style="width:300px;height:30px;">立即預定</button>
                        </form>
                      </h3>
                      <h3 style="display:inline-block;width:300px">
                        <form method="get" id="learnmore1" action="https://www.google.com/">
                          <input name="packages" type="hidden" value="1">
                          <button class="btn btn-primary btn-sm" type="submit" onclick="對應謀個function"
                            style="width:300px;height:30px;">了解航線詳情</button>
                        </form>
                      </h3>

                    </div>

                    <!-- End row -->
                    <div class="col-lg-12 col-md-6 wow zoomIn" data-wow-delay="0.4s">
                      <p class="text-center nopadding">
                        <a href="#" class="btn_1 medium"><i class="icon-eye-7"></i>上一頁(10)
                        </a>
                        <a href="#" class="btn_1 medium"><i class="icon-eye-7"></i>下一頁(10)
                        </a>
                      </p>
                    </div>

                  </div>
                  <!-- End container -->
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
    	$('#clearBtn').click(function(){
    		alert("HI");
    		var request = $.ajax({
   			  url: "<%=request.getContextPath()%>/PackagesServlet",
   			  method: "POST",
   			  data:{"action":"updateOption"},
   			  dataType: "json"
    		});
    			 
    		request.done(function( data ) {
    			console.log(data)
    			
	    		let departureAll='<option></option>';
	    		data.departureDistinct.forEach(function(departure){
	    			departureAll = departureAll + '<option>'+departure+'</option>'
	    		});
	    		
	    		let destinationAll='<option></option>';
	    		data.destinationDistinct.forEach(function(destination){
	    			destinationAll = destinationAll + '<option>'+destination+'</option>'
	       		})
	       		
	       		let departureTimeAll='<option></option>';
	    		data.departureTimeDistinct.forEach(function(departureTime){	    		
	    			departureTimeAll = departureTimeAll + '<option>'+ departureTime +'</option>'
	       		})
	       		
	       		let durationAll='<option></option>';
	    			    				    			
	    		durationAll = '<option></option>'+'<option value="5">1~5天</option>'+' <option value="10">6~9天</option>'+'<option value="20">10天以上</option>'
	    		
	       		
	   			$('#departureID').html(departureAll);	
	    		$('#destinationID').html(destinationAll);
	    		$('#departureTimeID').html(departureTimeAll);
	    		$('#durationID').html(durationAll);
   			});
    	
    	})
    	
    	
    });
    </script>
    
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