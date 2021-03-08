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
			<li><a href="${contextPath}/board/list" class="subNavMenuClicked">공지사항</a></li>
			<li><a href="${contextPath}/faq/list">자주하는 질문</a></li>
			<li><a href="${contextPath}/inquiry/list">1:1문의</a></li>
		</ul>
	</div>
	<div class="section">
		<div>
			<span class="section-title">공지사항 </span><span class="explanation-gray">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요. </span>
		</div>
		<table class="list-table">
			<tr> 
				<th style="width:50px">번호</th>
				<th style="width:550px">제목</th>
				<th style="width:70px">작성자</th>
				<th style="width:70px">작성일</th>
				<th style="width:50px">조회</th>
			</tr>
			<c:forEach var="tVo" items="${vosTOP}">
				<tr>
					<td><b>공지</b></td>
					<td><b><a href="${contextPath}/board/view?bIDX=${tVo.bIDX}&pag=${p.pag}" class="title-decoration-none">${tVo.bTITLE}</a></b></td>
					<td><b>${tVo.bNAME}</b></td>
					<td><b>${fn:substring(tVo.bWDATE,0,10)}</b></td>
					<td><b>${tVo.bVIEWCNT}</b></td>
				</tr>
			</c:forEach>
			
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${curScrNo}</td>
					<td><a href="${contextPath}/board/view?bIDX=${vo.bIDX}&pag=${p.pag}" class="title-decoration-none">${vo.bTITLE}</a></td>
					<td>${vo.bNAME}</td>
					<td>${fn:substring(vo.bWDATE,0,10)}</td>
					<td>${vo.bVIEWCNT}</td>
				</tr>
				<c:set var="curScrNo" value="${curScrNo-1}"/>
			</c:forEach>
		</table>
		
		<c:if test="${sname=='관리자'}">
			<div style="text-align: right;">
				<input type="button" class="button-small" onclick="location.href='${contextPath}/board/write'" value="글쓰기"/>
			</div>
		</c:if>
		
		<!-- 페이징 처리 시작 -->
	    <div class="row">
	        <div class="col-12">
				<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:set var="startPageNum" value="${p.pag- (p.pag-1)%(p.blockSize)}"/>
		  			<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=1&pageSize=${p.pageSize}">◀</a></li>
					<c:if test="${p.pag != 1}">
			  			<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag-1}&pageSize=${p.pageSize}">◁</a></li>
					</c:if>
					<c:if test="${p.pag == 1}">
			  			<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=1&pageSize=${p.pageSize}">◁</a></li>
					</c:if>
					<c:forEach var="i" begin="0" end="2">
						<c:if test="${(startPageNum + i)<=p.totPage}">
							<c:if test="${(startPageNum + i)==p.pag}">
					  			<li class="page-item active"><b><a class="page-link" href="${contextPath}/board/list?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></b></li>
							</c:if>
							<c:if test="${(startPageNum + i)!=p.pag}">
								<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${startPageNum + i}&pageSize=${p.pageSize}">${startPageNum + i }</a></li>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${p.pag != p.totPage}">
						<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.pag+1}&pageSize=${p.pageSize}">▷</a></li>
					</c:if>
					<c:if test="${p.pag == p.totPage}">
						<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.totPage}&pageSize=${p.pageSize}">▷</a></li>
					</c:if>
					<li class="page-item"><a class="page-link" href="${contextPath}/board/list?pag=${p.totPage}&pageSize=${p.pageSize}">▶</a></li>
				</ul>            
            </div>
        </div>
      <!-- 페이징 처리 끝 -->		
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>