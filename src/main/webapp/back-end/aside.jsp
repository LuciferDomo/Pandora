<%@ page pageEncoding="UTF-8"%>

<aside id="sidebar" class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="#" class="brand-link">
    <img
      src="<%=request.getContextPath()%>/images/LOGo.png"
      alt="PANDORA Logo"
      class="brand-image img-circle elevation-3"
      style="opacity: 0.8"
    />
    <pre></pre>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
                        <img src="<%=request.getContextPath()%>/EMPImageServlet?action=usesrImage"  name="action"  class="img-circle elevation-2" alt="User Image" />
                    </div>
                    <div class="info">
                          <input name="Userlogin" type="hidden">
                         <a href="#" class="d-block">${loginUser.englishFirstName}&nbsp${loginUser.englishLastName}</a>
                      
                    </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul
        class="nav nav-pills nav-sidebar flex-column"
        data-widget="treeview"
        role="menu"
        data-accordion="false"
      >
        <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fa-solid fa-briefcase"></i>
            <p type="">
              員工資料
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/emp/EMP_InfoAll.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>員工資料表</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=packageADD" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>新增員工</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="" class="nav-link">
            <i class="fa-solid fa-address-card"></i>
            <p>
              會員管理
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/member/MemberAllList.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>會員資料管理</p>
              </a>
            </li>
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fa-solid fa-ship"></i>
            <p>行程管理<i class="right fas fa-angle-left"></i></p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=getAllPackage" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>行程資訊管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/ship/ships.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>郵輪管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/cruiseline/cruiseline.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>航線管理</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/port/port.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>停靠點管理</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a  class="nav-link">
            <i class="fa-solid fa-comments"></i>
            <p>
              聊天室管理
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/customerService/customerService.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>
                  客服聊天室
                </p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fa-solid fa-list"></i>
            <p>討論區管理<i class="right fas fa-angle-left"></i></p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/back-end/forum/forumReason.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>檢舉管理</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
