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
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div class="subNav">
		<h2 style="font-weight: 600">&nbsp;고객센터</h2>
		<ul class="subNavMenu">
			<li><a href="${contextPath}/board/list">공지사항</a></li>
			<li><a href="${contextPath}/faq/list">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list" class="subNavMenuClicked">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">1:1문의</span>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:550px">제목</th>
				<th style="width:70px">작성일</th>
				<th style="width:50px">답변상태</th>
			</tr>
			<c:if test="${empty vos}">
				<tr>
					<td colspan="3" style="text-align: center">
						1:1문의 내역이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${!empty vos}">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td style="text-align: left;padding-left: 20px;"><a href="${contextPath}/inquiry/view?iIDX=${vo.iIDX}" class="title-decoration-none" >[${vo.iCATEGORY}] ${vo.iTITLE}</a></td>
						<td>${fn:substring(vo.iWDATE,0,10)}</td>
						<td>
							<c:if test="${vo.iREPLY=='답변대기중'}">
								<span class="badge badge-pill badge-secondary">${vo.iREPLY}</span>						
							</c:if>
							<c:if test="${vo.iREPLY=='답변완료'}">
								<span class="badge badge-pill badge-danger">${vo.iREPLY}</span>						
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<c:if test="${!empty smid}">
			<div style="text-align: right;">
				<input type="button" class="button-small" onclick="location.href='${contextPath}/inquiry/write'" value="글쓰기"/>
			</div>
		</c:if>
		
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>