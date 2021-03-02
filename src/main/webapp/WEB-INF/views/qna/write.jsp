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
	<script>
		function writeCheck() {
			
			var qTITLE = writeForm.qTITLE.value;
			var qCONTENT = writeForm.qCONTENT.value;
			
			if(qTITLE=="") {
				alert("제목을 입력하세요.");
				writeForm.qTITLE.focus();
				return false;
			}
			else if(qCONTENT=="") {
				alert("내용을 입력하세요.");
				writeForm.qCONTENT.focus();
				return false;
			}
			else {
		        var check = $('input:checkbox[id="qSECRETchkbox"]').is(':checked');
		    	if(!check) {
		            $('#qSECRET').val('N');
		    	}
		    	else if(check){
		            $('#qSECRET').val("Y");
		    	}
				writeForm.submit();
			}
		}
	</script>
	<style>
		.qna-section{
			width: 1000px;
			margin: 0 auto;
		}
		.qna-section-title{
			font-size: 20px;
		}
		.qna-write-table {
			width: 1000px;
			border-top: 2px solid black;
			margin-top: 37px;
			font-size: 13px;
		}
		.qna-write-table tr td{
			padding: 10px 10px 10px 20px;
			border-bottom: 1px solid #F6F6F6;
		}
		.qna-write-table tr td:first-child {
			width: 120px;
			text-align: left;
			font-weight: 400;		
			vertical-align: middle;
			background-color: #F7F5F8;
		}
		
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="qna-section">
		<div class="qna-section-title">PRODUCT Q&A</div>
		<div>
			상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
		</div>
		<form name="writeForm" method="post" action="${contextPath}/qna/write">
			<table class="qna-write-table">
				<tr> 
					<td>작성자</td>
					<td><input type="text" name="qNAME" value="${sname}" readonly="readonly" class="input-box" maxlength="100"/></td>
				</tr>
				<tr> 
					<td>비밀글</td>
					<td>
						<input type="checkbox" id="qSECRETchkbox"/>
						<input type="hidden" name="qSECRET" id="qSECRET"/>
					</td>
				</tr>
				<tr> 
					<td>제목</td>
					<td><input type="text" name="qTITLE" class="form-control" maxlength="50"/></td>
				</tr>
				<tr> 
					<td>내용</td>
					<td><textarea name="qCONTENT" rows="10" class="form-control"></textarea></td>
				</tr>
			</table>
			<p><br/></p>
			<input type="hidden" name="mMID" value="${smid}"/>
			<input type="hidden" name="gIDX" value="${gIDX}"/>
			<input type="button" onclick="writeCheck()" class="button" style="margin-left: 390px" value="등록"/>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>