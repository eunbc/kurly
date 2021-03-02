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
		.cart{
			float: left;
		}
		.cart-price{
			float: right;
			width: 250px;
			background-color: #f7f7f7;
			
		}
		.cart-price div{
			border: 1px solid black;
		}
		.cart-list {
			width: 800px;
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			margin-right: 0px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>장바구니</h3>
	</div>
	<div style="text-align: left;">
		<input type="button" class="button-outline-small wishselectDelete_btn" value="선택항목 삭제"/>
	</div>
	<table class="cart cart-list">
		<tr> 
			<th style="width:50px"><input type="checkbox" id="wishcheckAll"/></th>
			<th style="width:100px"></th>
			<th style="width:400px">상품정보</th>
			<th style="width:150px">수량</th>
			<th style="width:70px">가격</th>
			<th style="width:70px"></th>
		</tr>
		<c:forEach var="vo" items="${vos}">
		<tr>
			<td><input type="checkbox" class="wishChkbox" data-wIDX="${vo.cIDX}" /></td>
			<td>
		        <img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="100px"/>
			</td>
			<td style="text-align: left;">
				<div style="font-size: medium;">${vo.gNAME}</div>
			</td>
			<td>
				<button type="button" class="plus"><i class="xi-plus"></i></button>
				<input type="text" class="numBox" min="1" max="${vo.gSTOCK}" value="0" readonly="readonly"/>
				<button type="button" class="minus"><i class="xi-minus"></i></button>
			</td>
			<td>
				<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}"/>원</div>
			</td>
			<td><a href=''><i class='xi-close'></i></a></td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="cart cart-price">
		<div>
			배송지<br/>충북 청주시 흥덕구
			<input type="button" class="button-outline-small" value="배송지 변경">
		</div>
		<div>
			<p>상품금액</p>
			<p>상품할인금액</p>
			<p>배송비</p>
		</div>
		<div>
			결제 예정금액 42550원
		</div>
		<input type="button" class="button" value="주문하기">
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>