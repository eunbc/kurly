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
		$(document).ready(function() {
			$('#insertBtn').hide(); 
			
			$('#updateBtn').click(function(){
				$('#insertBtn').show(); 
				$('#updateBtn').hide(); 
				$('#irCONTENT').removeAttr('readonly');				
			});
			
			$('#qnaPrivateByAdmin').click(function(){
				var query = {
						qIDX : ${vo.qIDX}
				}
				
				$.ajax({
					url : "${contextPath}/admin/qnaPrivateByAdmin",
					type : "post",
					data : query,
					success : function(data) {
						alert("비공개 처리되었습니다.");
						location.reload();
					}
				});
			});
		});
		function qnaReply() {
			var qIDX = ${vo.qIDX};
			var gIDX = replyForm.gIDX.value;
			var qCONTENT = replyForm.qCONTENT.value;
			var qNAME = replyForm.qNAME.value;
			var qTITLE = replyForm.qTITLE.value;
			var qSECRET = replyForm.qSECRET.value;
			var qREPLY = replyForm.qREPLY.value;
			var qLEVEL = replyForm.qLEVEL.value;
			var qLEVELORDER = ${vo.qLEVELORDER};
			
			
			if(qCONTENT == "") {
				alert("답변을 입력하세요!");
				replyForm.qCONTENT.focus();
				return false;
			}
			var query = {
					qIDX : qIDX,
					gIDX : gIDX,
					qCONTENT : qCONTENT,
					qNAME : qNAME,
					mMID : ${smid},
					qTITLE : qTITLE,
					qSECRET : qSECRET,
					qREPLY : qREPLY,
					qLEVEL : qLEVEL,
					qLEVELORDER : qLEVELORDER
			}
			$.ajax({
				url : "${contextPath}/admin/writeQnaReply",
				type : "post",
				data : query,
				success : function(data) {
					if(data ==1) {
						alert("답변글을 등록하였습니다.");
						location.reload();
					}
				}
			});
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>상품문의</h3>
	</div>
	<table class="view-table">
		<tr>
			<td class="title-colored">제목</td>
			<td colspan="3">${vo.qTITLE}</td>
		</tr>
		<tr>
			<td class="title-colored">작성자</td>
			<td colspan="3">${vo.qNAME}</td>
		</tr>
		<tr>
			<td class="title-colored">상태</td>
			<td colspan="3">
				<c:if test="${vo.qREPLY=='답변대기중'}">
					<span class="badge badge-pill badge-secondary">${vo.qREPLY}</span>						
				</c:if>
				<c:if test="${vo.qREPLY=='답변완료'}">
					<span class="badge badge-pill badge-danger">${vo.qREPLY}</span>						
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="title-colored">작성일</td>
			<td style="width:200px">${fn:substring(vo.qWDATE,0,10)}</td>
			<td class="title-colored">공개 여부</td>
			<td>
				<c:if test="${vo.qPUBLIC=='Y'}">
					공개
				</c:if>
				<c:if test="${vo.qPUBLIC=='N'}">
					비공개
				</c:if>	
			</td>
		</tr>
		<tr>
			<td colspan="4" class="view-content">
	            <p>${fn:replace(vo.qCONTENT,newLine,"<br/>")}<br/></p>
		        <hr/>
			</td>
		</tr>
	</table>
	
	<div style="text-align: right">
		<input type="button" value="비공개 처리" id="qnaPrivateByAdmin" class="button-outline-small"/>
		<input type="button" value="목록" onclick="location.href='${contextPath}/admin/qna?pag=${pag}'" class="button-small"/>
	</div>
	
	<hr/>


	<c:if test="${vo.qREPLY=='답변대기중'}">
		<form name="replyForm">
			<label for="qCONTENT">답변 작성하기</label>
			<textarea name="qCONTENT" rows="5" class="form-control" placeholder="답변 작성하기"></textarea>
			<input type="hidden" name="gIDX" value="${vo.gIDX}"/> 
			<input type="hidden" name="qNAME" value="MarketKurly"/> 
			<input type="hidden" name="qTITLE" value="안녕하세요, 마켓컬리입니다."/> 
			<input type="hidden" name="qSECRET" value="N"/> 
			<input type="hidden" name="qREPLY" value="답변글"/> 
			<input type="hidden" name="qLEVEL" value="1"/> 
			<div style="text-align: right">
				<input type="button" value="등록" onclick="qnaReply()" class="button-small"/>
			</div>
		</form>
	</c:if>
	

</div>
</body>
</html>