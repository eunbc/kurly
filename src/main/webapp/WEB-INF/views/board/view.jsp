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
			else location.href="${contextPath}/board/update?bIDX="+idx+"&pag="+${pag};			
		}
		
		function deleteCheck(idx) {
			var ans = confirm("삭제하시겠습니까?");
			if(!ans) return false;
			else location.href="${contextPath}/board/delete?bIDX="+idx+"&pag="+${pag};			
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="content-default">
	<div class="view-title">
		<h3>공지사항</h3>
		<p class="explanation-gray">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
	</div>
	<table class="view-table">
		<tr>
			<td class="title-colored">제목</td>
			<td colspan="3">${vo.bTITLE}</td>
		</tr>
		<tr>
			<td class="title-colored">작성자</td>
			<td colspan="3">${vo.bNAME}</td>
		</tr>
		<tr>
			<td class="title-colored">작성일</td>
			<td style="width:200px">${fn:substring(vo.bWDATE,0,10)}</td>
			<td class="title-colored">조회수</td>
			<td>${vo.bVIEWCNT}</td>
		</tr>
		<tr>
			<td colspan="4">${vo.bCONTENT}</td>
		</tr>
	</table>
	
	<div style="text-align: right">
		<c:if test="${sname=='관리자'}">
			<input type="button" value="수정" onclick="updateCheck(${vo.bIDX})" class="button-outline-small"/>
			<input type="button" value="삭제" onclick="deleteCheck(${vo.bIDX})" class="button-outline-small"/>
		</c:if>
		<input type="button" value="목록" onclick="location.href='${contextPath}/board/list?pag=${pag}'" class="button-small"/>
	</div>
	
	<table class="view-table-move">
		<tr>
			<td>∧이전글</td>
			<td><a href="${contextPath}/board/view?bIDX=${prev.bIDX}&pag=${pag}">${prev.bTITLE}</a></td>
		</tr>
		<tr>
			<td>∨다음글</td>
			<td><a href="${contextPath}/board/view?bIDX=${next.bIDX}&pag=${pag}">${next.bTITLE}</a></td>
		</tr>
	</table>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>