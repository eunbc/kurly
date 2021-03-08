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
	<style>
		#btn-Inquiry{
			color: #5F0080;
			border-radius: 0;
			font-size: 13px;
			width: 108px;
			margin-top: 4px;
		}
		#btn-Confirm{
			background-color: #5F0080;
			color: white;
			border-radius: 0;
			font-size: 13px;
			width: 108px;
			margin-top: 4px;
		}
		#btn-Inquiry:hover{
			background-color: white;
		}
		#btn-Confirm{
			background-color: #5F0080;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage-box.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;마이컬리</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/mypage/order" class="subNavMenuClicked">주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
			<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
			<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
			<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
			<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">주문내역 </span><span class="explanation-gray">주문번호를 클릭하면 주문 내역 상세 조회가 가능합니다. </span>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:130px">주문일자</th>
				<th style="width:500px">주문번호</th>
				<th style="width:100px">구매금액</th>
				<th style="width:100px">주문상태</th>
				<th>문의</th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${fn:substring(vo.oDATE,0,16)}</td>
					<td style="text-align: center;"><a href="${contextPath}/mypage/orderDetail?oNVOICE=${vo.oNVOICE}" class="title-decoration-none">${vo.oNVOICE}</a></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.oAMOUNT}"/>원</td>
					<td>${vo.oSTATUS}</td>
					<td>
						<input type="button" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/inquiry/write?oNVOICE=${vo.oNVOICE}'" value="1:1문의" id="btn-Inquiry"/>
						<c:if test="${vo.oSTATUS==1}">
							<input type="button" class="btn btn-outline-secondary" value="구매확정" id="btn-Confirm"/>
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