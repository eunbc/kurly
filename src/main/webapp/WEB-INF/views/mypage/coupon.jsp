<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage-box.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order">주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon" class="subNavMenuClicked">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">쿠폰 </span>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:400px">쿠폰명</th>
				<th style="width:300px;">사용가능기간</th>
				<th>사용여부</th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.cpNAME}</td>
					<td style="text-align: center;">${fn:substring(vo.cpSTARTDATE,0,10)} ~ ${fn:substring(vo.cpENDDATE,0,10)}</td>
					<td>
						<c:if test="${vo.cpUSE=='Y'}">
							사용완료
						</c:if>
						<c:if test="${vo.cpUSE=='N'}">
							미사용
						</c:if>
					<td>
				</tr>
			</c:forEach> 
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>