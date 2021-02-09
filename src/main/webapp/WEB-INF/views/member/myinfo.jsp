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
	<style>
		.align-right {align:right;}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/board/list" class="subNavMenuClicked">주문 내역<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">배송지 관리<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">늘 사는 것<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">상품 후기<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">적립금<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">쿠폰<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">개인 정보 수정<span class="align-right">&gt;</span></a></li>
		</ul>
	</div>
	<div class="section">
		<h4>주문 내역 <span class="explanation-gray">지난 3년간의 주문 내역 조회가 가능합니다 </span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="button-outline-join" onclick="location.href='${contextPath}/board/write'" value="공지작성"/></h4>
		<table class="list-table">
			<tr> 
				<th style="width:50px">번호</th>
				<th style="width:550px">제목</th>
				<th style="width:70px">작성자</th>
				<th style="width:70px">작성일</th>
				<th style="width:50px">조회</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrNo}</td>
					<td><a href="${contextPath}/board/view?board_idx=${vo.board_idx}&pag=${p.pag}" class="title-decoration-none">${vo.title}</a></td>
					<td>${vo.name}</td>
					<td>${fn:substring(vo.wdate,0,10)}</td>
					<td>${vo.viewCnt}</td>
				</tr>
				<c:set var="curScrNo" value="${curScrNo-1}"/>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>