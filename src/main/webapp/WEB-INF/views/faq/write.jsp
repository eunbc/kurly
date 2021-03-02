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
			var fCATEGORY = writeForm.fCATEGORY.value;
			var fTITLE = writeForm.fTITLE.value;
			var fCONTENT = writeForm.fCONTENT.value;
			
			if(fCATEGORY=="") {
				alert("분류를 선택하세요.");
				return false;
			}
			else if(fTITLE=="") {
				alert("제목을 입력하세요.");
				writeForm.fTITLE.focus();
				return false;
			}
			else if(fCONTENT=="") {
				alert("내용을 입력하세요.");
				writeForm.fCONTENT.focus();
				return false;
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
			<li><a href="${contextPath}/board/list">공지사항</a></li>
			<li><a href="${contextPath}/faq/list"  class="subNavMenuClicked">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<div class="section-title">자주하는 질문 작성</div>
		<form name="writeForm" method="post" action="${contextPath}/faq/write">
			<table class="write-table">
				<tr> 
					<td>분류</td>
					<td>
						<select class="form-control" name="fCATEGORY">
						    <option value="">선택</option>
						    <option value="회원문의">회원문의</option>
						    <option value="주문/결제">주문/결제</option>
						    <option value="취소/교환/반품">취소/교환/반품</option>
						    <option value="배송문의">배송문의</option>
						    <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
						</select>
					</td>
				</tr>
				<tr> 
					<td>제목</td>
					<td><input type="text" name="fTITLE" class="form-control" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td><textarea name="fCONTENT" rows="10" class="form-control"></textarea></td>
				</tr>
			</table>
			<p><br/></p>
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 290px" value="등록"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>