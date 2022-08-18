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
    <link
      rel="shortcut icon"
      href="/pandora/front-end/faq/img/favicon.ico"
      type="image/x-icon"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="/pandora/front-end/faq/img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="/pandora/front-end/faq/img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="/pandora/front-end/faq/img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="appl e-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="/pandora/front-end/faq/img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="/pandora/front-end/faq/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/pandora/front-end/faq/css/style.css" rel="stylesheet" />
    <link href="/pandora/front-end/faq/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="/pandora/front-end/faq/css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
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
                  src="/pandora/front-end/faq/img/logo.png"
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
                        <img
                          src="/pandora/front-end/faq/img/thumb_cart_1.jpg"
                          alt="image"
                        />
                      </div>
                      <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img
                          src="/pandora/front-end/faq/img/thumb_cart_2.jpg"
                          alt="image"
                        />
                      </div>
                      <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                      <a href="#" class="action"><i class="icon-trash"></i></a>
                    </li>
                    <li>
                      <div class="image">
                        <img
                          src="/pandora/front-end/faq/img/thumb_cart_3.jpg"
                          alt="image"
                        />
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
      data-parallax="scroll"
      data-image-src="/pandora/images/fagtitle.png"
      data-natural-width="1400"
      data-natural-height="470"
    >
      <div
        class="parallax-content-1 opacity-mask"
        data-opacity-mask="rgba(0, 0, 0, 0.6)"
      >
        <div class="animated fadeInDown">
          <h1>常見問題</h1>
          <p>F&Q</p>
        </div>
      </div>
    </section>
    <!-- End section -->

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
      <!-- Position -->

      <div class="container margin_60">
        <div class="row">
          <aside class="col-lg-3" id="sidebar">
            <div class="theiaStickySidebar">
              <div class="box_style_cat" id="faq_box">
                <ul id="cat_nav">
                  <li>
                    <a href="#payment" class="active"
                      ><i class="icon_set_1_icon-95"></i>一般問題</a
                    >
                  </li>
                  <li>
                    <a href="#tips"
                      ><i class="icon_set_1_icon-95"></i>安全須知</a
                    >
                  </li>
                  <li>
                    <a href="#reccomendations"
                      ><i class="icon_set_1_icon-95"></i>消費詢問</a
                    >
                  </li>
                  <li>
                    <a href="#terms"
                      ><i class="icon_set_1_icon-95"></i>飲食需求</a
                    >
                  </li>
                  <li>
                    <a href="#booking"
                      ><i class="icon_set_1_icon-95"></i>行前準備</a
                    >
                  </li>
                  <!-- <li>
                    <a href="#transfers"
                      ><i class="icon_set_1_icon-95"></i>轉讓</a
                    >
                  </li> -->
                </ul>
              </div>
              <div class="box_style_2 d-none d-sm-block">
                <i class="icon_set_1_icon-57"></i>
                <h4>需要<span>幫助?</span></h4>
                <h5>客服專線</h5>
                <a href="tel://0221833000" class="phone">02-2183-3000</a>
                <h5>免付費服務電話</h5>
                <a href="tel://0800123456" class="phone">0800-123-456</a>
                <small>星期一 到 星期五 09:00-12:30 / 13:30-17:30</small><br />
                <small>info@carnival-tw.com</small>
                <br>
                <button
                  type="submit"
                  style="
                    border-radius: 5%;
                    border: 0px;
                    background-color: #bbcfe2;
                    padding-left: 20px;
                    padding-right: 20px;
                  "
                  onclick="javascript:location.href='<%=request.getContextPath()%>/front-end/customerService/customerService.jsp'"
                >
                  專人線上服務
                </button>
              </div>
            </div>
            <!--End sticky -->
          </aside>
          <!--End aside -->
          <div class="col-lg-9" id="faq">
            <h3 class="nomargin_top">一般問題</h3>
            <div id="payment" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#payment"
                      href="#collapseOne_payment"
                      >如果航程中停靠了好幾個國家，我需要辦理每個國家的簽證嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_payment"
                  class="collapse"
                  data-bs-parent="#payment"
                >
                  <div class="card-body">
                    一般而言，起航港口所在國及終點港口所在國家的簽證是一定需要的，但Pandora遊輪無法協助旅客
                    處理簽證問題，簽證文件自行上外交部領事局或各國簽辦中心及旅行社相關單位確認。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#payment"
                      href="#collapseTwo_payment"
                      >如果因故沒能及時搭上船怎麼辦？如果臨時有事，提前下船可以退費嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_payment"
                  class="collapse"
                  data-bs-parent="#payment"
                >
                  <div class="card-body">
                    如果無法於啟航前辦妥登船手續，請立即與Pandora遊輪聯絡，安排您前往下一個可辦理登船手續的港口登船，但您需自行負擔因此產生的費用（如住宿、交通、機票、簽證、餐食...等）。
                    <br />
                    如您選擇放棄登船，是無法獲得任何退費的。由於遊輪上的船位，無法分段銷售，如果您中途下船，剩下的行程，是無法獲得退費的。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#payment"
                      href="#collapseThree_payment"
                      >Pandora遊輪有哪些房型？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_payment"
                  class="collapse"
                  data-bs-parent="#payment"
                >
                  <div class="card-body">
                    Pandora遊輪提供各式類型房型，從受歡迎的豪華房、舒適的一般房到寬敞的家庭房，均能滿足不同賓客的喜好。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#payment"
                      href="#collapseFour_payment"
                      >在遊輪上，我可以上網嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFour_payment"
                  class="collapse"
                  data-bs-parent="#payment"
                >
                  <div class="card-body">
                    每一艘Pandora遊輪於客艙及公共區域都有提供免付費內網和付費衛星網路服務。您可以透過Pandora遊輪獨家內建網路系統「Pandora@Sea」，查詢活動消費資訊。<br />
                    或加購最新推出的衛星網路 -「勛章網路
                    MedallionNet™」享受快速、穩定、無限且惠實的海上通訊，隨時保持連接狀態。<br />
                    關於網路收費及其它資訊，請聯繫船上網路咖啡室經理，或請登船後於Pandora遊輪內網系統查詢。
                  </div>
                </div>
              </div>
            </div>
            <!--End payment -->

            <h3>安全須知</h3>
            <div id="tips" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#tips"
                      href="#collapseOne_tips"
                      >在船上生病了怎麼辦？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_tips"
                  class="collapse"
                  data-bs-parent="#tips"
                >
                  <div class="card-body">
                    Pandora遊輪上皆備有醫務室及駐船船醫，可以提供一般的醫療及緊急狀況的處理，如果真的有非常緊急的狀況，會聯絡岸上的醫療救援單位派遣醫療直昇機至遊輪上進行運送作業。<br />
                    <br />
                    但所產生的醫療費用，需由旅客自行負擔。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#tips"
                      href="#collapseTwo_tips"
                      >在航程期間，如有狀況，有沒有辦法聯絡到我？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_tips"
                  class="collapse"
                  data-bs-parent="#tips"
                >
                  <div class="card-body">
                    遊輪航行在海上時，如果有事需聯絡您，可以透過衛星電話與您聯絡。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#tips"
                      href="#collapseThree_tips"
                      >是否提供行動不便人士的友好空間呢？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_tips"
                  class="collapse"
                  data-bs-parent="#tips"
                >
                  <div class="card-body">
                    Pandora遊輪盡一切努力配合身障旅客，且旗下遊輪皆設有無障礙客艙，但因數量有限，必須及早訂位並提出相關輪椅攜帶文件。<br />
                    航程間和陸上行程時，賓客須全程自備輪椅，Pandora遊輪無提供租借服務。
                    <br />
                    <br />
                    請注意，因安全考量，如賓客無法自行步行登上接駁船，則無法轉乘接駁船登陸旅遊或是參加岸上觀光。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#tips"
                      href="#collapseFour_tips"
                      >艙房或艙房陽台是否可以吸菸？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFour_tips"
                  class="collapse"
                  data-bs-parent="#tips"
                >
                  <div class="card-body">
                    Pandora船隊所有艙房及陽台均為禁菸區域。<br />
                    船上僅戶外甲板及雪茄吧、舞廳、及賭場的指定區域可供吸菸。實際區域依船上公告為準。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#tips"
                      href="#collapseFive_tips"
                      >孕婦或嬰兒是否有登船限制？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFive_tips"
                  class="collapse"
                  data-bs-parent="#tips"
                >
                  <div class="card-body">
                    Pandora遊輪歡迎滿六個月或一歲以上(視航線區域規定)孩童搭乘。Pandora遊輪規定懷孕滿24週期之孕婦不得搭乘，此週期將以航程結束當日作計算。
                    <br />
                    孕婦應於航行前 7 至 10 日內由其主治醫生開立適航證明
                    (MEDIF)，且需於表單上詳載孕婦妊娠週數等診斷說明，以供備查。<br />
                    <br />
                    為便利目的地國之入境查驗及順利航行，我們建議您隨身攜帶主治醫師所開立註明預產期之診斷證明。部份國家對孕婦入境有特別規定，您尙須於出發前先洽詢入境國之當地辦事處相關事宜。
                  </div>
                </div>
              </div>
            </div>
            <!--End tips -->

            <h3>消費詢問</h3>
            <div id="reccomendations" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#reccomendations"
                      href="#collapseOne_reccomendations"
                      >船上是採取什麼樣的消費模式？需要攜帶現金嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_reccomendations"
                  class="collapse"
                  data-bs-parent="#reccomendations"
                >
                  <div class="card-body">
                    Pandora遊輪最棒的服務之一，就是在船上不需攜帶現金，所有消費只需您的簽名，便會自動掛到艙房帳單上。結束航程前，您將收到一份列有明細的帳單供您核對。<br />
                    如在登船時已提供信用卡卡號，在核對金額無誤後，行程結束就可直接下船，不須至櫃檯辦理退房。<br />
                    倘若選擇現金或旅行支票的乘客，在辦理登船手續時，需在登船後至船上事務櫃台存放
                    USD$300
                    的押金，以供船上消費折抵用，當押金金額過低，事務櫃檯將會通知您再存入現金。（行程結束當天收到結帳明細，請務必保留至少三個月。）<br />
                    <br />
                    <p style="color: red">
                      請注意：所有金流需於船上事務櫃台作業，於完成後務必向服務人員索取憑證，並且自行再次確認船上帳戶金額是否有誤。
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#reccomendations"
                      href="#collapseTwo_reccomendations"
                      >船上一定要抵押信用卡或現金於帳戶之中嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_reccomendations"
                  class="collapse"
                  data-bs-parent="#reccomendations"
                >
                  <div class="card-body">
                    未使用信用卡綁定押金者，不論旅客年齡，皆需於登船當日至船上賓客服務櫃檯完成每人現金
                    300 美元的押金存入手續。 <br />
                    <br />
                    若旅客選擇以信用卡綁訂者，航程中將產生預授權金額約100美元之消費通知信息(扣款金額以實際消費為主)，該筆款項會於下船後45天左右自動解除(解除時間還需參照各家銀行規定)。<br />
                    <br />
                    建議於出發前先行知會信用卡公司，告知可能會有海外消費產生，以免發生信用卡無法授權使用，而導致航程中須前往服務櫃檯重新作業。若造成您的困擾，敬請見諒。
                    <br />
                    <p style="color: red">＊不可使用VISA金融信用卡/簽帳卡</p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#reccomendations"
                      href="#collapseThree_reccomendations"
                      >是否提供會員制度？分為幾種？如何取得又有那些優惠？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_reccomendations"
                  class="collapse"
                  data-bs-parent="#reccomendations"
                >
                  <div class="card-body">
                    Pandora遊輪分有四種會員制度，消費超過50000的貴賓即為『一般會員』；消費超過200000即為『初等會員』；<br />
                    消費超過500000即為『中等會員』；消費超過1000000即為『高等會員』。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#reccomendations"
                      href="#collapseFour_reccomendations"
                      >我可以使用VISA金融卡或簽帳卡嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFour_reccomendations"
                  class="collapse"
                  data-bs-parent="#reccomendations"
                >
                  <div class="card-body">
                    請勿使用VISA金融卡/簽帳卡，因航行時的押金預授權/佔用額度會直接從帳戶進行扣款，即您的可用餘額會立即減少。若您使用此類型卡片而產生與實際消費金額不符，或重複扣款的狀況，尚須等候航程結束後60天銀行端自動修正。
                    <br />
                    反之，若您的卡片交易模式為一般信用額度信用卡，押金預授權僅會佔用您的額度，但並不會實際向您請款。於航行中您尚有可能收到銀行所發送之預授權金額扣款簡訊或任何通知信息（約為臺幣3000元），但該筆押金（授權額度）會自動解除，並不會出現在您的收款帳單中。解除時間還需參照各家銀行規定。
                  </div>
                </div>
              </div>
            </div>
            <!--End reccomendations -->

            <h3>飲食需求</h3>
            <div id="terms" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#terms"
                      href="#collapseOne_terms"
                      >船上有為素食者安排特別的菜單嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_terms"
                  class="collapse"
                  data-bs-parent="#terms"
                >
                  <div class="card-body">
                    有的！除了自助餐廳裡有各式各樣的蔬菜水果外，主餐廳亦提供西方蛋奶素食料理。如有特殊需求,可以事先提出，以利為您確認與協助。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#terms"
                      href="#collapseTwo_terms"
                      >有為年長者或幼兒設計的餐飲嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_terms"
                  class="collapse"
                  data-bs-parent="#terms"
                >
                  <div class="card-body">
                    有的！對於年長者，船上有健康菜單供您選用，甚至備有低糖甜點，供您餐後選用。嬰幼兒則同樣備有嬰兒食品。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#terms"
                      href="#collapseThree_terms"
                      >船上有因宗教而安排特別的菜單嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_terms"
                  class="collapse"
                  data-bs-parent="#terms"
                >
                  <div class="card-body">
                    有的！只要事先預訂，船上亦可提供猶太教餐食。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#terms"
                      href="#collapseFour_terms"
                      >是否可以自行攜帶飲料或酒類上船？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFour_terms"
                  class="collapse"
                  data-bs-parent="#terms"
                >
                  <div class="card-body">
                    每一位達法定飲酒年齡的賓客允許在每個航次攜帶一瓶不超過 750ml
                    的葡萄酒或香檳，在客艙內飲用不需收取開瓶費。其他如餐廳、酒吧等公共區域，每瓶將被收取15美元的開瓶費用(以船上公告為主，不另行通知)。
                    <br /><br />
                    至於烈酒或啤酒是禁止攜帶上船。所有的行李都會經過掃描，不符合規定的酒精性飲料產品將被移除並丟棄。液體及其他飲品需放置托運行李。在中途各停靠港購買的酒類，則無法在航程中享用，船上警衛將會在登船口的安檢處登記，並為您保管，請主動向安管人員索取物品保管單的存根聯，並於離船前至船上賓客服務櫃檯或安檢處領回。
                  </div>
                </div>
              </div>
            </div>
            <!--End terms -->

            <h3>行前準備</h3>
            <div id="booking" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#booking"
                      href="#collapseOne_booking"
                      >辦理登船報到手續需要準備什麼呢？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_booking"
                  class="collapse"
                  data-bs-parent="#booking"
                >
                  <div class="card-body">
                    電子船票(登船證)、護照、支付雜項費用的信用卡(或現金)、適當的旅遊證件。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#booking"
                      href="#collapseTwo_booking"
                      >我要帶那些衣物？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_booking"
                  class="collapse"
                  data-bs-parent="#booking"
                >
                  <div class="card-body">
                    由於每條航線航行地區的氣候不同，建議您在出發前先行查詢各停靠港口的氣候，用來做攜帶衣物的參考。在港口時，晚上可穿著便裝，通常穿輕鬆的長褲、毛衣、罩衫、開領衫即可。
                    <br />
                    ・在遊輪餐廳中則不准穿短褲、毛邊T恤、「破洞的」牛仔褲及赤足。<br />
                    ・正式之夜，女士請穿較為正式的裙子/洋裝或褲裝，而男士則著西裝。<br />
                    ・需穿著泳裝才可使用船上的泳池和按摩水療池。<br />
                    ・部份健身房內的健身器材，需穿著運動鞋，方可使用。<br />
                    ・如果需要浴袍，可要求您的船艙服務人員送至您的房內。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#booking"
                      href="#collapseThree_booking"
                      >船上有洗衣服務嗎？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_booking"
                  class="collapse"
                  data-bs-parent="#booking"
                >
                  <div class="card-body">
                    只要付少許費用，就能使用船上的送洗服務。所有衣物均可於 48
                    小時內歸還。船上也提供投幣式自助洗衣設備，在自助洗衣室裏面有代幣面板，需要先用房卡購買代幣之後，投到洗衣機或是烘乾機方能使用。洗衣機及烘乾機分別是3美元/每次，洗衣粉是1.5美元（相關費用均以船上公布為準）。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#booking"
                      href="#collapseFour_booking"
                      >遊輪上的電器使用<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFour_booking"
                  class="collapse"
                  data-bs-parent="#booking"
                >
                  <div class="card-body">
                    Pandora遊輪所有船隻的插座及電壓均跟台灣相同
                    110V/60Hz，插頭為 2孔或 3孔，不需要另外攜帶轉換插座。
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#booking"
                      href="#collapseFive_booking"
                      >攜帶行李是否有重量限制呢？<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseFive_booking"
                  class="collapse"
                  data-bs-parent="#booking"
                >
                  <div class="card-body">
                    沒有的唷！因此比起航空，更加方便了呢！
                  </div>
                </div>
              </div>
            </div>
            <!--End booking -->

            <!-- <h3>Transfers</h3>
            <div id="transfers" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#transfers"
                      href="#collapseOne_transfers"
                      >Anim pariatur cliche reprehenderit?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_transfers"
                  class="collapse"
                  data-bs-parent="#transfers"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#transfers"
                      href="#collapseTwo_transfers"
                      >Parsnip lotus root celery?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_transfers"
                  class="collapse"
                  data-bs-parent="#transfers"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#transfers"
                      href="#collapseThree_transfers"
                      >Beet greens peanut salad?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_transfers"
                  class="collapse"
                  data-bs-parent="#transfers"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
            </div> -->
            <!--End transfers -->

            <!-- <h3>Pricing</h3>
            <div id="pricing" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#pricing"
                      href="#collapseOne_pricing"
                      >Anim pariatur cliche reprehenderit?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_pricing"
                  class="collapse"
                  data-bs-parent="#pricing"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#pricing"
                      href="#collapseTwo_pricing"
                      >Parsnip lotus root celery?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_pricing"
                  class="collapse"
                  data-bs-parent="#pricing"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#pricing"
                      href="#collapseThree_pricing"
                      >Beet greens peanut salad?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_pricing"
                  class="collapse"
                  data-bs-parent="#pricing"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
            </div> -->
            <!--End pricing -->

            <!-- <h3>Privacy</h3>
            <div id="privacy" class="accordion_styled">
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#privacy"
                      href="#collapseOne_privacy"
                      >Anim pariatur cliche reprehenderit?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseOne_privacy"
                  class="collapse"
                  data-bs-parent="#privacy"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#privacy"
                      href="#collapseTwo_privacy"
                      >Parsnip lotus root celery?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseTwo_privacy"
                  class="collapse"
                  data-bs-parent="#privacy"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>
                    <a
                      class="accordion-toggle"
                      data-bs-toggle="collapse"
                      data-bs-parent="#privacy"
                      href="#collapseThree_privacy"
                      >Beet greens peanut salad?<i
                        class="indicator icon-plus float-end"
                      ></i
                    ></a>
                  </h4>
                </div>
                <div
                  id="collapseThree_privacy"
                  class="collapse"
                  data-bs-parent="#privacy"
                >
                  <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life
                    accusamus terry richardson ad squid. 3 wolf moon officia
                    aute, non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                    sunt aliqua put a bird on it squid single-origin coffee
                    nulla assumenda shoreditch et. Nihil anim keffiyeh
                    helvetica, craft beer labore wes anderson cred nesciunt
                    sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                    Leggings occaecat craft beer farm-to-table, raw denim
                    aesthetic synth nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
            </div> -->
            <!--End privacy -->
          </div>
          <!-- End col lg-9 -->
        </div>
        <!-- End row -->
      </div>
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
    <script src="/pandora/front-end/faq/js/jquery-3.6.0.min.js"></script>
    <script src="/pandora/front-end/faq/js/common_scripts_min.js"></script>
    <script src="/pandora/front-end/faq/js/functions.js"></script>

    <!-- Specific scripts -->
    <!-- Fixed sidebar -->
    <script src="/pandora/front-end/faq/js/theia-sticky-sidebar.js"></script>
    <script>
      jQuery("#sidebar").theiaStickySidebar({
        additionalMarginTop: 80,
      });
    </script>
    <script>
      $('#faq_box a[href^="#"]').click(function () {
        if (
          location.pathname.replace(/^\//, "") ==
            this.pathname.replace(/^\//, "") ||
          location.hostname == this.hostname
        ) {
          var target = $(this.hash);
          target = target.length
            ? target
            : $("[name=" + this.hash.slice(1) + "]");
          if (target.length) {
            $("html,body").animate(
              {
                scrollTop: target.offset().top - 115,
              },
              800
            );
            return false;
          }
        }
      });
    </script>
  </body>
</html>
