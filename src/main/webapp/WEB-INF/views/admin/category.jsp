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
		    $("#addCategory").click(function() {
		    	if($("#cCODE").val().trim() == "") {
		    		alert("대분류 코드를 입력하세요");
		    		$("#cCODE").focus();
		    		return false;
		    	} else if($("#cNAME").val().trim() == "") {
		    		alert("대분류 이름을 입력하세요");
		    		$("#cNAME").focus();
		    		return false;
				} else {
					var query = {
							cCODE : $("#cCODE").val(),
							cNAME : $("#cNAME").val()
					};
					$.ajax({
						url  : "${contextPath}/admin/addCategory", 
						type : "post",
						data : query,
						success : function(data) {
							if(data==0) {
								alert("이미 존재하는 대분류 코드입니다.다른 코드를 입력해주세요!");
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
		    
		    $("#updateBtn").click(function() {
		    	$("#updateArea").append("<input type='text' name='cNAME' class='input-box'/>");
		    	$("#updateArea").append("<input type='button' value='확인' class='button-small'/>");
		    });
		});	
		function deleteCategory(cCODE) {
			var query = {
					cCODE : cCODE
			}
			
			$.ajax({
				url : "${contextPath}/admin/deleteCategory",
				type : "get",
				data : query,
				success : function(data) {
					if(data ==1) {
						location.reload();
					}
				},
				error : function(data) {
					alert("하위 중분류가 있어 삭제가 불가능합니다.\n중분류 정리 후 다시 시도하세요.");
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
		<h3>대분류 관리</h3>
	</div>
	<div class="admin-content">
		<div class="add-table">
			대분류 코드 <input type="text" name="cCODE" id="cCODE" maxlength="3" size="20" class="input-box" placeholder="대분류 코드"/>
			대분류 이름 <input type="text" name="cNAME" id="cNAME" maxlength="20" size="20" class="input-box" placeholder="대분류 이름"/>
			<input type="button" class="button-small" id="addCategory" value="등록"/>
		</div>
		<p><br/></p>
		<table class="admin-list-table" style="width:800px">
			<tr> 
				<th style="width:100px">대분류 코드</th>
				<th>대분류 이름</th>
				<th style="width:70x">수정</th>
				<th style="width:70x">삭제</th>
			</tr>
	 		<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.cCODE}</td>
					<td style="text-align: center;">
						<div id="updateArea">${vo.cNAME}</div>
					</td>
					<td><a id="updateBtn" class="icon"><i class="xi-pen"></i></a></td>
					<td><a href="javascript:deleteCategory('${vo.cCODE}');" class="icon"><i class="xi-close"></i></a></td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</div>
</body>
</html>