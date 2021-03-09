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
		.order-content{
			margin: 50px 0px;
			width: 100%;
		}
		.order-content > .title{
			border-bottom: 1px solid black;
			font-weight: bold;
			font-size: 15px;
			padding: 10px;
		}
		
		#table {display: table; width: 100%;}
		.row {display: table-row; width: 100%;}
		.cell {display: table-cell; padding: 10px; border-bottom: 1px solid #DDD;}
		.col1 {width: 30%;text-align: center;}
		.col2 {width: 70%;}
		.section {
			margin-left: 100px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="section">
		<div>
			<span class="section-title">주문 내역 상세</span>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:130px">사진</th>
				<th style="width:500px">상품</th>
				<th style="width:70px">가격</th>
				<th style="width:70px">수량</th>
				<th></th>
			</tr>
 	 		<c:forEach var="vo" items="${vos}">
				<tr>
					<td><img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="80px"/></td>
					<td style="text-align: center;">
						<c:if test="${vo.goIDX!=0}">
							<a href="${contextPath}/goods/goodsDetail?gIDX=${vo.gIDX}" class="title-decoration-none">${vo.goNAME}</a>						
						</c:if>
						<c:if test="${vo.goIDX==0}">
							<a href="${contextPath}/goods/goodsDetail?gIDX=${vo.gIDX}" class="title-decoration-none">${vo.gNAME}</a>
						</c:if>					
					</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.gPRICE}"/>원</td>
					<td>${vo.odQTY}</td>
					<td>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<br>
		<div class="order-content">
			<div class="title">결제 정보</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">상품금액</span>
					<span class="cell col2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oVo.oAMOUNT}"/>원</span>
				</div>
				<div class="row">
					<span class="cell col1">적립금 사용</span>
					<span class="cell col2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oVo.oEMONEY}"/>원</span>
				</div>
				<div class="row">
					<span class="cell col1">쿠폰 사용</span>
					<span class="cell col2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oVo.cpPRICE}"/>원</span>
				</div>
				<div class="row">
					<span class="cell col1">결제금액</span>
					<span class="cell col2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${oVo.oAMOUNT-oVo.oEMONEY-oVo.cpPRICE}"/>원</span>
				</div>
				<div class="row">
					<span class="cell col1">결제방법</span>
					<span class="cell col2">${oVo.oPAYMENT}</span>
				</div>
			</div>
		</div>
		
		<div class="order-content">
			<div class="title">주문자 정보</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">주문번호</span>
					<span class="cell col2">${oVo.oNVOICE}</span>
				</div>
				<div class="row">
					<span class="cell col1">주문자</span>
					<span class="cell col2">${oVo.oNAME}</span>
				</div>
				<div class="row">
					<span class="cell col1">휴대폰</span>
					<span class="cell col2">${oVo.oPHONE}</span>
				</div>
				<div class="row">
					<span class="cell col1">주문일시</span>
					<span class="cell col2">${oVo.oDATE}</span>
				</div>
			</div>
		</div>
		
		<div class="order-content">
			<div class="title">배송 정보</div>
			<div class="table">
				<div class="row">
					<span class="cell col1">배송지</span>
					<span class="cell col2" id="address">${fn:replace(oVo.oADDRESS,'@',' ')}</span>
				</div>
			</div>
		</div>
		
	</div>
</div>
</body>
</html>