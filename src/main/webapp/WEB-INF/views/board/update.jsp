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
			var bTITLE = writeForm.bTITLE.value;
			var bNAME = writeForm.bNAME.value;
			
			if(bTITLE=="") {
				alert("제목을 입력하세요.");
				writeForm.bTITLE.focus();
			}
			else if(bNAME=="") {
				alert("작성자를 입력하세요.");
				writeForm.bNAME.focus();
			}
			else {
	    		writeForm.originalCONTENT.value = document.getElementById("originalCONTENT").innerHTML;
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
			<li><a href="${contextPath}/board/list" class="subNavMenuClicked">공지사항</a></li>
			<li><a href="${contextPath}/faq/list">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<h4>공지수정</h4>
		<form name="writeForm" method="post" action="${contextPath}/board/update">
			<table class="write-table">
				<tr> 
					<td>제목</td>
					<td><input type="text" name="bTITLE" value="${vo.bTITLE}" class="form-control" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>작성자</td>
					<td><input type="text" name="bNAME" value="${vo.bNAME}" class="form-control" value="MarketKurly" maxlength="20"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td><textarea name="bCONTENT" class="form-control" id="CKEDITOR">${vo.bCONTENT}</textarea></td>
					<!-- 변경된 content -->
					<script type="text/javascript">
						CKEDITOR.replace("bCONTENT", {
							uploadUrl:"${contextPath}/imageUpload",				
							filebrowserUploadUrl: "${contextPath}/imageUpload",
							height : 400
						});
					</script>
				</tr>
			</table>
			<p><br/></p>
			<input type="hidden" name="bIDX" value="${vo.bIDX}"/>
			<input type="hidden" name="mMID" value="${smid}"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="originalCONTENT"/>
			<div id="originalCONTENT" style="display:none;">${vo.bCONTENT}</div>
			<!-- 기존의 content -->
			
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 290px" value="수정"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>