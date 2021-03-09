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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<script>
		function refund(mMID,oIDX,oEMONEY) {
			var query = {
					mMID : mMID,
					oIDX : oIDX,
					oEMONEY : oEMONEY
			}
	      	$.ajax({
	       		url : "${contextPath}/admin/orderRefund",
	       		type : "post",
	       		data : query,
	       		success : function(){
					location.reload();
	       		}
	      	});
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>환불 요청</h3>
	</div>
	<div class="admin-content">
		<table class="admin-list-table">
			<tr> 
				<th style="width:200px">주문번호</th>
				<th style="width:200x">주문일시</th>
				<th style="width:120px">주문금액</th>
				<th style="width:100px">결제수단</th>
				<th style="width:150px"></th>
			</tr>
 			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="${contextPath}/admin/orderDetail?oNVOICE=${vo.oNVOICE}" class="title-decoration-none">${vo.oNVOICE}</a></td>
					<td style="text-align:center;">${vo.oDATE}</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.oAMOUNT}" /></td>
					<td>${vo.oPAYMENT}</td>
					<td>
						<input type="button" class="btn btn-danger" onclick="refund('${vo.mMID}',${vo.oIDX},${vo.oEMONEY})" value="환불처리"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>