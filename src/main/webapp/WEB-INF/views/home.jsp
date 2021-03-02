<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<style>
		/* Make the image fully responsive */
		.carousel-inner img {
	    	width: 100%;
	    	height: 375px;
	    }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextPath}/resources/images/carousel1.JPG" >
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/images/carousel2.JPG" >
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/images/carousel3.JPG" >
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
