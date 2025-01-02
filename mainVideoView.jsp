<%@page import="aiwa.entity.Main"%>
<%@page import="aiwa.model.MainModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
html, body {
  		
  		margin:0;
  		padding:0;
  		height:100%;
	  }
	  .video-container{
	  	position: absolute;
	  	top:0;
	  	left:0;
	  	width:100%;
	  	height:100%;
	  	overflow:hidden;
	  }
	  .video-container iframe{
	  	position:absolute;
	  	top:0;
	  	left:0;
	  	width:100%;
	  	height:100%;
	  	border:none;
	  }
	  
</style>


<title>Videos View</title>
<%
String mainid = request.getParameter("mainid");
MainModel mm = new MainModel();
Main m = mm.findById(getServletContext(), Integer.parseInt(mainid));
%>
</head>
<body>

<div class="container mb-5">

	
	<div class="video-container">
	<iframe  src="https://www.youtube.com/embed/<%= m.getVideo() %>?autoplay=1&controls=1&loop=1" title="YouTube video pla" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allow="autuoplay; fullscreen"></iframe>
	</div>
	</div>
	

</body>
</html>