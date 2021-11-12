<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>22AcresProperty</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->

<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<style>
* {
	box-sizing: border-box
}

.mySlides {
	display: none
}

img {
	vertical-align: middle;
}
/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}
/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}
/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}
/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}
/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}
/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.dot:hover {
	background-color: #717171;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
</style>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<%@include file="hader.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="margin-left: 0px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
						<%
										String sName = request.getParameter("name");
						 %><h1><%=sName %></h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item"><a href="societyList.jsp">Society
										List</a></li>
								<li class="breadcrumb-item active">Society Feature</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Gallery</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<%
										String id = request.getParameter("id");

										Class.forName("com.mysql.jdbc.Driver");
										Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/22acres", "root", "root");
										String sql = "select * from society_gallery where society_id="+id;
										PreparedStatement preparedStatement = connection.prepareStatement(sql);
										ResultSet resultSet = preparedStatement.executeQuery();
										boolean flag = true;
										String active = "active";
										String blank = "";
										int size = resultSet.getFetchSize();
										%>
										<ol class="carousel-indicators">
											<%
											for (int i = 0; i < size; i++) {
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="<%=i%>" class="<%=flag ? active : blank%>"></li>
											<%
											flag = false;
											}
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="1"></li>
										</ol>
										<div class="carousel-inner">
											<%
											flag = true;
											while (resultSet.next()) {
											%>

											<div class="carousel-item <%=flag ? active : blank%>">
												<img class="d-block w-100"
													src="<%=resultSet.getString(3)%>" width="100px"
													alt="<%=resultSet.getString(2)%>">

											</div>
											<%
											flag = false;
											}
											%>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" role="button"
											data-slide="prev"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-left"></i>
										</span> <span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleIndicators" role="button"
											data-slide="next"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-right"></i>
										</span> <span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Amenities</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<%
										sql = "select * from society_amenities where society_id="+id;
										preparedStatement = connection.prepareStatement(sql);
										resultSet = preparedStatement.executeQuery();
										%>
										<ol class="carousel-indicators">
											<%
											for (int i = 0; i < size; i++) {
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="<%=i%>" class="<%=flag ? active : blank%>"></li>
											<%
											flag = false;
											}
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="1"></li>
										</ol>
										<div class="carousel-inner">
											<%
											flag = true;
											while (resultSet.next()) {
											%>

											<div class="carousel-item <%=flag ? active : blank%>">
												<img class="d-block w-100"
													src="<%=resultSet.getString(3)%>" width="100px"
													alt="<%=resultSet.getString(2)%>">

											</div>
											<%
											flag = false;
											}
											%>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" role="button"
											data-slide="prev"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-left"></i>
										</span> <span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleIndicators" role="button"
											data-slide="next"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-right"></i>
										</span> <span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Specifications</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<%
										sql = "select * from society_specifications where society_id="+id;
										preparedStatement = connection.prepareStatement(sql);
										resultSet = preparedStatement.executeQuery();
										%>
										<ol class="carousel-indicators">
											<%
											for (int i = 0; i < size; i++) {
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="<%=i%>" class="<%=flag ? active : blank%>"></li>
											<%
											flag = false;
											}
											%>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="1"></li>
										</ol>
										<div class="carousel-inner">
											<%
											flag = true;
											while (resultSet.next()) {
											%>

											<div class="carousel-item <%=flag ? active : blank%>">
												<img class="d-block w-100"
													src="<%=resultSet.getString(3)%>" width="100px"
													alt="<%=resultSet.getString(2)%>">

											</div>
											<%
											flag = false;
											}
											%>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" role="button"
											data-slide="prev"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-left"></i>
										</span> <span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleIndicators" role="button"
											data-slide="next"> <span
											class="carousel-control-custom-icon" aria-hidden="true">
												<i class="fas fa-chevron-right"></i>
										</span> <span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">For Housing Detail <a href="societyDetail.jsp?id=<%=id%>&name=<%=sName%>"> Click Here </a></h3>
								</div>
							</div>
						</div>
					</div>
			</section>
		</div>
		<footer class="main-footer"> </footer>
		<aside class="control-sidebar control-sidebar-dark"></aside>
	</div>

	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="plugins/jszip/jszip.min.js"></script>
	<script src="plugins/pdfmake/pdfmake.min.js"></script>
	<script src="plugins/pdfmake/vfs_fonts.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- Page specific script -->
</body>
</html>
