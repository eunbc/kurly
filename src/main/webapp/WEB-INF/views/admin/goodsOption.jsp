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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script>
		$(function() {
		    $("#addGoodsOption").click(function() {
		    	if($("#goNAME").val().trim() == "") {
		    		alert("상품옵션명을 입력하세요");
		    		$("#goNAME").focus();
		    		return false;
		    	} else if($("#goPRICE").val().trim() == "") {
		    		alert("상품옵션가격을 입력하세요");
		    		$("#goPRICE").focus();
		    		return false;
				} else {
					var query = {
							gIDX : ${gIDX},
							goNAME : $("#goNAME").val(),
							goPRICE : $("#goPRICE").val()
					};
					$.ajax({
						url  : "${contextPath}/admin/addGoodsOption", 
						type : "post",
						data : query,
						success : function(data) {
							location.reload();
						},
						error : function(data) {
							alert("전송 오류");
						}
					});
				}
		    });
		});	
		
		function deleteGoodsOption(goIDX) {
			var query = {
					goIDX : goIDX
			}
			
			$.ajax({
				url : "${contextPath}/admin/deleteGoodsOption",
				type : "post",
				data : query,
				success : function(data) {
					location.reload();
				},
				error : function(data) {
					alert("전송오류");
				}
			});
		}
	</script>
	<style>
		.add-table{
			height:120px;
			background-color: #F7F7F7;
			padding: 30px 40px 40px 200px;
		}
		.icon{
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품 옵션 관리</h3>
	</div>
	<div class="admin-content">
		<div class="add-table">
			상품옵션명 <input type="text" name="goNAME" id="goNAME" maxlength="50" size="20" class="input-box" placeholder="상품옵션명"/>
			상품옵션가격 <input type="text" name="goPRICE" id="goPRICE" maxlength="20" size="20" class="input-box" placeholder="상품옵션가격"/>
			<input type="button" class="button-small" id="addGoodsOption" value="등록"/>
		</div>
		<p><br/></p>
		<table class="admin-list-table" style="width:800px">
			<tr> 
				<th style="width:400px">상품옵션명</th>
				<th>상품옵션가격</th>
				<th style="width:140x">삭제</th>
			</tr>
			<c:if test="${empty vos}">
				<tr>
					<td colspan="3">등록된 옵션이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty vos}">
	 	 		<c:forEach var="vo" items="${vos}">
					<tr>
						<td>${vo.goNAME}</td>
						<td style="text-align: center;">
							<fmt:formatNumber value="${vo.goPRICE}" pattern="#,###" />
						</td>
						<td><a href="javascript:deleteGoodsOption('${vo.goIDX}');" class="icon"><i class="xi-close"></i></a></td>
					</tr>
				</c:forEach> 
			</c:if>
		</table>
		
	</div>
</div>
</body>
</html>