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
		});
		function inquiryReply() {
			var iIDX = "${vo.iIDX}";
			var irCONTENT = replyForm.irCONTENT.value;
			if(irCONTENT == "") {
				alert("답변을 입력하세요!");
				replyForm.irCONTENT.focus();
				return false;
			}
			var query = {
					iIDX : iIDX,
					irCONTENT : irCONTENT
			}
			$.ajax({
				url : "${contextPath}/admin/writeInquiryReply",
				type : "get",
				data : query,
				success : function(data) {
					if(data ==1) {
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
		<h3>1:1문의</h3>
	</div>
	<table class="view-table">
		<tr>
			<td class="title-colored">제목</td>
			<td colspan="3">[${vo.iCATEGORY}] ${vo.iTITLE}</td>
		</tr>
		<tr>
			<td class="title-colored">작성ID</td>
			<td colspan="3">${vo.mMID}</td>
		</tr>
		<tr>
			<td class="title-colored">상태</td>
			<td colspan="3">
				<c:if test="${vo.iREPLY=='답변대기중'}">
					<span class="badge badge-pill badge-secondary">${vo.iREPLY}</span>						
				</c:if>
				<c:if test="${vo.iREPLY=='답변완료'}">
					<span class="badge badge-pill badge-danger">${vo.iREPLY}</span>						
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="title-colored">작성일</td>
			<td style="width:200px">${fn:substring(vo.iWDATE,0,10)}</td>
			<td class="title-colored">주문번호</td>
			<td>
				<c:if test="${!empty vo.oNVOICE}">
					${vo.oNVOICE}
				</c:if>
				<c:if test="${empty vo.oNVOICE}">
					없음
				</c:if>	
			</td>
		</tr>
		<tr>
			<td colspan="4" class="view-content">
	            <!-- 이미지 파일  -->
            	<c:set var="orfname" value="${vo.iRFNAME}"/>
	            <c:set var="rfname" value="${vo.iRFNAME}"/>
	            <c:set var="rfnameLen" value="${fn:length(rfname)}"/>
	            <c:set var="rfname" value="${fn:substring(rfname, rfnameLen-4, rfnameLen-1)}"/>
	            <c:set var="rfname" value="${fn:toUpperCase(rfname)}"/>
	            <c:if test="${rfname=='JPG' || rfname=='GIF' || rfname=='PNG'}">
	               <c:set var="img" value="${fn:split(orfname,'/')}"/>
	               <c:forEach var="imgItem" items="${img}" varStatus="st">
	                   <img src="${contextPath}/resources/inquiry/${imgItem}" width="300px"/><br/><br/>
	               </c:forEach>
	            </c:if>
	            <br/>
	            <p>${fn:replace(vo.iCONTENT,newLine,"<br/>")}<br/></p>
		        <hr/>
			</td>
		</tr>
	</table>
	
	<div style="text-align: right">
		<c:if test="${smid==vo.mMID}">
			<input type="button" value="수정" onclick="updateCheck(${vo.iIDX})" class="button-outline-small"/>
			<input type="button" value="삭제" onclick="deleteCheck(${vo.iIDX})" class="button-outline-small"/>
		</c:if>
		<input type="button" value="목록" onclick="location.href='${contextPath}/admin/inquiry?pag=${pag}'" class="button-small"/>
	</div>
	
	<hr/>
	<c:if test="${!empty irCONTENT}">
		<form name="replyForm">
			<label for="irCONTENT">답변보기</label>
			<textarea name="irCONTENT" rows="5"  id="irCONTENT" readonly="readonly" class="form-control" >${irCONTENT}</textarea>
			<div style="text-align: right">
				<input type="button" value="수정" id="updateBtn" class="button-outline-small"/>
				<input type="button" value="등록" id="insertBtn" onclick="inquiryReply()" class="button-small"/>
			</div>
		</form>
	</c:if>

	<c:if test="${empty irCONTENT}">
		<form name="replyForm">
			<label for="irCONTENT">답변 작성하기</label>
			<textarea name="irCONTENT" rows="5" class="form-control" placeholder="답변 작성하기"></textarea>
			<div style="text-align: right">
				<input type="button" value="등록" onclick="inquiryReply()" class="button-small"/>
			</div>
		</form>
	</c:if>
	

</div>
</body>
</html>