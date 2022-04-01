<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <!-- header -->
<!DOCTYPE html>
<html>
  <head>
    <title><tiles:insertAttribute name="title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/adminUrl/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--  --> 
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/adminUrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/adminUrl/css/style1.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
  	<tiles:insertAttribute name="header" />
  	
<!-- /.header -->
    <div class="page-content">
    	<div class="row">
		  
		  <tiles:insertAttribute name="leftbar"/>
		  
		  <tiles:insertAttribute name="body"/>
		  <!-- /.col-md-10 -->
		</div><!-- /.row -->
    </div><!-- /.page-content -->

    <!-- Footer -->
      <tiles:insertAttribute name="footer" />

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/adminUrl/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/js/custom.js"></script>
  </body>
</html>
    <!-- /.footer -->