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
			else location.href="${contextPath}/review/update?rIDX="+idx;			
		}
		
		function deleteCheck(idx) {
			var ans = confirm("삭제하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/review/delete?rIDX="+idx;			
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>후기 보기</h3>
	</div>
	<table class="view-table">
		<tr>
			<td class="title-colored">제목</td>
			<td colspan="3">${vo.rTITLE}</td>
		</tr>
		<tr>
			<td class="title-colored">작성자</td>
			<td colspan="3">${vo.rNAME}</td>
		</tr>
		<tr>
			<td class="title-colored">작성일</td>
			<td style="width:200px">${fn:substring(vo.rWDATE,0,10)}</td>
			<td class="title-colored">주문번호</td>
			<td>${vo.oNVOICE}</td>
		</tr>
		<tr>
			<td class="title-colored">조회수</td>
			<td style="width:200px">${vo.rVIEW}</td>
			<td class="title-colored">좋아요</td>
			<td>${vo.rHELP}</td>
		</tr>
		<tr>
			<td colspan="4" class="view-content">
	            <!-- 이미지 파일  -->
            	<c:set var="orfname" value="${vo.rRFNAME}"/>
	            <c:set var="rfname" value="${vo.rRFNAME}"/>
	            <c:set var="rfnameLen" value="${fn:length(rfname)}"/>
	            <c:set var="rfname" value="${fn:substring(rfname, rfnameLen-4, rfnameLen-1)}"/>
	            <c:set var="rfname" value="${fn:toUpperCase(rfname)}"/>
	            <c:if test="${rfname=='JPG' || rfname=='GIF' || rfname=='PNG'}">
	               <c:set var="img" value="${fn:split(orfname,'/')}"/>
	               <c:forEach var="imgItem" items="${img}" varStatus="st">
	                   <img src="${contextPath}/resources/review/${imgItem}" width="600px"/><br/><br/>
	               </c:forEach>
	            </c:if>
	            <br/>
	            <p>${fn:replace(vo.rCONTENT,newLine,"<br/>")}<br/></p>
		        <hr/>
			</td>
		</tr>
	</table>
	
<!-- 	
		<input type="button" value="수정" onclick="updateCheck(${vo.rIDX})" class="button-outline-small"/>
		<input type="button" value="삭제" onclick="deleteCheck(${vo.rIDX})" class="button-outline-small"/>
	 -->
	<div style="text-align: right">
		<input type="button" value="목록" onclick="location.href='${contextPath}/mypage/review'" class="button-small"/>
	</div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>