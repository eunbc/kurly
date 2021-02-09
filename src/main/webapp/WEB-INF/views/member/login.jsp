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
	<style type="text/css">
		#content{margin: 0 auto; width: 320px;}
		tr, td {padding: 7px;}
		table {margin: 0 auto;}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div id="content">
		<p><br/></p>
		<h4 style="text-align: center;font-weight: 900;">로그인</h4>
		<p><br/></p>
		<form>
			<table>
				<tr>
					<td><input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력해주세요"/></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요"/></td>
				</tr>
				<tr>
					<td>
						<span id="rememberId"><input type="checkbox" id="rememberId" name="rememberId" ${checked}/>아이디 기억하기</span>
						<div id="login_find"><a href="${contextPath}/member/find_id">아이디 찾기 </a> | <a href="${contextPath}/member/find_pwd">비밀번호 찾기</a></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" class="button" style="width:320px" value="로그인"/>
						<input type="button" class="button-outline" style="width:320px" value="회원가입"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>