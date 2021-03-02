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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<style>
		.content {margin:0 auto; width: 320px}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">아이디 찾기</h4>
			<p><br/></p>
			<p style="text-align: center;">
				${mNAME}님으로 검색된 아이디입니다. <br/>
				${id_found}
			</p>
			<hr/>
			<input type="button" value="로그인" class="button" onclick="location.href='${contextPath}/member/login'" style="width:320px; height: 50px;"/>
			<input type="button" value="다시 찾기" class="button-outline" onclick="location.href='${contextPath}/member/find_id'" style="width:320px; height: 50px;"/>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>