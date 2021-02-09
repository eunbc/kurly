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
		#content {margin:0 auto; width: 320px}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div id="content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">비밀번호 찾기</h4>
		<div>이름 <input type="text" name="name" class="form-control" /></div>
		<p><br/></p>
		<div>아이디 <input type="text" name="mid" class="form-control" /></div>
		<p><br/></p>
		<div>이메일 <input type="text" name="email" class="form-control"/></div>
		<p><br/></p>
		<div><input type="button" value="비밀번호 찾기" class="button" style="width:320px; height: 50px;"/></div>
	</div>
</div>
</body>
</html>