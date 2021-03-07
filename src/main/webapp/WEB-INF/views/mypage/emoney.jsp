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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
	<style>
		#currentEmoney {
			padding: 30px;
			border: 1px solid gray;
			color: #5F0080;
			text-align: center;
			margin-top: 30px;
		}
	</style>
	<script>
		$(document).ready(function() {
			var eDATE = document.getElementsByClassName('eDATE');
			for(var i=0; i<eDATE.length; i++) {
				var date = moment(eDATE[i].value).format("YY.MM.DD");
			    document.getElementsByClassName('inputDate')[i].innerText = date;
			}
		});
	</script>
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
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney" class="subNavMenuClicked">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">적립금 </span><span class="explanation-gray">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다. </span>
		</div>
		<div id="currentEmoney">
			현재 나의 적립금 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${currentEmoney}"/>원</b>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:150px">날짜</th>
				<th style="width:550px">내용</th>
				<th>금액</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>
						<span class="inputDate"></span>
						<input type="hidden" class="eDATE" value="${vo.eDATE}"/>
					</td>
					<td>${vo.eCONTENT}</td>
					<td>
						<c:if test="${vo.ePLUS=='0'}">
							<span style="color: gray;">- <fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.eMINUS}"/></span>
						</c:if>
						<c:if test="${vo.eMINUS=='0'}">
							<span style="color: 5F0080;font-weight: bold;">+ <fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.ePLUS}"/></span>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>