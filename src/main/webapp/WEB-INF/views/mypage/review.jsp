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
<%@ include file="/WEB-INF/views/include/mypage-box.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order" >주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review" class="subNavMenuClicked">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">상품 후기 </span>
		</div>
		내가 작성한 후기 목록
		<table class="list-table">
			<tr> 
				<th style="width:250px">제목</th>
				<th style="width:250px">상품명</th>
				<th style="width:70px">작성일</th>
				<th style="width:70px">조회</th>
				<th style="width:70px">도움</th>
			</tr>
  			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="${contextPath}/review/view?rIDX=${vo.rIDX}" class="title-decoration-none">${vo.rTITLE}</a></td>
					<td style="text-align: center;">${vo.gNAME}</td>
					<td>${fn:substring(vo.rWDATE,0,10)}</td>
					<td>${vo.rVIEW}</td>
					<td>${vo.rHELP}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>