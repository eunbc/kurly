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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.goods-detail{
			margin:0 auto;
		}
		.goods-detail-top{
			width: 500px;
			height: 600px;
			float: left;
			padding: 50px;
		}
		.goods-detail-bottom{
			text-align: center;
		}
		.goods-detail-table{
			width: 500px;
			margin-top: 100px;
		}
		.goods-detail-table tr{
			border-bottom: 1px solid #F7F7F7;
		}
		.goods-detail-table tr td:first-child{
			width: 150px;
			padding: 10px;
		}
	</style>
	<script>
		function updateCheck(idx) {
			var ans = confirm("수정하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/admin/goodsUpdate?gIDX="+idx+"&pag="+${pag};			
		}
		
		function deleteCheck(idx) {
			var ans = confirm("삭제하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/admin/goodsDelete?gIDX="+idx+"&pag="+${pag};			
		}
	</script>
	
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품 상세</h3>
	</div>
	<div class="goods-detail">
		<div class="goods-detail-top">
	        <img src="${contextPath}/resources/goods/${vo.gIMAGE}" width="400px"/><br/><br/>
		</div>
		
		<div class="goods-detail-top"> 
			<h3>${vo.gNAME}</h3>
			<span class="explanation-gray">${vo.gSHORT}</span>
			<table class="goods-detail-table" >
				<tr>
					<td>가격</td>
					<td><fmt:formatNumber value="${vo.gPRICE}" type="currency"/>원</td>
				</tr>
				<tr>
					<td>할인율</td>
					<td><fmt:formatNumber value="${vo.gDISCOUNT*0.01}" type="percent"/></td>
				</tr>
				<tr>
					<td>재고수량</td>
					<td>${vo.gSTOCK}</td>
				</tr>
				<tr>
					<td>판매량</td>
					<td>${vo.gSALES}</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href='${contextPath}/admin/goodsOption?gIDX=${vo.gIDX}'>옵션관리></a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div style="text-align: right">
		<input type="button" value="수정" onclick="updateCheck(${vo.gIDX})" class="button-outline-small"/>
		<input type="button" value="삭제" onclick="deleteCheck(${vo.gIDX})" class="button-outline-small"/>
		<input type="button" value="목록" onclick="location.href='${contextPath}/admin/goodsList?pag=${pag}'" class="button-small"/>
	</div>
	
	<hr/>
    <br/>
	<div class="goods-detail-bottom">
	        <p>${fn:replace(vo.gDETAIL,newLine,"<br/>")}<br/></p>
	</div>
    <hr/>

</div>
</body>
</html>