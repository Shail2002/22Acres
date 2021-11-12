<%
	session = request.getSession();
	String name=""; 
	if(null!=session.getAttribute("name")){
				name = (String)session.getAttribute("name");
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>

<nav class="main-header navbar navbar-expand navbar-dark" style="margin-left: 0px!important;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="societyList.jsp" class="nav-link">Home</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <%=name %>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  href="logout.jsp" role="button">
          <i class="fas fa-power-off"></i>
        </a>
      </li>
    </ul>
  </nav>