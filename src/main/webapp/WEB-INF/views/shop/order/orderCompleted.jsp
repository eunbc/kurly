<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<style>
		.order-content-default{
			width: 900px;
			margin: 0 auto;
			padding: 50px 0 200px 0;
		}
		.order-content{
			margin-bottom: 50px;
			width: 100%;
		}
		.order-content > .title{
			text-align:center;
			border: 1px solid black;
			border-radius: 10px;
			font-size: 20px;
			color:#5F0080;
			padding: 30px;
			
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="order-content-default">
	<div class="view-title">
		<h3>주문이 완료되었습니다</h3>
	</div>
	
	<div class="order-content">
		<div class="title">주문번호 ${oNVOICE}</div>
	</div>
	
	<div style="text-align: center">컬리를 이용해주셔서 감사합니다!</div>
	<br>
	
	<div style="text-align: center;"><input type="button" class="button" onclick="location.href='${contextPath}/h'" value="쇼핑 계속하기"/></div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>