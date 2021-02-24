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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script>

		$(function() {
		    $("#addSubcategory").click(function() {
				if($("#category").val()=="") {
					alert("대분류를 선택하세요");
					return false;
				} else if($("#scCODE").val().trim() == "") {
		    		alert("중분류 코드를 입력하세요");
		    		$("#scCODE").focus();
		    		return false;
		    	} else if($("#scNAME").val().trim() == "") {
		    		alert("중분류 이름을 입력하세요");
		    		$("#scNAME").focus();
		    		return false;
		    	} else {
					var query = {
							cCODE : $("#category").val(),
							scCODE : $("#scCODE").val(),
							scNAME : $("#scNAME").val()
					};
					$.ajax({
						url  : "${contextPath}/admin/addSubcategory", 
						type : "post",
						data : query,
						success : function(data) {
							if(data==0) {
								alert("이미 존재하는 중분류 코드입니다. 다른 코드를 입력해주세요!");
							}else {
								location.reload();
							}
						},
						error : function(data) {
							alert("전송 오류");
						}
					});
	
				}
		    });
		});	
		function selectCategory() {
			var category = addForm.category.value;
			location.href='${contextPath}/admin/subcategory?cCODE='+category;
		}
		
		function deleteSubcategory(cCODE,scCODE) {
			var query = {
					cCODE : cCODE,
					scCODE : scCODE
			}
			$.ajax({
				url : "${contextPath}/admin/deleteSubcategory",
				type : "get",
				data : query,
				success : function(data) {
					if(data ==1) {
						location.reload();
					}
				},
				error : function(data) {
					alert("하위상품이 있어 삭제가 불가능합니다.\n하위상품 정리 후 다시 시도하세요.");
				}
			});
		}
	</script>
	<style>
		.add-table{
			height:120px;
			background-color: #F7F7F7;
			padding: 30px 30px 40px 200px;
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
		<h3>중분류 관리</h3>
	</div>
	<div class="admin-content">
		<div class="add-table">
			<form name="addForm">
				대분류 선택 
				<select name="category" class="input-box" id="category" onchange="selectCategory()">
					<option value="">선택하세요</option>
					<c:forEach var="cVo" items="${cVos}">
						<option value="${cVo.cCODE}" <c:if test="${cCODE==cVo.cCODE}">selected</c:if>>[${cVo.cCODE}]${cVo.cNAME}</option>
					</c:forEach>
				</select>
				<br/>
				중분류 코드 <input type="text" name="scCODE" id="scCODE" maxlength="3" size="20" class="input-box" placeholder="중분류 코드"/>
				중분류 이름 <input type="text" name="scNAME" id="scNAME" maxlength="20" size="20" class="input-box" placeholder="중분류 이름"/>
				<input type="button" class="button-small" id="addSubcategory" value="등록"/>
			</form>
		</div>
		<p><br/></p>
		<p style="text-align: center; font-size: 20px">
			<c:if test="${!empty cCODE}">
				[${cCODE}] ${cNAME}
			</c:if>
			<c:if test="${empty cCODE}">
				상단에서 대분류를 선택하세요
			</c:if>
		</p>
		<table class="admin-list-table" style="width:800px">
			<tr> 
				<th style="width:100px">중분류 코드</th>
				<th>중분류 이름</th>
				<th style="width:140x">삭제</th>
			</tr>
 	 		<c:forEach var="scVo" items="${scVos}">
				<tr>
					<td>${scVo.scCODE}</td>
					<td style="text-align: center;">${scVo.scNAME}</td>
					<td><a href="javascript:deleteSubcategory('${scVo.cCODE}','${scVo.scCODE}');" class="icon"><i class="xi-close"></i></a></td>
				</tr>
			</c:forEach>
 		</table>
	</div>
</div>
</body>
</html>