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
	<script>
		function updateCheck(idx) {
			var ans = confirm("수정하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/inquiry/update?iIDX="+idx;			
		}
		
		function deleteCheck(idx) {
			var ans = confirm("삭제하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/inquiry/delete?iIDX="+idx;			
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
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
	                   <img src="${contextPath}/resources/inquiry/${imgItem}" width="600px"/><br/><br/>
	               </c:forEach>
	            </c:if>
	            <br/>
	            <p>${fn:replace(vo.iCONTENT,newLine,"<br/>")}<br/></p>
		        <hr/>
			</td>
		</tr>
	</table>
	
 	<div style="text-align: right">
		<input type="button" value="목록" onclick="location.href='${contextPath}/inquiry/list'" class="button-small"/>
	</div> 
	
	<hr/>
	<c:if test="${!empty irCONTENT}">
		<form name="replyForm">
			<label for="irCONTENT">관리자 답변</label>
			<textarea name="irCONTENT" rows="5"  id="irCONTENT" readonly="readonly" class="form-control">${irCONTENT}</textarea>
		</form>
	</c:if>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>