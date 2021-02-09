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
	<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script>
		function writeCheck() {
			var title = writeForm.title.value;
			var name = writeForm.name.value;
			var content = writeForm.content.value;
			
			if(title=="") {
				alert("제목을 입력하세요.");
				writeForm.title.focus();
			}
			else if(name=="") {
				alert("작성자를 입력하세요.");
				writeForm.name.focus();
			}
			else {
				writeForm.submit();
			}
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;고객센터</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/board/list" class="subNavMenuClicked">공지사항<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">자주하는 질문<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">1:1문의<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">대량주문 문의<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">상품 제안<span class="align-right">&gt;</span></a></li>
			<li><a href="${contextPath}/">에코포장 피드백<span class="align-right">&gt;</span></a></li>
		</ul>
	</div>
	<div class="section">
		<h4>공지작성</h4>
		<form name="writeForm" method="post" action="${contextPath}/board/write">
			<table class="write-table">
				<tr> 
					<td>제목</td>
					<td><input type="text" name="title" class="form-control" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>작성자</td>
					<td><input type="text" name="name" class="form-control" value="MarketKurly" maxlength="20"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td><textarea name="content" class="form-control" id="CKEDITOR"></textarea></td>
					<script type="text/javascript">
						CKEDITOR.replace("content", {
							uploadUrl:"${contextPath}/imageUpload",	//드래그 앤 드롭					
							filebrowserUploadUrl: "${contextPath}/imageUpload", //파일은 이 경로로 업로드
							height : 400
						});
					</script>
				</tr>
			</table>
			<p><br/></p>
			<input type="hidden" name="mid" value="admin"/>
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 290px" value="등록"/>
		</form>
	</div>
</div>
</body>
</html>